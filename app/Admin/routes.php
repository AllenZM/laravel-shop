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

    // 产品管理/商品管理
    $router->get('products', 'ProductsController@index');
    $router->get('products/create', 'ProductsController@create');
    $router->post('products', 'ProductsController@store');
    $router->get('products/{id}/edit', 'ProductsController@edit');
    $router->put('products/{id}', 'ProductsController@update');
    $router->delete('products/{id}', 'ProductsController@destroy');

    // 产品管理/订单管理
    $router->get('orders', 'OrdersController@index')->name('admin.orders.index');

});
