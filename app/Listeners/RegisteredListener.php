<?php
/**
 * Name: 注册监听器.
 * User: 董坤鸿
 * Date: 2018/6/18
 * Time: 下午8:11
 */


namespace App\Listeners;

use App\Notifications\EmailVerificationNotification;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

// implements ShouldQueue 让这个监听器异步执行
class RegisteredListener implements ShouldQueue
{
    /**
     * 初始化
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * 获取到刚刚注册的用户
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle($event)
    {
        $user = $event->user;
        //调用 notify 发送通知
        $user->notify(new EmailVerificationNotification());
    }
}
