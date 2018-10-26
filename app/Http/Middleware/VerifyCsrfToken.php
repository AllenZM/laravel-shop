<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array
     */
    protected $except = [
        'payment/ali_pay/notify',
        'payment/wechat_pay/notify',
        'payment/wechat_pay/refund_notify',
        'installments/ali_pay_notify',
        'installments/wechat_pay/notify',
        'installments/wechat_pay/refund_notify'
    ];
}
