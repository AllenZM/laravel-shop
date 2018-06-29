<?php
/**
 * Name: 购物车模型.
 * User: 董坤鸿
 * Date: 2018/6/28
 * Time: 下午3:27
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CartItem extends Model
{
    //定义表名
    public $timestamps = false;

    /**
     * 可以分配的属性。
     *
     * @var array
     */
    protected $fillable = ['amount'];

    /**
     * 获取用户数据
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * 获取商品SKU数据
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function productSku()
    {
        return $this->belongsTo(ProductSku::class);
    }

}
