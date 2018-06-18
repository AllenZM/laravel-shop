@extends('layouts.app')
@section('title', '提示')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">提示</div>

                    <div class="card-body text-center">
                        <h1>请先验证邮箱</h1>
                        <a class="btn btn-primary" href="{{ route('root') }}">返回首页</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection