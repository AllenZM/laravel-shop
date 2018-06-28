<?php
/**
 * Name: 用户地址验证.
 * User: 董坤鸿
 * Date: 2018/6/28
 * Time: 下午3:7
 */

namespace App\Http\Requests;

class UserAddressRequest extends Request
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
            'province'      => 'required',
            'city'          => 'required',
            'district'      => 'required',
            'address'       => 'required',
            'zip'           => 'required',
            'contact_name'  => 'required',
            'contact_phone' => 'required',
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
            'province'      => '省',
            'city'          => '城市',
            'district'      => '地区',
            'address'       => '详细地址',
            'zip'           => '邮编',
            'contact_name'  => '姓名',
            'contact_phone' => '电话',
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
