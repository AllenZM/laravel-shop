<?php
/**
 * Name: 产品属性模型.
 * User: 董坤鸿
 * Date: 2018/10/27
 * Time: 下午2:2
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductProperty extends Model
{
    protected $fillable = ['name', 'value'];

    // 没有 created_at 和 updated_at 字段
    public $timestamps = false;

    /**
     * 获取商品信息
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }
}
