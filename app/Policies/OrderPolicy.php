<?php
/**
 * Name: 订单策略.
 * User: 董坤鸿
 * Date: 2018/7/1
 * Time: 下午5:04
 */

namespace App\Policies;

use App\Models\Order;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class OrderPolicy
{
    use HandlesAuthorization;

    /**
     * 初始化
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * 返回当前登录用户对应的订单
     *
     * @param User $user 用户信息
     * @param Order $order 订单信息
     * @return bool
     */
    public function own(User $user, Order $order)
    {
        return $order->user_id == $user->id;
    }
}
