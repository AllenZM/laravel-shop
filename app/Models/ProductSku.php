<?php
/**
 * Name: 产品SKU模型.
 * User: 董坤鸿
 * Date: 2018/6/26
 * Time: 下午3:3
 */

namespace App\Models;

use App\Exceptions\InternalException;
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

    /**
     * 减库存
     *
     * @param $amount
     * @return int
     * @throws InternalException
     */
    public function decreaseStock($amount)
    {
        if ($amount < 0) {
            throw new InternalException('减库存不可以小于0');
        }
        return $this->newQuery()->where('id', $this->id)->where('stock', '>=', $amount)->decrement('stock', $amount);
    }

    /**
     * 加库存
     *
     * @param $amount
     * @throws InternalException
     */
    public function addStock($amount)
    {
        if ($amount < 0) {
            throw new InternalException('加库存不可小于0');
        }
        $this->increment('stock', $amount);
    }


}
