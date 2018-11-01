## 涂呀网商城
- 产品名称：Laravel Shop
- 项目代号：laravel-shop
- 官方地址：https://github.com/buqiu/laravel-shop

> laravel-shop 基于 Laravel5.6 一步一步构建一套电商系统。使用 Laravel-Admin 快速构建管理后台、支付宝和微信支付的回调通知处理、Laravel 项目中对异常的处理、购物车设计、商品 SKU 数据结构设计、通过延迟队列自动关闭订单、MySQL 事务处理、库存增减的正确姿势、无限级分类、Elasticsearch、分面搜索、代码部署、负载均衡、压力测试、接口性能优化、随机拒绝等电商开发相关的高级技术概念。

## 功能

![_big](https://github.com/buqiu/laravel-shop/blob/master/doc/功能.png)

## 功能如下

- 用户中心；
- 收货地址；
- 电商管理后台；
- 权限管理；
- 商品管理；
- 商品 SKU；
- 购物车模块；
- 订单模块；
- 支付模块（支付宝、微信支付）；
- 商品评价；
- 商品收藏；
- 订单退款流程；
- 优惠券模块；
- 电商安全须知；
- 数据备份。
- 高性能无限级分类；
- 众筹商品管理；
- 众筹商品下单逻辑；
- 众筹商品结束逻辑；
- 使用分期付款支付订单；
- 计算分期付款逾期费；
- 分期付款订单的退款；
- 给商品增加属性；
- 使用 Elasticsearch 重构商品搜索模块；
- 分面搜索；
- 相似商品查询；
- Elasticsearch 的索引迁移；
- 秒杀商品管理；
- 秒杀商品下单逻辑；
- 秒杀接口性能优化；
- 编写部署脚本；
- 多机部署实现负载均衡。

## 运行环境要求

- Nginx 1.15+
- PHP 7.2+
- Mysql 5.7+
- Redis 3.0+
- Elasticsearch 6.0+

## 开发环境部署/安装

本项目代码使用 PHP 框架 [Laravel 5.6](https://d.laravel-china.org/docs/5.6/) 开发，本地开发环境使用 [Laravel Homestead](https://d.laravel-china.org/docs/5.5/homestead)。

下文将在假定读者已经安装好了 Homestead 的情况下进行说明。如果您还未安装 Homestead，可以参照 [Homestead 安装与设置](https://laravel-china.org/docs/5.5/homestead#installation-and-setup) 进行安装配置。

### 基础安装

#### 1. 克隆源代码

克隆 `larabbs` 源代码到本地：

    > git clone git@github.com:buqiu/laravel-shop.git

#### 2. 配置本地的 Homestead 环境

1). 运行以下命令编辑 Homestead.yaml 文件：

```shell
homestead edit
```

2). 加入对应修改，如下所示：

```
folders:
    - map: ~/my-path/laravel-shop/ # 你本地的项目目录地址
      to: /home/vagrant/laravel-shop

sites:
    - map: shop.test
      to: /home/vagrant/laravel-shop/public

databases:
    - larabbs
```

3). 应用修改

修改完成后保存，然后执行以下命令应用配置信息修改：

```shell
homestead provision
```

随后请运行 `homestead reload` 进行重启。

#### 3. 安装扩展包依赖

    composer install

#### 4. 生成配置文件

```
cp .env.example .env
```

你可以根据情况修改 `.env` 文件里的内容，如数据库连接、缓存、邮件设置等。


#### 5. 生成秘钥

```shell
php artisan key:generate
```

#### 6. 生成数据表及生成测试数据

在 Homestead 的网站根目录下运行以下命令

```shell
$ php artisan migrate --seed
```

初始的用户角色权限已使用数据迁移生成。


#### 7. 配置 hosts 文件

    echo "192.168.10.10   shop.test" | sudo tee -a /etc/hosts

### 前端框架安装

1). 安装 node.js

直接去官网 [https://nodejs.org/en/](https://nodejs.org/en/) 下载安装最新版本。

2). 安装 Yarn

请按照最新版本的 Yarn —— http://yarnpkg.cn/zh-Hans/docs/install

3). 安装 Laravel Mix

```shell
yarn install
```

4). 编译前端内容

```shell
// 运行所有 Mix 任务...
npm run dev

// 运行所有 Mix 任务并缩小输出..
npm run production
```

5). 监控修改并自动编译

```shell
npm run watch

// 在某些环境中，当文件更改时，Webpack 不会更新。如果系统出现这种情况，请考虑使用 watch-poll 命令：
npm run watch-poll
```

### 链接入口

* 首页地址：http://shop.test/
* 管理后台：http://shop.test/admin

管理员账号密码如下:

```
username: admin
password: admin
```

至此, 安装完成 ^_^。

## 自定义 Artisan 命令

| 命令行名字 | 说明 | Cron | 代码调用 |
| --- | --- | --- | --- |
| `cron:calculate-installment-fine` | 计算分期付款逾期费| 每天凌晨 00:00 执行 | 无|
| `cron:finish-crowdfunding` | 结束众筹| 每分钟执行一次 | 无 |
| `es:migrate` |  Elasticsearch 索引结构迁 | 无 | 无 |
| `es:sync-products` | 将商品数据同步到 Elasticsearch | 无 | ProjectIndex::rebuild |

## 队列清单

| 名称 | 说明 | 调用时机 |
| --- | --- | --- |
| OrderPaid.php | 订单支付 | 订单支付（修改商品数、订单支付成功发邮件、支付成功后更新众筹进度） |
| OrderReviewd.php | 订单评论 | 订单评论（修改商品评价数） |