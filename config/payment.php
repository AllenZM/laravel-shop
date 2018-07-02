<?php

return [
    // 支付宝支付
    'ali_pay' => [
        'app_id' => env('ALI_PAY_APP_ID', ''), //支付宝 app id
        'ali_public_key' => 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1yGxv/3HKOmE/Jr5E3iS/pz9smCy6Kmg3J6HnyBz2ETeWzgWPftAwrN83/qq7mCIMO01XlU0RUVAoMQyKnOoEjM2wnKs9KG6UTUwzD1tj0rmE/o5hroB5DP9JnNKKcligjHk4hm4XeM4R/Ucsedhs8ubfbyIuQQDo0j5F1OkGJxP02ubLSTHapZKhcfp3wRAbA4MMHpUw7ggtGhNNvoNuJ3uCGBKnKE/ylB0O3/eqOZ4Jq0wEL84t2HCaM9l/eINrGiydK22Nkrvg1+TBAmj4/z5/fRcSksQpzL89olIO/dNVpx4SATG0QDhd6c/RWAAAHI3yFGaetTqVlZ2y2nmhwIDAQAB',
        'private_key' => 'MIIEpQIBAAKCAQEAzl6cS8aaHKnLS5XNQQSyxjvxk7rNQypvtDCTHdw46sqpZwOGSD+XNpi5UvJj6RaMIAbSMa6Wv8wU/FPUD81YtLFkhjsWih6O8RsRaVEX8IeRTJd0W9Tgs896vFWfd7RQxyCbYsTAHbeowTrYgA/Ol3J83n1wv7Og7+9G3sHAvK3FMnJyXkt7OC4Ens8TEUmBpjKp0Iy9IuMvdfXZ7Pq9tt4fR2rs8vKHSvWYa2gSI0tnk9wN7F9Jo9mFY7+6ViQ0lnxOU98ngnVLnzBSKACddLkfxDAnV8yF9Yp4AWkbpZWdbKQ+oVsxe5S/oZKE1Msd6Q1Hukpuz0yR4/AcZ0ZjUQIDAQABAoIBAQChcbaIOVh7MAIQoaKvSMOq/V4iGjNWZi55Ir8UzyHf3KfmJQW6I7ViStxAncu3n6IDtBJgN5tLdJa+R75Qlm7c/SINONCLQRjGWkymvYAi9YugBaRL6x/Wy2vTRpC4juHaxhGJlS5OkU19zVFt7e/K3w/85tl7v0UaL3Cb96uWbls9J78pECYtDnhXQM/XVEgeHBedBqmz6R4nltRZrdr3bIgvAnpSKns5HOxGBkett6J5jDVTCoP2p5UdSVjSKenzaBirTbAIH6PmE/erGG3FT+3lqC1a4ZOrSrNKyrn3gSiq6aBNNZqJpmcO2qvlG/CpGF9OaIxEUhUSrw1KTE6hAoGBAO8FSD0f8zd8VdeeNc61GTkJcP5IGKOTnwpenL520j8DLXyXgZsBuHJsgJ01rbN7qD83A2quoUO74up6VYtj9Fv6wpKfa5c6/tVgU+cJ89+gZzlVhKao8DaAqmO8NwjI33ZAeNLCP2rQ9VCjerjl0yVfyiQQnapnNU8dfzaO54plAoGBAN0HjSawe3C3W3qyj0PmaLWSR6DXkGCmSmVhON8kOBxAB9aWpxLx+Ms4wLX4RO6JwvkkLigIi7oQXs3HI6tUFFK8F04Oy85nuGRC9MGkzhfEiHMSdKSCPzZgYai62DuTSUp+b4g9Egz0QeXdHpBJPvwi1k5cSpkZ+dWH2x9rc5B9AoGAEMIrDXYXBHXoQuTp2uNhsFkUHhAKAjYQeZamoMgN97MOVmT9BlQ5jXREFEG2OxZZdo0x5SH3VptuzofjRZGtiWFskQEydvkA8w788v8EpVJGyoNPeKvxo7Cjwbhpl2kWGeFtV0GdVqzt9khwC1S52C3+K0cq9s6jszdbOwUMAO0CgYEAsucH0wcKAyQGgXvCBl2a50yteXzBudkfYouc8tBoMkWJkqGCPg1pKWSYZzG66bDMBcjJK1Ivdr0FX14OewClKopf+qhzQnAlidHANnTk88v5/do0W2upKqQ8p8wEdcQzkH5iXE3CLIYQSLP/px4CQycXe3msT9v8ol9Cd14LvikCgYEApVHtP9qtcWJCuZT0qy1X9Q/uc4M+0GXNNABrqG7Ormm9lveOQ/yWpRnEvkKMci3hV2INFGXLdMMoSjssb3J8xlFv7ieloIWxrbvZqPENSj2S8167ijQozhPOdP6Qi3Fyno56sowhYCqfObF3Xl4MvNlWMzZOxfbrBGrZyNc8QNM=',
        'log' => [
            'file' => storage_path('logs/ali_pay.log'),
        ],
    ],
    // 微信支付
    'wechat_pay' => [
        'app_id' => env('WECHAT_PAY_APP_ID', ''), // 公众号 app id
        'mch_id' => '', //商户号
        'key' => '',    //API 密钥
        'cert_client' => resource_path('wechat_pay/apiclient_cert.pem'),
        'cert_key' => resource_path('wechat_pay/apiclient_cert.pem'),
        'log' => [
            'file' => storage_path('logs/wechat_pay.log'),
        ],
    ],
];