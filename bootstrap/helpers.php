<?php
/**
 * Name: 自定义辅助函数.
 * User: 董坤鸿
 * Date: 2018/6/18
 * Time: 下午3:50
 */

use Illuminate\Support\Facades\Route;

if (! function_exists('route_class')) {

    /**
     * 当前请求的路由名称转换为CSS类名称
     *
     * @return mixed
     */
    function route_class()
    {
        return str_replace('.', '-', Route::currentRouteName());
    }
}