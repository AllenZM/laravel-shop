<?php
/**
 * Name: 表单验证.
 * User: 董坤鸿
 * Date: 2018/10/30
 * Time: 下午1:19
 */

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class Request extends FormRequest
{
    /**
     * 确定用户是否有权发出此请求。
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

}
