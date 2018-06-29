<?php
/**
 * Name: 订单模型.
 * User: 董坤鸿
 * Date: 2018/6/29
 * Time: 上午11:42
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    //定义表名
    public $timestamps = false;

    /**
     * 可以分配的属性。
     *
     * @var array
     */
    protected $fillable = [
        'amount', 'price', 'rating', 'review', 'reviewed_at'
    ];

    /**
     * 需要转换成日期的属性。
     *
     * @var array
     */
    protected $dates = [
        'reviewed_at',
    ];

    /**
     * 获取商品
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    /**
     * 获取商品 SKU
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function productSku()
    {
        return $this->belongsTo(ProductSku::class);
    }

    /**
     * 获取订单
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function order()
    {
        return $this->belongsTo(Order::class);
    }

}
