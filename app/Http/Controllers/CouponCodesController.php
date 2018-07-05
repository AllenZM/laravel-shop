<?php
/**
 * Name: 产品控制器.
 * User: 董坤鸿
 * Date: 2018/7/5
 * Time: 下午12:47
 */

namespace App\Http\Controllers;

use App\Models\CouponCode;
use Carbon\Carbon;
use Illuminate\Http\Request;

class CouponCodesController extends Controller
{

    /**
     * 优惠券详情
     *
     * @param $code
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($code)
    {
        // 判断优惠券是否存在
        if (!$record = CouponCode::where('code', $code)->first()) {
            abort('404');
        }

        // 如果优惠券没有启用，则等同于优惠券不存在
        if (!$record->enabled) {
            abort('404');
        }

        if ($record->total - $record->used <= 0) {
            return response()->json(['message' => '该优惠券已被兑换完'], 403);
        }

        if ($record->not_before && $record->not_before->gt(Carbon::now())) {
            return response()->json(['message' => '该优惠券现在还不能使用'], 403);
        }

        if ($record->not_after && $record->not_after->lt(Carbon::now())) {
            return response()->json(['message' => '该优惠券已过期'], 403);
        }

        return $record;
    }
}
