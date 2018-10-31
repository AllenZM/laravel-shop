<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Jobs\SyncOneProductToES;
use App\Models\Category;
use App\Models\Product;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;

abstract class CommonProductsController extends Controller
{
    use HasResourceActions;

    /**
     * 定义一个抽象方法，返回当前管理的商品类型
     *
     * @return mixed
     */
    abstract public function getProductType();

    /**
     * 列表
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header(Product::$typeMap[$this->getProductType()])
            ->description('列表')
            ->body($this->grid());
    }

    /**
     * 编辑
     *
     * @param $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header(Product::$typeMap[$this->getProductType()])
            ->description('编辑')
            ->body($this->form()->edit($id));
    }

    /**
     * 创建
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header(Product::$typeMap[$this->getProductType()])
            ->description('创建')
            ->body($this->form());
    }

    /**
     * 生成器
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Product());

        // 筛选出当前类型的商品，默认 ID 倒序排列
        $grid->model()->where('type', $this->getProductType())->orderBy('id', 'DESC');
        // 定义自定义方法
        $this->customGrid($grid);

        $grid->actions(function ($actions) {
            $actions->disableView();
            $actions->disableDelete();
        });
        $grid->tools(function ($tools) {
            $tools->batch(function ($batch) {
                $batch->disableDelete();
            });
        });

        return $grid;
    }

    /**
     * 定义一个抽象方法，各个类型的控制器将实现本方法来定义列表应该展示那些字段
     *
     * @param Grid $grid
     * @return mixed
     */
    abstract protected function customGrid(Grid $grid);

    /**
     *
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Product());
        // 在表单页面中添加一个名为 type 的隐藏字段，值为当前商品类型
        $form->hidden('type')->value($this->getProductType());
        $form->text('title', '商品名称')->rules('required');
        $form->text('long_title', '商品上标题')->rules('required');
        $form->select('category_id', '类目')->options(function ($id) {
            $category = Category::find($id);
            if ($category) {
                return [$category->id => $category->full_name];
            }
        })->ajax('/admin/api/categories?is_directory=0');
        $form->image('image', '封面图片')->rules('required|image');
        $form->editor('description', '商品描述')->rules('required');
        $form->radio('on_sale', '上架')->options(['1' => '是', '0' => '否'])->default('0');

        // 调用自定义方法
        $this->customForm($form);

        $form->hasMany('skus', '商品 SKU', function (Form\NestedForm $form) {
            $form->text('title', 'SKU 名称')->rules('required');
            $form->text('description', 'SKU 描述')->rules('required');
            $form->text('price', '单价')->rules('required|numeric|min:0.01');
            $form->text('stock', '剩余库存')->rules('required|integer|min:0');
        });

        // 放在 SKU 下面
        $form->hasMany('properties', '商品属性', function (Form\NestedForm $form) {
            $form->text('name', '属性名')->rules('required');
            $form->text('value', '属性值')->rules('required');
        });

        $form->saving(function (Form $form) {
            $form->model()->price = collect($form->input('skus'))->where(Form::REMOVE_FLAG_NAME, 0)->min('price') ?: 0;
        });

        $form->saved(function (Form $form) {
            $product = $form->model();
            $this->dispatch(new SyncOneProductToES($product));
        });

        return $form;
    }

    /**
     * 定义一个抽象方法，各个类型的控制器将实现本方法来定义表单应该有哪些额外的字段
     *
     * @param Form $form
     * @return mixed
     */
    abstract protected function customForm(Form $form);
}