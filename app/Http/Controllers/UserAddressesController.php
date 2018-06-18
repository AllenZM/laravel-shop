<?php
/**
 * Name: 用户收货地址控制器.
 * User: 董坤鸿
 * Date: 2018/6/18
 * Time: 下午9:10
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserAddressesController extends Controller
{

    /**
     * 用户地址列表
     *
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Request $request)
    {
        return view('user_addresses.index', [
            'addresses' => $request->user()->addresses,
        ]);
    }
}
