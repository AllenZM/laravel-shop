<?php
/**
 * Name: 用户收货地址策略.
 * User: 董坤鸿
 * Date: 2018/6/26
 * Time: 上午12:09
 */

namespace App\Policies;

use App\Models\User;
use App\Models\UserAddress;
use Illuminate\Auth\Access\HandlesAuthorization;

class UserAddressPolicy
{
    use HandlesAuthorization;

    /**
     * 初始化
     *
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * 返回当前登录用户可以修改对应的地址
     *
     * @param User $user 用户信息
     * @param UserAddress $address 用户地址信息
     * @return bool
     */
    public function own(User $user, UserAddress $address)
    {
        return $address->user_id == $user->id;
    }
}
