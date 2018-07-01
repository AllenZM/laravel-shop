<?php
/**
 * Name: 购物车服务.
 * User: 董坤鸿
 * Date: 2018/7/1
 * Time: 下午7:16
 */

namespace App\Services;

use App\Models\CartItem;
use Auth;

class CartService
{

    /**
     * 获取购物车数据
     *
     * @return mixed
     */
    public function get()
    {
        return Auth::user()->cartItems()->with(['productSku.product'])->get();
    }

    /**
     * 添加购物车数据
     *
     * @param $skuId
     * @param $amount
     * @return CartItem
     */
    public function add($skuId, $amount)
    {
        $user = Auth::user();
        // 从数据库中查询该商品是否已经在购物车中
        if ($item = $user->cartItems()->where('product_sku_id', $skuId)->first()) {
            // 如果存在则直接叠加商品数量
            $item->update([
                'amount' => $item->amount + $amount,
            ]);
        } else {
            // 否则创建一个新的购物车记录
            $item = new CartItem(['amount' => $amount]);
            $item->user()->associate($user);
            $item->productSku()->associate($skuId);
            $item->save();
        }
        return $item;
    }

    /**
     * 移除购物车数据
     *
     * @param $skuIds
     */
    public function remove($skuIds)
    {
        // 可以传当 ID，也可以传 ID 数组
        if (!is_array($skuIds)){
            $skuIds = [$skuIds];
        }
        Auth::user()->cartItems()->whereIn('product_sku_id', $skuIds)->delete();
    }

}