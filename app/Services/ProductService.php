<?php
/**
 * Name: 商品服务.
 * User: 董坤鸿
 * Date: 2018/7/1
 * Time: 下午7:36
 */

namespace App\Services;

use App\Models\Product;
use App\SearchBuilders\ProductSearchBuilder;

class ProductService
{

    /**
     * 获取猜你喜欢的商品
     *
     * @param Product $product
     * @param $amount
     * @return array
     */
    public function getSimilarProductIds(Product $product, $amount)
    {
        // 如果商品没有商品属性，则返回空
        if (count($product->properties) === 0) {
            return [];
        }

        $builder = (new ProductSearchBuilder())->onSale()->paginate($amount, 1);
        foreach ($product->properties as $property) {
            // 添加到 should 条件中
            $builder->propertyFilter($property->name, $property->value, 'should');
        }
        // 设置最少匹配一半属性
        $builder->minShouldMatch(ceil(count($product->properties) / 2));
        $params = $builder->getParams();
        // 同时将当前商品的 ID 排除
        $params['body']['query']['bool']['must_not'] = [['term' => ['_id' => $product->id]]];
        // 搜索
        $result = app('es')->search($params);

        return collect($result['hits']['hits'])->pluck('_id')->all();
    }

}