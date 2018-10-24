<nav class="navbar navbar-expand-md navbar-light navbar-static-top">
    <div class="container">
        <a class="navbar-brand" href="{{ url('/') }}">
            {{ config('app.name', '涂呀网商城') }}
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- 导航左侧 -->
            <ul class="navbar-nav mr-auto">
                <!-- 顶部类目菜单开始 -->
                @if(isset($category_tree))
                    <li class="nav-item dropdown">
                        <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown">所有类目 <b class="caret"></b></a>
                        <ul class="dropdown-menu animated fadeInRight multi-level">
                            <!-- 遍历 $categoryTree 集合，将集合中的每一项以 $category 变量注入 layouts._category_item 模板中并渲染 -->
                            @each('layouts._category_item', $category_tree, 'category')
                        </ul>
                    </li>
                @endif
                <!-- 顶部类目菜单结束 -->
            </ul>

            <!-- 导航右侧 -->
            <ul class="navbar-nav ml-auto">
                <!-- 认证链接开始 -->
                @guest
                    <li><a class="nav-link" href="{{ route('login') }}">登录</a></li>
                    <li><a class="nav-link" href="{{ route('register') }}">注册</a></li>
                @else
                    <li class="nav-item">
                        <a href="{{ route('cart.index') }}" class="shopping-cart"><span class="fa fa-shopping-cart fa-lg" aria-hidden="true"></span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                            <span class="user-avatar pull-left" style="margin-right:8px; margin-top:-5px;">
                                <img src="https://fsdhubcdn.phphub.org/uploads/images/201709/20/1/PtDKbASVcz.png?imageView2/1/w/60/h/60" class="img-responsive img-circle" style="border-radius:50%; width: 30px; height: 30px">
                            </span>
                            {{ Auth::user()->name }} <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight" aria-labelledby="navbarDropdown">
                            <li>
                                <a class="dropdown-item" href="{{ route('user_addresses.index') }}">收货地址</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="{{ route('products.favorites') }}">我的收藏</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="{{ route('orders.index') }}">我的订单</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="{{ route('installments.index') }}">分期付款</a>
                            </li>
                            <li class="dropdown-divider"></li>
                            <li>
                                <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">退出登录</a>
                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                    @csrf
                                </form>
                            </li>
                        </ul>
                    </li>
                @endguest
                <!-- 认证链接结束 -->
            </ul>
        </div>
    </div>
</nav>