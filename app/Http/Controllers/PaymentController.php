<?php
/**
 * Name: 支付控制器.
 * User: 董坤鸿
 * Date: 2018/7/1
 * Time: 下午9:27
 */

namespace App\Http\Controllers;

use App\Exceptions\InvalidRequestException;
use App\Models\Installment;
use App\Models\Order;
use Carbon\Carbon;
use Endroid\QrCode\QrCode;
use Illuminate\Http\Request;
use App\Events\OrderPaid;
use Illuminate\Validation\Rule;
use function Symfony\Component\VarDumper\Dumper\esc;

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
        $this->afterPaid($order);

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
        $this->afterPaid($order);

        return app('wechat_pay')->success();
    }

    /**
     * 微信支付退款
     *
     * @param Request $request
     * @return string
     */
    public function weChatRefundNotify(Request $request)
    {
        // 给微信的失败响应
        $failXml = '<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[FAIL]]></return_msg></xml>';
        // 把请求的 xml 内容解析成数组
        $input = parse_xml($request->getContent());
        // 如果解析失败或者没有必要的字段，则返回错误
        if (!$input || !isset($input['req_info'])) {
            return $failXml;
        }
        // 对请求中的 req_info 字段进行 base64 解码
        $encryptedXml = base64_decode($input['req_info'], true);
        // 对解码后的 req_info 字段进行 AES 解码
        $decryptedXml = openssl_decrypt($encryptedXml, 'AES-256-ECB', md5(config('payment.wechat_pay.key')), OPENSSL_RAW_DATA, '');
        // 如果解码失败则返回错误
        if (!$decryptedXml) {
            return $failXml;
        }
        // 解析解密后的 xml
        $decryptedData = parse_xml($decryptedXml);
        // 没有找到对应的订单，原则上不可能发生，保证代码健壮性
        if (!$order = Order::where('no', $decryptedData['out_trade_no'])->first()) {
            return $failXml;
        }
        if ($decryptedData['refund_status'] === 'SUCCESS') {
            // 退款成功，将订单退款状态改成退款成功
            $order->update([
                'refund_status' => Order::REFUND_STATUS_SUCCESS,
            ]);
        } else {
            // 退款失败，将具体状态存入 extra 字段，并表退款状态改变失败
            $extra = $order->extra;
            $extra['refund_failed_code'] = $decryptedData['refund_status'];
            $order->update([
                'refund_status' => Order::REFUND_STATUS_FAILED,
            ]);
        }
        return '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
    }

    /**
     * 支付后调用订单支付成功事件
     *
     * @param Order $order
     */
    protected function afterPaid(Order $order)
    {
        event(new OrderPaid($order));
    }

    /**
     * 支付分期
     *
     * @param Order $order
     * @param Request $request
     * @return Installment
     * @throws InvalidRequestException
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function payByInstallment(Order $order, Request $request)
    {
        // 判断订单是否属于当期用户
        $this->authorize('own', $order);

        // 订单已支付或已关闭
        if ($order->paid_at || $order->closed) {
            throw new InvalidRequestException('订单状态不正确');
        }

        // 校验用户提交的还款月数，数值必须是我们配置好的费率期数
        $this->validate($request, [
            'count' => ['required', Rule::in(array_keys(config('app.installment_fee_rate')))],
        ]);

        // 删除同一笔商品订单发起过其他的状态是未支付的分期付款，避免同一笔商品订单有多个分期付款
        Installment::query()
            ->where('order_id', $order->id)
            ->where('status', Installment::STATUS_PENDING)
            ->delete();
        $count = $request->input('count');

        // 创建一个新的分期付款对象
        $installment = new Installment([
            // 总本金即为商品订单总金额
            'total_amount' => $order->total_amount,
            // 分期期数
            'count' => $count,
            // 从配置文件中读取相应期数的费率
            'fee_rate' => config('app.installment_fee_rate')[$count],
            // 从配置文件中读取当前逾期费率
            'fine_rate' => config('app.installment_fine_rate'),
        ]);
        $installment->user()->associate($request->user());
        $installment->order()->associate($order);
        $installment->save();

        // 第一期的还款截止日期为明天凌晨 0 点
        $due_date = Carbon::tomorrow();
        // 计算每一期的本金
        $base = big_number($order->total_amount)->divide($count)->getValue();
        // 计算每一期的手续费
        $fee = big_number($base)->multiply($installment->fee_rate)->divide(100)->getValue();
        // 根据用户选择的还款期数，创建对应数量的还款计划
        for ($i = 0; $i < $count; $i++) {
            // 最后一期的本金需要用总本金减去前面几期的本金
            if ($i === $count - 1) {
                $base = big_number($order->total_amount)->subtract(big_number($base)->multiply($count - 1));
            }
            $installment->items()->create([
                'sequence' => $i,
                'base' => $base,
                'fee' => $fee,
                'due_date' => $due_date,
            ]);
            // 还款截止日期加 30 天
            $due_date = $due_date->copy()->addDay(30);
        }

        return $installment;
    }

}
