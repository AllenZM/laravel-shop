<?php
/**
 * Name: 页面控制器.
 * User: 董坤鸿
 * Date: 2018/6/18
 * Time: 下午4:7
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PagesController extends Controller
{
    /**
     * 首页
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function root()
    {
        return view('pages.root');
    }

    /**
     * 邮箱校验通知页面
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function emailVerifyNotice()
    {
        return view('pages.email_verify_notice');
    }
}
