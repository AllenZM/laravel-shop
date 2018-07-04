<?php
/**
 * Name: 优惠券模型.
 * User: 董坤鸿
 * Date: 2018/7/4
 * Time: 下午4:47
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class CouponCode extends Model
{
    // 用常量的方式定义支持的优惠券类型
    const TYPE_FIXED = 'fixed';
    const TYPE_PERCENT = 'percent';

    public static $typeMap = [
        self::TYPE_FIXED => '固定金额',
        self::TYPE_PERCENT => '比例',
    ];

    /**
     * 可以分配的属性。
     *
     * @var array
     */
    protected $fillable = [
        'name', 'code', 'type', 'value', 'total', 'used',
        'min_amount', 'not_before', 'not_after', 'enabled'
    ];

    /**
     * 应该被转换成原生类型的属性。
     *
     * @var array
     */
    protected $casts = [
        'enabled' => 'boolean', //enabled 是一个布尔类型字段
    ];

    /**
     * 需要转换成日期的属性。
     *
     * @var array
     */
    protected $dates = [
        'not_before',
        'not_after'
    ];

    /**
     * 追加到模型数组表单的访问器.
     *
     * @var array
     */
    protected $appends = [
        'description'
    ];

    /**
     * 获取描述属性
     *
     * @return string
     */
    public function getDescriptionAttribute()
    {
        $str = '';
        if ($this->min_amount > 0) {
            $str = '满' . str_replace('.00', '', $this->min_amount);
        }
        if ($this->type === self::TYPE_PERCENT) {
            return $str . '优惠' . str_replace('.00', '', $this->value . '%');
        }

        return $str . '减' . str_replace('.00', '', $this->value);
    }

    /**
     * 获取优惠券码
     *
     * @param int $length
     * @return string
     */
    public static function findAvailableCode($length = 16)
    {
        do {
            // 生成一个指定长度的随机字符串，并转大写
            $code = strtoupper(Str::random($length));
            // 如果生成的码已经存在就继续循环
        } while (self::query()->where('code', $code)->exists());
        return $code;
    }
}
