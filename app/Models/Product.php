<?php
/**
 * Name: 产品信息模型.
 * User: 董坤鸿
 * Date: 2018/6/26
 * Time: 下午3:2
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    /**
     * 可以分配的属性。
     *
     * @var array
     */
    protected $fillable = [
        'title', 'description', 'image', 'on_sale',
        'rating', 'sold_count', 'review_count', 'price'
    ];

    /**
     * 应该被转换成原生类型的属性。
     *
     * @var array
     */
    protected $casts = [
        'on_sale' => 'boolean', //on_sale 是一个布尔类型字段
    ];

    /**
     * 与产品KU关联
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function skus()
    {
        return $this->hasMany(ProductSku::class);
    }

}
