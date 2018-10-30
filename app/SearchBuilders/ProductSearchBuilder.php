<?php
/**
 * Name: 查询构造器.
 * User: 董坤鸿
 * Date: 2018/10/30
 * Time: 上午11:7
 */

namespace App\SearchBuilders;

use App\Models\Category;

class ProductSearchBuilder
{

    /**
     * 初始化查询
     *
     * @var array
     */
    protected $params = [
        'index' => 'products',
        'type'  => '_doc',
        'body'  => [
            'query' => [
                'bool' => [
                    'filter' => [],
                    'must'   => [],
                ],
            ],
        ],
    ];

    /**
     * 添加分页查询
     *
     * @param $size
     * @param $page
     * @return $this
     */
    public function paginate($size, $page)
    {
        $this->params['body']['from'] = ($page - 1) * $size;
        $this->params['body']['size'] = $size;

        return $this;
    }

    /**
     * 筛选上架状态的商品
     *
     * @return $this
     */
    public function onSale()
    {
        $this->params['body']['query']['bool']['filter'][] = ['term' => ['on_sale' => true]];

        return $this;
    }

    /**
     * 按类目筛选商品
     *
     * @param Category $category
     */
    public function category(Category $category)
    {
        if ($category->is_directory) {
            $this->params['body']['query']['bool']['filter'][] = [
                'prefix' => ['category_path' => $category->path.$category->id.'-'],
            ];
        } else {
            $this->params['body']['query']['bool']['filter'][] = ['term' => ['category_id' => $category->id]];
        }
    }

    /**
     * 添加搜索词
     *
     * @param $keywords
     * @return $this
     */
    public function keywords($keywords)
    {
        // 如果参数不是数组则转为数组
        $keywords = is_array($keywords) ? $keywords : [$keywords];
        foreach ($keywords as $keyword) {
            $this->params['body']['query']['bool']['must'][] = [
                'multi_match' => [
                    'query'  => $keyword,
                    'fields' => [
                        'title^3',
                        'long_title^2',
                        'category^2',
                        'description',
                        'skus_title',
                        'skus_description',
                        'properties_value',
                    ],
                ],
            ];
        }

        return $this;
    }

    /**
     * 分面搜索的聚合
     *
     * @return $this
     */
    public function aggregateProperties()
    {
        $this->params['body']['aggs'] = [
            'properties' => [
                'nested' => [
                    'path' => 'properties',
                ],
                'aggs'   => [
                    'properties' => [
                        'terms' => [
                            'field' => 'properties.name',
                        ],
                        'aggs'  => [
                            'value' => [
                                'terms' => [
                                    'field' => 'properties.value',
                                ],
                            ],
                        ],
                    ],
                ],
            ],
        ];

        return $this;
    }

    /**
     * 添加一个按商品属性筛选的条件
     *
     * @param $name
     * @param $value
     * @return $this
     */
    public function propertyFilter($name, $value)
    {
        $this->params['body']['query']['bool']['filter'][] = [
            'nested' => [
                'path'  => 'properties',
                'query' => [
                    ['term' => ['properties.search_value' => $name.':'.$value]],
                ],
            ],
        ];

        return $this;
    }

    /**
     * 添加排序
     *
     * @param $field
     * @param $direction
     * @return $this
     */
    public function orderBy($field, $direction)
    {
        if (!isset($this->params['body']['sort'])) {
            $this->params['body']['sort'] = [];
        }
        $this->params['body']['sort'][] = [$field => $direction];

        return $this;
    }

    /**
     * 返回构造好的查询参数
     *
     * @return array
     */
    public function getParams()
    {
        return $this->params;
    }

}