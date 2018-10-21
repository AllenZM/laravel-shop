<?php

return [

    /**
     * 站点标题
     * Laravel-admin name.
     */
    'name' => '管理系统',

    /**
     * 页面顶部 Logo
     * Logo in admin panel header.
     */
    'logo' => '<b>涂呀网</b> 管理系统',

    /**
     * 页面顶部小 Logo
     * Mini-logo in admin panel header.
     */
    'logo-mini' => '<b>涂呀</b>',

    /**
     * 路由配置
     * Route configuration.
     */
    'route' => [

        // 路由前缀
        'prefix' => 'admin',

        // 控制器命名空间前缀
        'namespace' => 'App\\Admin\\Controllers',

        // 默认中间件列表
        'middleware' => ['web', 'admin'],
    ],

    /**
     * Laravel-Admin 的安装目录
     * Laravel-admin install directory.
     */
    'directory' => app_path('Admin'),

    /**
     * Laravel-Admin 页面标题
     * Laravel-admin html title.
     */
    'title' => '涂呀网商城管理系统',

    /**
     * 是否使用 https
     * Use `https`.
     */
    'secure' => false,

    /**
     * Laravel-Admin 用户认证设置
     * Laravel-admin auth setting.
     */
    'auth' => [
        'guards' => [
            'admin' => [
                'driver'   => 'session',
                'provider' => 'admin',
            ],
        ],

        'providers' => [
            'admin' => [
                'driver' => 'eloquent',
                'model'  => Encore\Admin\Auth\Database\Administrator::class,
            ],
        ],
    ],

    /**
     * Laravel-Admin 文件上传设置
     * Laravel-admin upload setting.
     */
    'upload' => [
        // 对应 filesystem.php 中的 disks
        'disk' => 'admin',

        'directory' => [
            'image' => 'images',
            'file'  => 'files',
        ],
    ],

    /**
     * Laravel-Admin 数据库设置
     * Laravel-admin database setting.
     */
    'database' => [

        // 数据库连接名称，留空即可
        // Database connection for following tables.
        'connection' => '',

        // 管理员用户表及模型
        // User tables and model.
        'users_table' => 'admin_users',
        'users_model' => Encore\Admin\Auth\Database\Administrator::class,

        // 角色表及模型
        // Role table and model.
        'roles_table' => 'admin_roles',
        'roles_model' => Encore\Admin\Auth\Database\Role::class,

        // 权限表及模型
        // Permission table and model.
        'permissions_table' => 'admin_permissions',
        'permissions_model' => Encore\Admin\Auth\Database\Permission::class,

        // 菜单表及模型
        // Menu table and model.
        'menu_table' => 'admin_menu',
        'menu_model' => Encore\Admin\Auth\Database\Menu::class,

        // 多对多关联中间表
        // Pivot table for table above.
        'operation_log_table'    => 'admin_operation_log',
        'user_permissions_table' => 'admin_user_permissions',
        'role_users_table'       => 'admin_role_users',
        'role_permissions_table' => 'admin_role_permissions',
        'role_menu_table'        => 'admin_role_menu',
    ],

    /**
     * Laravel-Admin 操作日志设置
     * By setting this option to open or close operation log in laravel-admin.
     */
    'operation_log' => [

        'enable' => true,

        /**
         * 不记操作日志的路由
         * Routes that will not log to database.
         *
         * All method to path like: admin/auth/logs
         * or specific method to path like: get:admin/auth/logs
         */
        'except' => [
            'admin/auth/logs*',
        ],
    ],

    /**
     * 页面风格
     * @see https://adminlte.io/docs/2.4/layout
     */
    'skin' => 'skin-blue-light',

    /*
    |---------------------------------------------------------|
    |LAYOUT OPTIONS | fixed                                   |
    |               | layout-boxed                            |
    |               | layout-top-nav                          |
    |               | sidebar-collapse                        |
    |               | sidebar-mini                            |
    |---------------------------------------------------------|
     */
    'layout' => ['sidebar-mini', 'sidebar-collapse'],

    /**
     * 登录页面中的背景图像
     * Background image in login page
     */
    'login_background_image' => '',

    /**
     * 页面底部展示的版本.
     * Version displayed in footer.
     */
    'version' => '1.0.0',

    /**
     * 扩展设置.
     * Settings for extensions.
     */
    'extensions' => [

    ],
];
