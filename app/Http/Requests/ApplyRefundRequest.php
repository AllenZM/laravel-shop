<?php
/**
 * Name: 申请退款验证.
 * User: 董坤鸿
 * Date: 2018/7/3
 * Time: 下午6:31
 */

namespace App\Http\Requests;

class ApplyRefundRequest extends Request
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
            'reason' => 'required'
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
            'reason' => '原因',
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
