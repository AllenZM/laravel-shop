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
    // 商品列表
    $router->get('products', 'ProductsController@index');
    // 创建商品
    $router->get('products/create', 'ProductsController@create');
    // 插入商品
    $router->post('products', 'ProductsController@store');
    // 编辑商品
    $router->get('products/{id}/edit', 'ProductsController@edit');
    // 修改商品
    $router->put('products/{id}', 'ProductsController@update');
    // 删除商品
    $router->delete('products/{id}', 'ProductsController@destroy');

    // 产品管理/订单管理
    // 订单列表
    $router->get('orders', 'OrdersController@index')->name('admin.orders.index');
    // 订单详情
    $router->get('orders/{order}', 'OrdersController@show')->name('admin.orders.show');
    // 订单发货
    $router->post('orders/{order}/ship', 'OrdersController@ship')->name('admin.orders.ship');
    // 订单退款
    $router->post('orders/{order}/refund', 'OrdersController@handleRefund')->name('admin.orders.handle_refund');

    // 优惠券管理
    // 优惠券列表
    $router->get('coupon_codes', 'CouponCodesController@index');

});
