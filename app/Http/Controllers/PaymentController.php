<?php
/**
 * Name: 支付控制器.
 * User: 董坤鸿
 * Date: 2018/7/1
 * Time: 下午9:27
 */

namespace App\Http\Controllers;

use App\Exceptions\InvalidRequestException;
use App\Models\Order;
use Carbon\Carbon;
use Endroid\QrCode\QrCode;
use Illuminate\Http\Request;

class PaymentController extends Controller
{

    /**
     * 支付宝支付
     *
     * @param Order $order
     * @param Request $request
     * @return mixed
     * @throws InvalidRequestException
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function payByAliPay(Order $order, Request $request)
    {
        // 判断订单是否属于当前用户
        $this->authorize('own', $order);
        // 订单已支付或者已关闭
        if ($order->paid_at || $order->closed){
            throw new InvalidRequestException('订单状态不正确');
        }

        // 调用支付宝的网页支付
        return app('ali_pay')->web([
            'out_trade_no' => $order->no,   // 订单编号，需保证在商户端不重复
            'total_amount' => $order->total_amount, //订单金额，单位元，支持小数点后两位
            'subject' => '支付宝涂呀网商城的订单：' . $order->no,   //订单标题
        ]);
    }

    /**
     * 支付宝支付前端回调页面
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function aliPayReturn()
    {
        try{
            app('ali_pay')->verify();
        }catch (\Exception $exception){
            return view('pages.error', ['message' => '数据不正确']);
        }
        return view('pages.success', ['message' => '付款成功']);
    }

    /**
     * 支付宝支付服务器回调页面
     */
    public function aliPayNotify()
    {
        // 校验输入参数
        $data = app('ali_pay')->verify();
        // $data->out_trade_no 拿到订单流水号，并在数据库中查询
        $order = Order::where('no', $data->out_trade_no)->first();
        // 正常来说不太可能吹按支付了一笔不存在的订单，这个判断只是加强系统健壮性。
        if (!$order) {
            return 'fail';
        }
        // 如果这笔订单的状态是已经支付
        if ($order->paid_at) {
            // 返回数据给支付宝
            return app('ali_pay')->success();
        }
        $order->update([
            'paid_at' => Carbon::now(), // 支付时间
            'payment_method' => 'alipay',   // 支付方式
            'payment_no' => $data->trade_no, //支付宝订单号
        ]);

        return app('ali_pay')->success();
    }

    /**
     * 微信支付
     *
     * @param Order $order
     * @param Request $request
     * @return mixed
     * @throws InvalidRequestException
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function payByWeChat(Order $order, Request $request)
    {
        // 校验权限
        $this->authorize('own', $order);
        // 校验订单状态
        if ($order->paid_at || $order->closed) {
            throw new InvalidRequestException('订单状态不正确');
        }
        // scan 方法为拉起微信扫码支付
        $wechatOrder = app('wechat_pay')->scan([
            'out_trade_no' => $order->no,   // 商户订单流水号，与支付宝 out_trade_no 一样
            'total_fee' => $order->total_amount * 100, //与支付宝不同，微信支付的金额单位是分。
            'body' => '支付宝涂呀网商城的订单：' . $order->no, // 订单描述
        ]);
        // 把药转换的字符串作为 QrCode 的构造函数参数
        $qrCode = new QrCode($wechatOrder->code_url);

        // 将生产的二维码图片数据以字符串形式输出，并带上相应的响应类型
        return response($qrCode->writeString(), 200, ['Content_Type' => $qrCode->getContentType()]);
    }

    /**
     * 微信支付服务器回调页面
     *
     * @return string
     */
    public function weChatNotify()
    {
        // 校验回调参数是否正确
        $data = app('wechat_pay')->verify();
        // 找到对应的订单
        $order = Order::where('no', $data->out_trade_no)->first();
        // 订单不存在则告知微信支付
        if (!$order) {
            return 'fail';
        }
        // 订单已支付
        if ($order->paid_at){
            // 告知微信支付此订单已处理
            return app('wechat_pay')->success();
        }

        // 将订单标记为已支付
        $order->update([
            'paid_at' => Carbon::now(),
            'payment_method' => 'wechatpay',
            'payment_no' => $data->transaction_id
        ]);

        return app('wechat_pay')->success();
    }

}
