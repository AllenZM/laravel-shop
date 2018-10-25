<?php
/**
 * Name: 分期支付控制器.
 * User: 董坤鸿
 * Date: 2018/10/24
 * Time: 下午5:52
 */

namespace App\Http\Controllers;

use App\Events\OrderPaid;
use App\Exceptions\InvalidRequestException;
use App\Models\Installment;
use Carbon\Carbon;
use Endroid\QrCode\QrCode;
use Illuminate\Http\Request;

class InstallmentsController extends Controller
{
    /**
     * 分期列表
     *
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Request $request)
    {
        $installments = Installment::query()
            ->where('user_id', $request->user()->id)
            ->paginate(10);

        return view('installments.index', ['installments' => $installments]);
    }

    /**
     * 分期详情
     *
     * @param Installment $installment
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function show(Installment $installment)
    {
        $this->authorize('own', $installment);
        // 取出当前分期付款的所有的还款计划，并按还款顺序排序
        $items = $installment->items()->orderBy('sequence')->get();

        return view('installments.show', [
            'installment' => $installment,
            'items' => $items,
            // 下一个未完成还款的还款计划
            'nextItem' => $items->where('paid_at', null)->first(),
        ]);
    }

    /**
     * 分期支付宝支付
     *
     * @param Installment $installment
     * @return mixed
     * @throws InvalidRequestException
     */
    public function payByAliPay(Installment $installment)
    {
        if ($installment->order->closed) {
            throw new InvalidRequestException('对应的商品订单已被关闭');
        }
        if ($installment->status === Installment::STATUS_FINISHED) {
            throw new InvalidRequestException('该分期订单已结清');
        }

        // 获取当前分期付款最近的一个未支付的还款计划
        if (!$nextItem = $installment->items()->whereNull('paid_at')->orderBy('sequence')->first()) {
            // 如果没有未支付的还款，原则上不可能，因为如果分期结算清则在上一个判断就退出了
            throw new InvalidRequestException('该分期订单已结清');
        }

        // 调用支付宝的网页支付
        return app('ali_pay')->web([
            // 支付订单号使用分期流水号+还款计划编号
            'out_trade_no' => $installment->no . '_' . $nextItem->sequence,
            'total_amount' => $nextItem->total,
            'subject' => '支付 涂呀商城 的分期订单：' . $installment->no,
            // 这里的 notify_url 和 return_url 可以覆盖掉在 AppServiceProvider 设置的回调地址
            'notify_url' => ngrok_url('installments.ali_pay.notify'),
            'return_url' => route('installments.ali_pay.return'),
        ]);
    }

    /**
     * 支付宝前端回调
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function aliPayReturn()
    {
        try{
            app('ali_pay')->verify();
        }catch (\Exception $exception){
            return view('pages.error', ['msg' => '数据不正确']);
        }

        return view('pages.success', ['msg' => '付款成功']);
    }

    /**
     * 支付宝后端回调
     *
     * @return string
     */
    public function aliPayNotify()
    {
        // 校验支付宝回调数是否正确
        $data = app('ali_pay')->verify();
        if ($this->paid($data->out_trade_no, 'alipay', $data->trade_no)) {
            return app('ali_pay')->success();
        }

        return 'fail';
    }

    /**
     * 分期微信支付
     *
     * @param Installment $installment
     * @return \Illuminate\Contracts\Routing\ResponseFactory|\Symfony\Component\HttpFoundation\Response
     * @throws InvalidRequestException
     */
    public function payByWeChat(Installment $installment)
    {
        if ($installment->order()->closed) {
            throw new InvalidRequestException('对应的商品订单已被关闭');
        }

        if ($installment->status === Installment::STATUS_FINISHED) {
            throw new InvalidRequestException('该分期订单已结清');
        }

        if (!$nextItem = $installment->items()->whereNull('paid_at')->orderBy('sequence')->first()) {
            throw new InvalidRequestException('该分期订单已结清');
        }

        $wechat_order = app('wechat_pay')->scan([
            'out_trade_no' => $installment->no . '_' . $nextItem->sequence,
            'total_fee' => $nextItem->total * 100,
            'body' => '支付 涂呀商城 的分期订单：' . $installment->no,
            'notify_url' => ngrok_url('installments.wechat_pay.notify'),
        ]);

        // 把要转换的字符串作为 QrCode 的构造函数参数
        $qr_code = new QrCode($wechat_order->code_url);

        // 将生成的二维码图片数据已字符串形式输出，并带上响应的响应类型
        return response($qr_code->writeString(), 200, ['Content-Type' => $qr_code->getContentType()]);
    }

    /**
     * 微信支付回调
     *
     * @return string
     */
    public function weChatNotify()
    {
        $data = app('wechat_pay')->verify();
        if ($this->paid($data->out_trade_no, 'wechatpay', $data->trade_no)) {
            return app('wechat_pay')->success();
        }

        return 'fail';
    }

    /**
     * 支付[支付宝支付/微信支付]
     *
     * @param $outTradeNo
     * @param $paymentMethod
     * @param $paymentNo
     * @return bool
     */
    protected function paid($outTradeNo, $paymentMethod, $paymentNo)
    {
        // 拉起支付时使用的支付订单号是由分期流水号 + 付款计划编号组成的
        // 因此可以通过支付订单号来还原这笔还款是哪个分期付款的哪个还款计划
        list($no, $sequence) = explode('_', $outTradeNo);

        // 根据分期流水号查询对应的分期记录，原则上不会找不到，这里判断只是增强代码的健壮性
        if (!$installment = Installment::where('no', $no)->first()) {
            return false;
        }

        // 根据还款计划编号查询对应的还款计划，原则上不会找不到，这里判断只是增强代码的健壮性
        if (!$item = $installment->items()->where('sequence', $sequence)->first()) {
            return false;
        }

        // 如果这个还款计划的支付状态是已支付，则告知支付宝此订单已完成，并不在执行后续逻辑
        if ($item->paid_at) {
            return false;
        }

        // 更新对应的还款计划
        $item->update([
            'paid_at' => Carbon::now(),  // 支付时间
            'payment_method' => $paymentMethod,  // 支付方式
            'payment_no' => $paymentNo,  // 支付宝订单号
        ]);

        // 如果这是第一笔还款
        if (!$item->sequence === 0) {
            // 分期付款的状态改为还款中
            $installment->updae(['status' => Installment::STATUS_REPAYING]);
            // 将分期付款对应的商品订单状态改为已支付
            $installment->order->update([
                'paid_at' => Carbon::now(),
                'payment_method' => 'installment', // 支付方式为分期付款
                'payment_no' => $no, // 支付订单号为分期付款的流水号
            ]);
            // 触发商品订单已支付的事件
            event(new OrderPaid($installment->order));
        }
        // 如果这是最后一笔还款
        if ($item->sequence === $installment->count - 1) {
            // 将分期付款状态改为已结清
            $installment->update(['status' => Installment::STATUS_FINISHED]);
        }

        return true;
    }
}
