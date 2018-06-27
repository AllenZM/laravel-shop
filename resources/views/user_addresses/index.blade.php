@extends('layouts.app')
@section('title', '收货地址列表')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10   ">
                <div class="card">
                    <div class="card-header">收货地址列表</div>
                    <div class="card-body">
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>收货人</th>
                                <th>地址</th>
                                <th>邮编</th>
                                <th>电话</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($addresses as $address)
                                <tr>
                                    <td>{{ $address->contact_name }}</td>
                                    <td>{{ $address->full_address }}</td>
                                    <td>{{ $address->zip }}</td>
                                    <td>{{ $address->contact_phone }}</td>
                                    <td>
                                        <a href="{{ route('user_addresses.edit', ['user_address' => $address->id]) }}" class="btn btn-primary btn-sm">修改</a>
                                        <button class="btn btn-danger btn-del-address btn-sm" type="button" data-id="{{ $address->id }}">删除</button>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('scriptsAfterJs')
    <script type="text/javascript">
        $(document).ready(function () {
            // 删除按钮点击事件
            $('.btn-del-address').click(function () {
                let id = $(this).data('id');
                // 调用 sweetalert
                swal({
                    title: "确认要删除改地址嘛？",
                    icon: "warning",
                    buttons: ['取消', '删除'],
                    dangerMode: true,
                }).then(function (willDelete) {
                    // 用户点击按钮后会触发这个回调函数
                    // 用户点击确定 willDelete 值为 true， 否则为 false
                    // 用户点了取消，啥也不做
                    if (!willDelete) {
                        return;
                    }
                    // 调用删除接口，用 id 来拼接出请求的 url
                    axios.delete('/user_addresses/' + id)
                        .then(function () {
                            // 请求成功之后重新加载页面
                            location.reload();
                        })
                });
            })
        })
    </script>
@endsection