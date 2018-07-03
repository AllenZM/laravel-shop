<?php
/**
 * Name: 订单评论事件.
 * User: 董坤鸿
 * Date: 2018/7/3
 * Time: 下午1:40
 */

namespace App\Events;

use App\Models\Order;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class OrderReviewd
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    protected $order;

    /**
     * 初始化
     * Create a new event instance.
     *
     * OrderReviewd constructor.
     * @param Order $order
     */
    public function __construct(Order $order)
    {
        $this->order = $order;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('channel-name');
    }

    /**
     * 获取订单
     *
     * @return Order
     */
    public function getOrder()
    {
        return $this->order;
    }
}
