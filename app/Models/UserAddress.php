<?php
/**
 * Name: 用户收货地址模型.
 * User: 董坤鸿
 * Date: 2018/6/18
 * Time: 下午9:8
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserAddress extends Model
{
    /**
     * 可以分配的属性。
     *
     * @var array
     */
    protected $fillable = [
        'province', 'city', 'district', 'address', 'zip', 'contact_name', 'contact_phone', 'last_used_at'
    ];

    /**
     * 应该被转换成原生类型的属性。
     *
     * @var array
     */
    protected $casts = [
        'last_used_at'
    ];

    /**
     * 追加到模型数组表单的访问器.
     *
     * @var array
     */
    protected $appends = ['full_address'];

    /**
     * 获取用户信息
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * 获取完整地址属性
     *
     * @return string
     */
    public function getFullAddressAttribute()
    {
        return "{$this->province}{$this->city}{$this->district}{$this->address}";
    }

}
