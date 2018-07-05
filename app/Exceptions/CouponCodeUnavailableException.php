<?php
/**
 * Name: 校验优惠码异常.
 * User: 董坤鸿
 * Date: 2018/7/5
 * Time: 下午1:52
 */

namespace App\Exceptions;

use Exception;
use Illuminate\Http\Request;
use Throwable;

class CouponCodeUnavailableException extends Exception
{
    /**
     * 初始化
     *
     * CouponCodeUnavailableException constructor.
     * @param string $message
     * @param int $code
     * @param Throwable|null $previous
     */
    public function __construct(string $message = "", int $code = 403, Throwable $previous = null)
    {
        parent::__construct($message, $code, $previous);
    }

    /**
     * 当这个异常呗触发时，会调用 render 方法来输出给用户
     *
     * @param Request $request
     * @return $this|\Illuminate\Http\JsonResponse
     */
    public function render(Request $request)
    {
        // 如果用户通过 Api 请求，则返回 JSON 格式的错误信息
        if ($request->expectsJson()) {
            return response()->json(['message' => $this->message], $this->code);
        }
        // 否则返回上一页并带有错误信息
        return redirect()->back()->withErrors(['coupon_code' => $this->message]);
    }

}
