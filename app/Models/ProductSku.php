<?php
/**
 * Name: 产品SKU模型.
 * User: 董坤鸿
 * Date: 2018/6/26
 * Time: 下午3:3
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductSku extends Model
{
    /**
     * 可以分配的属性。
     *
     * @var array
     */
    protected $fillable = [
        'title', 'description', 'price', 'stock'
    ];

    /**
     * 获取产品信息
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
