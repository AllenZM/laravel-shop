<?php
/**
 * Name: 自定义辅助函数.
 * User: 董坤鸿
 * Date: 2018/6/18
 * Time: 下午3:50
 */

use Illuminate\Support\Facades\Route;

if (!function_exists('route_class')) {

    /**
     * 当前请求的路由名称转换为CSS类名称
     *
     * @return mixed
     */
    function route_class()
    {
        return str_replace('.', '-', Route::currentRouteName());
    }
}

if (!function_exists('parse_xml')) {

    /**
     * 用 simplexml_load_string 函数初步解析 XML，返回值为对象，在通过 normalizer_xml 函数将对象转成数组
     *
     * @param $xml
     * @return array|null
     */
    function parse_xml($xml)
    {
        return normalizer_xml(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_COMPACT | LIBXML_NOCDATA | LIBXML_NOBLANKS));
    }
}

if (!function_exists('normalizer_xml')) {

    /**
     * 将 XML 解析之后的对象转成数组
     *
     * @param $object
     * @return array|null
     */
    function normalizer_xml($object)
    {
        $result = null;
        if (is_object($object)) {
            $object = (array)$object;
        }
        if (is_array($object)) {
            foreach ($object as $key => $value) {
                $res = normalizer_xml($value);
                if (('@attributes' === $key) && ($key)) {
                    $result = $res;
                } else {
                    $result[$key] = $res;
                }
            }
        } else {
            $result = $object;
        }
        return $result;
    }
}















