<?php
/**
 * Name: 用户错误行为触发的异常.
 * User: 董坤鸿
 * Date: 2018/6/18
 * Time: 下午8:26
 */

namespace App\Exceptions;

use Exception;
use Illuminate\Http\Request;
use Throwable;

class InvalidRequestException extends Exception
{
    /**
     * 初始化
     * InvalidRequestException constructor.
     * @param string $message
     * @param int $code
     * @param Throwable|null $previous
     */
    public function __construct(string $message = "", int $code = 0, Throwable $previous = null)
    {
        parent::__construct($message, $code, $previous);
    }

    /**
     * 该异常被触发时系统会调用 render() 方法来输出。
     *
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\JsonResponse|\Illuminate\View\View
     */
    public function render(Request $request)
    {
        if ($request->expectsJson()) {
            // json() 方法第二个参数就是 Http 返回码
            return response()->json(['message' => $this->message], $this->code);
        }

        return view('pages.error', ['message' => $this->message]);
    }

}
