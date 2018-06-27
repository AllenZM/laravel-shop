<?php
/**
 * Name: 商品控制器.
 * User: 董坤鸿
 * Date: 2018/6/26
 * Time: 下午4:7
 */

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    /**
     * 商品列表
     *
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Request $request)
    {
        $products = Product::query()->where('on_sale', true)->paginate(16);

        return view('products.index', ['products' => $products]);
    }
}
