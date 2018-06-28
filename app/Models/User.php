<?php
/**
 * Name: 用户模型.
 * User: 董坤鸿
 * Date: 2018/6/18
 * Time: 下午4:7
 */

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * 可以分配的属性。
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'email_verified',
    ];

    /**
     * 应该为数组隐藏的属性。
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * 应该被转换成原生类型的属性。
     *
     * @var array
     */
    protected $casts = [
        'email_verified' => 'boolean',
    ];

    /**
     * 获取用户地址
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function addresses()
    {
        return $this->hasMany(UserAddress::class);
    }

    /**
     * 获取收藏商品列表
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function favoriteProducts()
    {
        return $this->belongsToMany(Product::class, 'user_favorite_products')
            ->withTimestamps()
            ->orderBy('user_favorite_products.created_at', 'DESC');
    }

}
