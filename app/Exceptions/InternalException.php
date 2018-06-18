<?php
/**
 * Name: 系统内部异常.
 * User: 董坤鸿
 * Date: 2018/6/18
 * Time: 下午8:26
 */

namespace App\Exceptions;

use Exception;
use Illuminate\Http\Request;
use Throwable;

class InternalException extends Exception
{
    /**
     * 消息内容
     * @var string
     */
    protected $messageForUser;

    /**
     * 初始化
     *
     * InternalException constructor.
     * @param string $message
     * @param int $code
     * @param Throwable|null $previous
     * @param string $messageForUser
     */
    public function __construct(string $message = "", int $code = 0, Throwable $previous = null, $messageForUser = '系统内部错误')
    {
        parent::__construct($message, $code, $previous);
        $this->messageForUser = $messageForUser;
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
            return response()->json(['message' => $this->messageForUser], $this->code);
        }
        return view('pages.error', ['message' => $this->messageForUser]);
    }

}
