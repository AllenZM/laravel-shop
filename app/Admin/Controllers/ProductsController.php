<?php
/**
 * Name: 产品控制器.
 * User: 董坤鸿
 * Date: 2018/6/26
 * Time: 下午3:33
 */

namespace App\Admin\Controllers;

use App\Models\Category;
use App\Models\Product;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;

class ProductsController extends CommonProductsController
{
    /**
     * 商品类型
     *
     * @return string
     */
    public function getProductType()
    {
        return Product::TYPE_NORMAL;
    }


    /**
     * 定义一个抽象方法，各个类型的控制器将实现本方法来定义列表应该展示那些字段
     *
     * @param Grid $grid
     * @return mixed
     */
    protected function customGrid(Grid $grid)
    {
        $grid->model()->with(['category']);
        $grid->id('ID')->sortable();
        $grid->title('商品名称');
        $grid->column('category.name', '类目');
        $grid->on_sale('已上架')->display(function ($value) {
            return $value ? '是' : '否';
        });
        $grid->price('价格');
        $grid->rating('评分');
        $grid->sold_count('销量');
        $grid->review_count('评论数');
    }

    /**
     * 定义一个抽象方法，各个类型的控制器将实现本方法来定义表单应该有哪些额外的字段
     *
     * @param Form $form
     * @return mixed
     */
    protected function customForm(Form $form)
    {
        // TODO: 普通商品没有额外的字段，因此这里不需要写任何代码
    }
}
