<?php
/**
 * Name: 邮箱验证中间件.
 * User: 董坤鸿
 * Date: 2018/6/18
 * Time: 下午5:34
 */

namespace App\Http\Middleware;

use Closure;

class CheckIfEmailVerified
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (!$request->user()->email_verified) {
            return redirect(route('email_verify_notice'));
        }
        return $next($request);
    }

}
