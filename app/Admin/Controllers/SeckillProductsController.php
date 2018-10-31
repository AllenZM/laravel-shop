<?php


namespace App\Admin\Controllers;

use App\Models\Product;
use Encore\Admin\Form;
use Encore\Admin\Grid;

class SeckillProductsController extends CommonProductsController
{

    /**
     * 定义一个抽象方法，返回当前管理的商品类型
     *
     * @return string
     */
    public function getProductType()
    {
        return Product::TYPE_SECKILL;
    }

    /**
     * 定义一个抽象方法，各个类型的控制器将实现本方法来定义列表应该展示那些字段
     *
     * @param Grid $grid
     * @return mixed
     */
    protected function customGrid(Grid $grid)
    {
        $grid->id('ID')->sortable();
        $grid->title('商品名称');
        $grid->on_sale('已上架')->display(function ($value) {
            return $value ? '是' : '否';
        });
        $grid->price('价格');
        $grid->column('seckill.start_at', '开始时间');
        $grid->column('seckill.end_at', '结束时间');
        $grid->sold_count('销量');
    }

    /**
     * 定义一个抽象方法，各个类型的控制器将实现本方法来定义表单应该有哪些额外的字段
     *
     * @param Form $form
     * @return mixed
     */
    protected function customForm(Form $form)
    {
        // 秒杀相关字段
        $form->datetime('seckill.start_at', '秒杀开始时间')->rules('required|date');
        $form->datetime('seckill.end_at', '秒杀结束时间')->rules('required|date');
    }
}