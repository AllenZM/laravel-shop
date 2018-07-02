<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Monolog\Logger;
use Yansongda\Pay\Pay;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        // 往服务容器中注入一个名为 ali_pay 的单例对象
        $this->app->singleton('ali_pay', function () {
            $config = config('payment.ali_pay');
            $config['notify_url'] = route('payment.ali_pay.notify');
            $config['return_url'] = route('payment.ali_pay.return');
            // 判断当前姓名运行环境是否为线上环境
            if (app()->environment() !== 'production') {
                $config['mode'] = 'dev';
                $config['log']['level'] = Logger::DEBUG;
            } else {
                $config['log']['level'] = Logger::WARNING;
            }
            // 调用 Yansongda\Pay 来创建一个支付宝支付对象
            return Pay::alipay($config);
        });

        // 往服务容器中注入一个名为 wechat_pay 的单例对象
        $this->app->singleton('wechat_pay', function () {
            $config = config('payment.wechat_pay');
            $config['notify_url'] = route('payment.wechat_pay.notify');
            if (app()->environment() !== 'production') {
                $config['log']['level'] = Logger::DEBUG;
            } else {
                $config['log']['level'] = Logger::WARNING;
            }
            // 调用 Yansongda\Pay 来创建一个微信支付对象
            return Pay::wechat($config);
        });
    }
}
