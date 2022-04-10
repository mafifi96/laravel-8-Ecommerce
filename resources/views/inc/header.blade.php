<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="/">Store</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll"
            aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                <li class="nav-item">
                    <a class="nav-link " aria-current="page" href="/">Home</a>
                </li>

                @ifadmin
                <li class="nav-item">
                    <a class="nav-link" href="/dashboard">Dashboard</a>
                </li>
                @endif


                @ifcustomer

                <li class="nav-item">
                    <a class="nav-link" href="/customer">Profile</a>
                </li>

                @endif

                @guest
                <li class="nav-item">
                    <a class="nav-link" href="/register">Register</a>
                </li>


                <li class="nav-item">
                    <a class="nav-link" href="/login" tabindex="-1" aria-disabled="true">Login</a>
                </li>
                @endguest
                @auth
                <li class="nav-item">

                    <form method="POST" action="/logout">
                        @csrf
                        <a class="btn btn-primary dropdown-item" data-toggle="modal" data-target="#logoutModal"
                            href="/logout" onclick="event.preventDefault();
                                                this.closest('form').submit();">
                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                            Logout
                        </a>
                    </form>
                </li>
                @endauth

                <li class="nav-item">
                    <a class="nav-link cart" href="/cart"><i class="fas fa-shopping-cart"></i>
                        <span id="cart" style="
        @if(session()->has('cart_quantity') && session('cart_quantity') != 0)   
        {{"display:block"}}
        @else
        {{"display:none"}}
        @endif
        ">
                            @if(session()->has('cart_quantity') && session('cart_quantity') != 0)
                            {{session()->get('cart_quantity')}}
                            @endif
                        </span>


                    </a>
                </li>
            </ul>
            <form class="d-flex" method="get" action="/search">
                <input class="form-control me-2" type="search" name="q" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>

        </div>
    </div>
</nav>


<main class="mt-5 mb-5 px-3" style="overflow:hidden;">
    <!-- Categories -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2 col-sm-12 col-lg-2 mt-1">
                <div class="side-bar p-2 mb-3 shadow-sm">

                    <ul>
                        @ifcustomer

                        <li><a href="/customer/{{auth()->id()}}/orders" class="text-decoration-none">Orders</a></li>

                        @endif
                        @foreach ($categories as $category)
                        <li><a href="/category/{{$category->id}}/{{$category->name}}" class="text-decoration-none">{{$category->name}}</a></li>
                        @endforeach

                    </ul>
                </div>
            </div>
        
