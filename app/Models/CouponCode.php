<?php
/**
 * Name: 优惠券模型.
 * User: 董坤鸿
 * Date: 2018/7/4
 * Time: 下午4:47
 */

namespace App\Models;

use App\Exceptions\CouponCodeUnavailableException;
use Carbon\Carbon;
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

    /**
     * 检查优惠券
     *
     * @param null $orderAmount
     * @throws CouponCodeUnavailableException
     */
    public function checkAvailable($orderAmount = null)
    {

        if (!$this->enabled) {
            throw new CouponCodeUnavailableException('优惠券不存在');
        }

        if ($this->total - $this->used <= 0) {
            throw new CouponCodeUnavailableException('该优惠券已被兑完');
        }
        if ($this->not_before && $this->not_before->gt(Carbon::now())) {
            throw new CouponCodeUnavailableException('该优惠券现在不能使用');
        }
        if ($this->not_after && $this->not_after->lt(Carbon::now())) {
            throw new CouponCodeUnavailableException('该优惠券已过期');
        }
        if (!is_null($orderAmount) && $orderAmount < $this->min_amount) {
            throw new CouponCodeUnavailableException('订单金额不满足优惠券最低金额');
        }

    }

    /**
     * 计算优惠后金额
     *
     * @param $orderAmount
     * @return mixed|string
     */
    public function getAdjustedPrice($orderAmount)
    {
        // 固定金额
        if ($this->type === self::TYPE_FIXED) {
            // 为了保证系统健壮性，我们需要订单金额最少为0.01元
            return max('0.01', $orderAmount - $this->value);
        }

        return number_format($orderAmount * (100 - $this->value) / 100, 2, '.', '');
    }

    /**
     * 新增、减少优惠券用量
     *
     * @param bool $increase
     * @return int
     */
    public function changeUsed($increase = true)
    {
        // 传入 true 代表新增用量，否则是减少用量
        if ($increase) {
            // 与检查 SKU 库类似，这里需要检查当前用量是否已经超过总量
            return $this->newQuery()->where('id', $this->id)->where('used', '<', $this->total)->increment('used');
        } else {
            return $this->decrement('used');
        }
    }

}
