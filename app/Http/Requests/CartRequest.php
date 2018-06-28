<?php
/**
 * Name: 购物车验证.
 * User: 董坤鸿
 * Date: 2018/6/28
 * Time: 下午3:7
 */

namespace App\Http\Requests;

use App\Models\ProductSku;

class CartRequest extends Request
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
            'sku_id' => [
                'required',
                function ($attribute, $value, $fail) {
                    if (!$sku = ProductSku::find($value)) {
                        $fail('该商品不存在');
                    }
                    if (!$sku->product->on_sale) {
                        $fail('该商品未上架');
                    }
                    if (!$sku->stock === 0) {
                        $fail('该商品已售完');
                    }
                    if (is_int($this->input('amount')) && $sku->stock < $this->input('amount')) {
                        $fail('该商品库存不足');
                    }
                }
            ],
            'amount' => ['required', 'integer', 'min:1'],
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
            'amount' => '商品数量'
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
            'sku_id.required' => '请选择商品'
        ];
    }
}
