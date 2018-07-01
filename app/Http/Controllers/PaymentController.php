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

}
