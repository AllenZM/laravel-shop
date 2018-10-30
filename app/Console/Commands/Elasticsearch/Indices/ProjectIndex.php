<?php
/**
 * Name: 项目索引.
 * User: 董坤鸿
 * Date: 2018/10/30
 * Time: 下午7:7
 */

namespace App\Console\Commands\Elasticsearch\Indices;

use Illuminate\Support\Facades\Artisan;

class ProjectIndex
{
    /**
     * 获取别名
     *
     * @return string
     */
    public static function getAliasName()
    {
        return 'products';
    }

    /**
     * 获取索引字段
     *
     * @return array
     */
    public static function getProperties()
    {
        return [
            'type' => ['type' => 'keyword'],
            'title' => ['type' => 'text', 'analyzer' => 'ik_smart', 'search_analyzer' => 'ik_smart_synonym'],
            'long_title' => ['type' => 'text', 'analyzer' => 'ik_smart', 'search_analyzer' => 'ik_smart_synonym'],
            'category_id' => ['type' => 'integer'],
            'category' => ['type' => 'keyword'],
            'category_path' => ['type' => 'keyword'],
            'description' => ['type' => 'text', 'analyzer' => 'ik_smart'],
            'price' => ['type' => 'scaled_float', 'scaling_factor' => 100],
            'on_sale' => ['type' => 'boolean'],
            'rating' => ['type' => 'float'],
            'sold_count' => ['type' => 'integer'],
            'review_count' => ['type' => 'integer'],
            'skus' => [
                'type' => 'nested',
                'properties' => [
                    'title' => [
                        'type' => 'text',
                        'analyzer' => 'ik_smart',
                        'search_analyzer' => 'ik_smart_synonym',
                        'copy_to' => 'skus_title',
                    ],
                    'description' => [
                        'type' => 'text',
                        'analyzer' => 'ik_smart',
                        'copy_to' => 'skus_description',
                    ],
                    'price' => ['type' => 'scaled_float', 'scaling_factor' => 100],
                ],
            ],
            'properties' => [
                'type' => 'nested',
                'properties' => [
                    'name' => ['type' => 'keyword'],
                    'value' => ['type' => 'keyword', 'copy_to' => 'properties_value'],
                    'search_value' => ['type' => 'keyword'],
                ],
            ],
        ];
    }

    /**
     * 获取索引设置
     *
     * @return array
     */
    public static function getSettings()
    {
        return [
            'analysis' => [
                'analyzer' => [
                    'ik_smart_synonym' => [
                        'type' => 'custom',
                        'tokenizer' => 'ik_smart',
                        'filter' => ['synonym_filter'],
                    ],
                ],
                'filter' => [
                    'synonym_filter' => [
                        'type' => 'synonym',
                        'synonyms_path' => 'analysis/synonyms.txt',
                    ],
                ],
            ],
        ];
    }

    /**
     * 把商品数索引到具体的索引
     *
     * @param $index_name
     */
    public static function rebuild($index_name)
    {
        // 通过 Artisan 类的 call 方法可以直接调用命令
        // call 方法的第二个参数可以用数组的方式给命令传递参数
        Artisan::call('es:sync-products', ['--index' => $index_name]);
    }
}