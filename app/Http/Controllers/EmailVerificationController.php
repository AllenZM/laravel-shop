<?php
/**
 * Name: 激活链接控制器.
 * User: 董坤鸿
 * Date: 2018/6/18
 * Time: 下午6:52
 */

namespace App\Http\Controllers;

use App\Models\User;
use App\Notifications\EmailVerificationNotification;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class EmailVerificationController extends Controller
{
    /**
     * 验证邮箱
     *
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @throws Exception
     */
    public function verify(Request $request)
    {
        // 从 url 中获取 `email` 和 `token` 两个参数
        $email = $request->input('email', '');
        $token = $request->input('token', '');
        if (!$email || !$token) {
            throw new Exception('验证链接不正确');
        }

        // 从缓存中读取数据，我们把从 url 中获取的 `token` 与缓存中的值做对比
        // 如果缓存不存在或者返回的值与 url 中的 `token` 不一致就跑出异常。
        if ($token != Cache::get('email_verification_' . $email)) {
            throw  new Exception('验证链接不正确或已过期');
        }

        // 根据邮箱从数据库中获取对应的用户
        // 通常来说能通过 token 校验的情况不可能出现用户不存在
        // 但是为了代码的健壮性我们还是需要做这个判断
        if (!$user = User::where('email', $email)->first()) {
            throw new Exception('用户不存在');
        }

        // 将制定的 key 从缓存中删除，由于已经完成验证，这个缓存就没有必要继续保留。
        Cache::forget('email_verification_' . $email);

        // 最关键的，要把对应用户的 `email_verified` 字段改为 `true`。
        $user->update(['email_verified' => true]);

        // 最后告知用户邮箱验证成功。
        return view('pages.success', ['message' => '邮箱验证成功']);
    }

    /**
     * 发送邮件
     *
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @throws Exception
     */
    public function send(Request $request)
    {
        $user = $request->user();
        // 判断用户身份已经激活
        if ($user->email_verified){
            throw new Exception('您已经验证过邮箱了');
        }

        // 调用 notify() 方法用户来发送我们定义号的通知类型
        $user->notify(new EmailVerificationNotification());
        return view('pages.success', ['message' => '邮件发送成功']);
    }

}
