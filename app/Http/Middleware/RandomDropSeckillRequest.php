<?php
/**
 * Name: 随机拒绝中间件.
 * User: 董坤鸿
 * Date: 2018/11/1
 * Time: 上午11:34
 */

namespace App\Http\Middleware;

use App\Exceptions\InvalidRequestException;
use Closure;

class RandomDropSeckillRequest
{
    /**
     * $percent 参数是在路由添加中间件时传入
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @param $percent
     * @return mixed
     * @throws InvalidRequestException
     */
    public function handle($request, Closure $next, $percent)
    {
        if (random_int(0, 100) < (int)$percent) {
            throw new InvalidRequestException('参与的用户过多，请稍后再试', 403);
        }
        return $next($request);
    }
}
