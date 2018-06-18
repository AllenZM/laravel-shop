<?php

use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(App\Models\UserAddress::class, function (Faker $faker) {
    $addresses = [
        ["北京市", '市辖区', '东城区'],
        ["北京市", '市辖区', '西城区'],
        ["北京市", '市辖区', '朝阳区'],
        ["北京市", '市辖区', '丰台区'],
        ["上海市", '市辖区', '黄埔区'],
        ["上海市", '市辖区', '静安区'],
        ["上海市", '市辖区', '长宁区'],
        ["上海市", '市辖区', '徐汇区'],
        ["天津市", '市辖区', '和平区'],
        ["天津市", '市辖区', '河东区'],
        ["天津市", '市辖区', '河西区'],
        ["天津市", '市辖区', '南开区'],
        ["重庆市", '市辖区', '渝中区'],
        ["重庆市", '市辖区', '渝北区'],
        ["重庆市", '市辖区', '江北区'],
        ["重庆市", '市辖区', '南岸区'],
    ];

    $address = $faker->randomElement($addresses);

    return [
        'province' => $address[0],
        'city' => $address[1],
        'district' => $address[2],
        'address' => sprintf('第%d街道第%d号', $faker->randomNumber(2), $faker->randomNumber(3)),
        'zip' => $faker->postcode,
        'contact_name'  => $faker->name,
        'contact_phone' => $faker->phoneNumber,
    ];
});
