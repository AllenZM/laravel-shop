<?php
/**
 * Name: 产品控制器.
 * User: 董坤鸿
 * Date: 2018/7/5
 * Time: 下午12:47
 */

namespace App\Http\Controllers;

use App\Exceptions\CouponCodeUnavailableException;
use App\Models\CouponCode;

class CouponCodesController extends Controller
{

    /**
     * 优惠券详情
     *
     * @param $code
     * @return mixed
     * @throws CouponCodeUnavailableException
     */
    public function show($code)
    {
        // 判断优惠券是否存在
        if (!$record = CouponCode::where('code', $code)->first()) {
            throw new CouponCodeUnavailableException('优惠券不存在');
        }

        $record->checkAvailable();

        return $record;
    }
}
