<?php
/**
 * Name: 支付成功后更新众筹进度监听器.
 * User: 董坤鸿
 * Date: 2018/10/23
 * Time: 上午10:11
 */

namespace App\Listeners;

use App\Events\OrderPaid;
use App\Models\Order;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\DB;

class UpdateCrowdfundingProductProgress
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
     * Handle the event.
     *
     * @param  OrderPaid  $event
     * @return void
     */
    public function handle(OrderPaid $event)
    {
        $order = $event->getOrder();
        // 如果订单类型不是众筹商品订单，无需处理
        if ($order->type !== Order::TYPE_CROWDFUNDING){
            return;
        }

        $crowdfunding = $order->items[0]->product->crowdfunding;

        $data = Order::query()
            // 查出订单类型为众筹订单
            ->where('type', Order::TYPE_CROWDFUNDING)
            // 并且是已支付的
            ->whereNotNull('paid_at')
            ->whereHas('items', function ($query) use ($crowdfunding){
                // 并且包含了本商品
                $query->where('product_id', $crowdfunding->product_id);
            })
            ->first([
                // 取出订单总金额
                DB::raw('sun(total_amount) as total_amount'),

                // 取出去重的支持用户数
                DB::raw('count(distinct(user_id)) as user_count')
            ]);
        $crowdfunding->update([
            'total_amount' => $data->total_amount,
            'user_count' => $data->user_count,
        ]);
    }
}
