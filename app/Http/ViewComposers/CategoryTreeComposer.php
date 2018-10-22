<?php
/**
 * Name: 栏目树模板注入.
 * User: 董坤鸿
 * Date: 2018/10/22
 * Time: 上午11:20
 */

namespace App\Http\ViewComposers;

use App\Services\CategoryService;
use Illuminate\View\View;

class CategoryTreeComposer
{

    protected $categoryService;

    /**
     * 使用 Laravel 的依赖注入，自动注入我们所有需要的 categoryService 类
     *
     * CategoryTreeComposer constructor.
     * @param CategoryService $categoryService
     */
    public function __construct(CategoryService $categoryService)
    {
        $this->categoryService = $categoryService;
    }

    /**
     * 当渲染指定的模板时，Laravel 会调用 compose 方法
     *
     * @param View $view
     */
    public function compose(View $view)
    {
        // 使用 with 方法注入变量
        $view->with('category_tree', $this->categoryService->getCategoryTree());
    }
}