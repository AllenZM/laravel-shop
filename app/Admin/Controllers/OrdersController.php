<?php
/**
 * Name: 订单控制器.
 * User: 董坤鸿
 * Date: 2018/7/2
 * Time: 下午4:11
 */

namespace App\Admin\Controllers;

use App\Exceptions\InternalException;
use App\Exceptions\InvalidRequestException;
use App\Http\Requests\Admin\HandleRefundRequest;
use Illuminate\Http\Request;
use App\Models\Order;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;
use Illuminate\Support\Facades\Auth;

class OrdersController extends Controller
{
    use ModelForm;

    /**
     * 订单列表
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header('订单');
            $content->description('列表');

            $content->body($this->grid());
        });
    }

    /**
     * Edit interface.
     *
     * @param $id
     * @return Content
     */
    public function edit($id)
    {
        return Admin::content(function (Content $content) use ($id) {

            $content->header('header');
            $content->description('description');

            $content->body($this->form()->edit($id));
        });
    }

    /**
     * Create interface.
     *
     * @return Content
     */
    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header('header');
            $content->description('description');

            $content->body($this->form());
        });
    }

    /**
     * 订单详情
     *
     * @param Order $order
     * @return Content
     */
    public function show(Order $order)
    {
        return Admin::content(function (Content $content) use ($order){
            $content->header('订单');
            $content->description('详情');
            // body 方法可以接受 Laravel 的试图为参数
            $content->body(view('admin.orders.show', ['order' => $order]));
        });
    }

    /**
     * 订单发货
     *
     * @param Order $order
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     * @throws InvalidRequestException
     */
    public function ship(Order $order, Request $request)
    {
        // 判断当前订单是否已经支付
        if (!$order->paid_at){
            throw new InvalidRequestException('该订单未支付');
        }
        // 判断当前订单发货状态是否为未发货
        if ($order->ship_status !== Order::SHIP_STATUS_PENDING){
            throw new InvalidRequestException('该订单已发货');
        }
        // Laravel 5.5 之后 validate 方法可以返回校验过的值
        $data = $this->validate($request, [
            'express_company' => ['required'],
            'express_no'    => ['required'],
        ],[],[
            'express_company' => '物流公司',
            'express_no' => '物流单号',
        ]);
        // 将订单发货状态改为已发货，并存入物流信息
        $order->update([
            'ship_status' => Order::SHIP_STATUS_DELIVERED,
            // 我们在 Order 模型的 $casts 属性里指明了 ship_data 是一个数组
            // 因此这里可以直接吧数组传递过去
            'ship_data' => $data,
        ]);
        // 妇女会上一页
        return redirect()->back();
    }

    /**
     * 生成器
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(Order::class, function (Grid $grid) {
            // 只展示支付的订单，并且默认按支付时间倒序排序
            $grid->model()->whereNotNull('paid_at')->orderBy('paid_at', 'DESC');
            $grid->no('订单流水号');
            // 展示关联关系的字段时，使用 column 方法
            $grid->column('user.name', '买家');
            $grid->totlal_amount('总金额')->sortable();
            $grid->paid_at('支付时间')->sortable();
            $grid->ship_status('物流')->display(function ($value) {
                return Order::$shipStatusMap[$value];
            });
            $grid->refund_status('退款状态')->display(function ($value) {
                return Order::$refundStatusMap[$value];
            });
            // 禁用创建按钮，后台不需要创建订单
            $grid->disableCreateButton();
            $grid->actions(function ($actions) {
                // 禁用删除和编辑按钮
                $actions->disableDelete();
                $actions->disableEdit();
                //$actions->append('<a class="btn btn-xs btn-primary" href="'.route('admin.orders.show', [$actions->getKey()]).'">查看</a>');
            });
            $grid->tools(function ($tools) {
                // 禁用批量删除按钮
                $tools->batch(function ($batch) {
                    $batch->disableDelete();
                });
            });
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(Order::class, function (Form $form) {

            $form->display('id', 'ID');

            $form->display('created_at', 'Created At');
            $form->display('updated_at', 'Updated At');
        });
    }

    /**
     * 处理退款
     *
     * @param Order $order
     * @param HandleRefundRequest $request
     * @return Order
     * @throws InternalException
     * @throws InvalidRequestException
     */
    public function handleRefund(Order $order, HandleRefundRequest $request)
    {
        // 判断订单状态十分正确
        if ($order->refund_status !== Order::REFUND_STATUS_APPLIED) {
            throw new InvalidRequestException('订单状态不正确');
        }
        // 是否同意退款
        if ($request->input('agree')) {
            // 同意退款的逻辑
            // 调用退款逻辑
            $this->_refundOrder($order);
        } else {
            // 拒绝退款理由到订单的 extra 字段中
            $extra = $order->extra ?: [];
            $extra['refund_disagree_reason'] = $request->input('reason');
            // 将订单的退款状态改为退款
            $order->update([
                'refund_status' => Order::REFUND_STATUS_PENDING,
                'extra' => $extra,
            ]);
        }

        return $order;
    }

    /**
     * 退款逻辑
     *
     * @param Order $order
     * @throws InternalException
     */
    protected function _refundOrder(Order $order)
    {
        // 判断该订单的支付方式
        switch ($order->payment_method) {
            case 'wechatpay':
                // 微信支付
                // 生成退款订单号
                $refundNo = Order::getAvailableRefundNo();
                app('wechat_pay')->refund([
                    'out_trade_no' => $order->no, // 之前的订单流水号
                    'total_fee' => $order->total_amount * 100, //原订单金额，单位分
                    'refund_fee' => $order->total_amount * 100, // 要退款的订单金额，单位分
                    'out_refund_no' => $refundNo, // 退款订单号
                    // 微信支付的退款结果并不是实时返回的，而是通过退款回调来通知，因此这里需要配上退款回调接口地址
                    'notify_url' => route('payment.wechat_pay.refund_notify') // 由于是开发环境，需要配成 requestbin 地址
                ]);
                // 将订单状态改成退款中
                $order->update([
                    'refund_no' => $refundNo,
                    'refund_status' => Order::REFUND_STATUS_PROCESSING,
                ]);
                break;
            case 'alipay':
                // 用我们刚刚写的方法来生成一个退款订单号
                $refundNo = Order::getAvailableRefundNo();
                // 调用支付宝支付实例的 refund 方法
                $result = app('ali_pay')->refund([
                    'out_trade_no' => $order->no, // 之前的订单流水号
                    'refund_amount' => $order->total_amount, // 退款金额，单位元
                    'out_request_no' => $refundNo, // 退款订单号
                ]);
                // 根据支付宝的稳定，如果返回值里有 sub_code 字段谁退款失败
                if ($result->sub_code) {
                    // 将退款失败的保存存入 extra 字段
                    $extra = $order->extra;
                    $extra['refund_failed_code'] = $result->sub_code;
                    // 将订单的退款状态标记为退款失败
                    $order->update([
                        'refund_no' => $refundNo,
                        'refund_status' => Order::REFUND_STATUS_FAILED,
                        'extra' => $extra,
                    ]);
                } else {
                    // 将订单的退款状态标记为退款成功并保存退款订单号
                    $order->update([
                        'refund_no' => $refundNo,
                        'refund_status' => Order::REFUND_STATUS_SUCCESS,
                    ]);
                }
                break;
            default:
                // 原则上不可能出现，这个只是为了代码健壮性
                throw new InternalException('未知订单支付方式：' . $order->payment_method);
                break;
        }
    }



















}
