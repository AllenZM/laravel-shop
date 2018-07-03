<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// 首页
//Route::get('/', 'PagesController@root')->name('root');
Route::redirect('/', '/products')->name('root');

// 用户认证
Auth::routes();

Route::group(['middleware' => 'auth'], function() {
    // 邮箱验证通知
    Route::get('/email_verify_notice', 'PagesController@emailVerifyNotice')->name('email_verify_notice');
    // 邮箱验证
    Route::get('/email_verification/verify', 'EmailVerificationController@verify')->name('email_verification.verify');
    // 发送邮件
    Route::get('/email_verification/send', 'EmailVerificationController@send')->name('email_verification.send');
    // 中间件验证身份邮箱验证
    Route::group(['middleware' => 'email_verified'], function() {
        // 用户地址-列表
        Route::get('user_addresses', 'UserAddressesController@index')->name('user_addresses.index');
        // 用户地址-新增
        Route::get('user_addresses/create', 'UserAddressesController@create')->name('user_addresses.create');
        // 用户地址-插入
        Route::post('user_addresses', 'UserAddressesController@store')->name('user_addresses.store');
        // 用户地址-编辑
        Route::get('user_addresses/{user_address}', 'UserAddressesController@edit')->name('user_addresses.edit');
        // 用户地址-修改
        Route::put('user_addresses/{user_address}', 'UserAddressesController@update')->name('user_addresses.update');
        // 用户地址-删除
        Route::delete('user_addresses/{user_address}', 'UserAddressesController@destroy')->name('user_addresses.destroy');

        // 商品-收藏
        Route::post('products/{product}/favorite', 'ProductsController@favor')->name('products.favor');
        // 商品-取消收藏
        Route::delete('products/{product}/favorite', 'ProductsController@disfavor')->name('products.disfavor');
        // 商品-收藏列表
        Route::get('products/favorites', 'ProductsController@favorites')->name('products.favorites');
        // 购物车-列表
        Route::get('cart', 'CartController@index')->name('cart.index');
        // 购物车-加入
        Route::post('cart', 'CartController@add')->name('cart.add');
        // 购物车-移除商品
        Route::delete('cart/{sku}', 'CartController@remove')->name('cart.remove');
        // 订单-订单列表
        Route::get('orders', 'OrdersController@index')->name('orders.index');
        // 订单-插入订单
        Route::post('orders', 'OrdersController@store')->name('orders.store');
        // 订单-订单详情
        Route::get('orders/{order}', 'OrdersController@show')->name('orders.show');
        // 订单-订单评论展示
        Route::get('orders/{order}/review', 'OrdersController@review')->name('orders.review.show');
        // 订单-订单评论提交
        Route::post('orders/{order}/review', 'OrdersController@sendReview')->name('orders.review.store');
        // 订单-确认收货
        Route::post('orders/{order}/received', 'OrdersController@received')->name('orders.received');
        // 订单-申请退款
        Route::post('orders/{order}/apply_refund', 'OrdersController@applyRefund')->name('orders.apply_refund');
        // 订单支付-支付宝支付
        Route::get('payment/{order}/ali_pay', 'PaymentController@payByAliPay')->name('payment.ali_pay');
        // 订单支付-支付宝支付前端回调
        Route::get('payment/ali_pay/return', 'PaymentController@aliPayReturn')->name('payment.ali_pay.return');
        // 订单支付-微信支付
        Route::get('payment/{order}/wechat_pay', 'PaymentController@payByWeChat')->name('payment.wechat_pay');
    });
});

// 商品-列表
Route::get('products', 'ProductsController@index')->name('products.index');
// 商品-详情
Route::get('products/{product}', 'ProductsController@show')->name('products.show');
// 订单支付-支付宝支付服务器回调
Route::post('payment/ali_pay/notify', 'PaymentController@alipayNotify')->name('payment.ali_pay.notify');
// 订单支付-微信支付服务器回调
Route::post('payment/wechat_pay/notify', 'PaymentController@weChatNotify')->name('payment.wechat_pay.notify');
