<?php
/**
 * Name: 拒绝验证.
 * User: 董坤鸿
 * Date: 2018/7/3
 * Time: 下午7:56
 */

namespace App\Http\Requests\Admin;

use App\Http\Requests\Request;

class HandleRefundRequest extends Request
{
    /**
     * 获取适用于请求的验证规则。
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'agree' => ['required', 'boolean'],
            'reason' => ['required_if:agree, false'], // 拒绝退款时需要输入拒绝理由
        ];
    }

    /**
     * 获取定义验证属性。
     * Custom Validation Attributes.
     *
     * @return array
     */
    public function attributes()
    {
        return [
            //
        ];
    }

    /**
     * 获取定义的验证规则的错误消息。
     * Get the error messages for the defined validation rules.
     *
     * @return array
     */
    public function messages()
    {
        return [
            //
        ];
    }
}
