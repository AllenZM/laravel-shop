@extends('layouts.app')
@section('title', '错误')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">错误</div>

                    <div class="card-body text-center">
                        <h1>{{ $message }}</h1>
                        <a class="btn btn-primary" href="{{ route('root') }}">返回首页</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection