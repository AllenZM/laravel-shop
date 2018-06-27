<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    // 欢迎页面
    $router->get('/', 'HomeController@index');

    // 用户管理
    $router->get('users', 'UsersController@index');

});
