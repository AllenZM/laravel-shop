<?php
/**
 * Name: 邮箱验证通知模块.
 * User: 董坤鸿
 * Date: 2018/6/18
 * Time: 下午6:34
 */

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;

class EmailVerificationNotification extends Notification
{
    use Queueable;

    /**
     * 初始化
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * 我们只需要通过邮件通知，因此这里只需要一个mail即可
     * Get the notification's delivery channels.
     *
     * @param  mixed $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * 发送邮件时会调用此方法来构建邮件内容，参数就是 App\Models\User 对象
     * Get the mail representation of the notification.
     *
     * @param  mixed $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        // 使用 Laravel 内置 Str 类生成随机字符串的函数，参数就是要生成的字符串长度
        $token = Str::random(16);
        Cache::put('email_verification_' . $notifiable->email, $token, 1800);
        $url = route('email_verification.verify', ['email' => $notifiable->email, 'token' => $token]);
        return (new MailMessage)
            ->greeting($notifiable->name . '您好：')
            ->subject('注册成功，请验证您的邮箱')
            ->line('请点击下方链接验证您的邮箱')
            ->action('验证', $url)
            ->line('感谢您使用涂呀网商城！');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
