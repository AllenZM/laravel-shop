<?php

return [
    // 支付宝支付
    'ali_pay' => [
        'app_id' => '',
        'ali_public_key' => '',
        'private_key' => '',
        'log' => [
            'file' => storage_path('logs/ali_pay.log'),
        ],
    ],
    // 微信支付
    'wechat_pay' => [
        'app_id' => '',
        'mch_id' => '',
        'key' => '',
        'cert_client' => '',
        'cert_key' => '',
        'log' => [
            'file' => storage_path('logs/wechat_pay.log'),
        ],
    ],
];