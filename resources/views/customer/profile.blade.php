@extends('master')

@section("title" , "Profile")

@section("content")

<div class="content col-md-10 col-lg-10 col-sm-12">
    <div class="container">
        <div class="row">

            <!-- Orders -->
            <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="h4">Your Cart</h4>

                        @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                        @endif

                        @if(session()->has('orderconfirmed'))
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            {!! session()->get('orderconfirmed') !!}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        @endif

                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <td scope="col">#</td>
                                <td scope="col">Product</td>
                                <td scope="col">Quantity</td>
                                <td scope="col">Price</td>
                            </thead>
                            @forelse ($carts as $cart )
                            <tr>
                                <td>{{($loop->index + 1)}}</td>
                                <td><a href="/product/{{$cart->product_id}}">{{$cart->product_name}}</a></td>
                                <td>{{$cart->quantity}}</td>
                                <td>{{$cart->price}}</td>

                            </tr>
                            @empty
                            @php
                            $total_price = 0;

                            @endphp

                            <tr>
                                <td colspan="4" class="text-center">Empty Cart</td>
                            </tr>
                            @endforelse
                            <tr>
                                <td colspan="3" style>Total Price</td>
                                <td colspan="1">{{$total_price}}</td>
                            </tr>
                        </table>
                    </div>
                    @if (session()->has('cart_quantity') && session()->get('cart_quantity') != 0)

                    <div class="card-footer justify-content-center">
                        <a href="/confirm/order" class="btn btn-primary" id="confirm-order">Confirm Order</a>
                    </div>

                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
</main>


@endsection
