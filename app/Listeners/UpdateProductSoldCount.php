<?php
/**
 * Name: 修改商品购买数监听器.
 * User: 董坤鸿
 * Date: 2018/7/2
 * Time: 下午3:16
 */

namespace App\Listeners;

use App\Events\OrderPaid;
use App\Models\OrderItem;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

// implements ShouldQueue 代表此监听是异步执行的
class UpdateProductSoldCount
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Laravel 会默认执行监听器的 handle 方法，触发的事件会作为 handle 方法的参数
     * Handle the event.
     *
     * @param  OrderPaid  $event
     * @return void
     */
    public function handle(OrderPaid $event)
    {
        // 从事件对象中取得对应的订单
        $order = $event->getOrder();
        // 循环遍历订单的商品
        foreach ($order->items as $item) {
            $product = $item->product;
            // 甲酸对应商品的销量
            $soldCount = OrderItem::query()
                ->where('product_id', $product->id)
                ->whereHas('order', function ($query) {
                    $query->whereNotNull('paid_at'); //关联的订单状态是已支付
                })->sum('amount');
            // 更新商品销量
            $product->update([
                'sold_count' => $soldCount,
            ]);
        }
    }
}
