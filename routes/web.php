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
    });
});

// 商品-列表
Route::get('products', 'ProductsController@index')->name('products.index');
// 商品-详情
Route::get('products/{product}', 'ProductsController@show')->name('products.show');
