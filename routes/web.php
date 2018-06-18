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
Route::get('/', 'PagesController@root')->name('root');

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

    });
});
