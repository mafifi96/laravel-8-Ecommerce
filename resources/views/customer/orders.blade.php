@extends('master')

@section("title" , "Orders")

@section("content")

<div class="content" style="width:83%;float:right;">
    <div class="container">
        <div class="row">

            <!-- Orders -->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="h4">Your Orders</h4>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <td scope="col">#</td>
                                <td scope="col">Product</td>
                                <td scope="col">Quantity</td>
                                <td scope="col">Price</td>
                                
                            </thead>
                            @forelse ($orders as $order )

                            @foreach ($order->products as $product )
                                
                            <tr>
                                
                                <td>{{($loop->index + 1)}}</td>
                                <td><a href="/product/{{$product->id}}">{{$product->title}}</a></td>
                                <td>{{$product->pivot->quantity}}</td>
                                <td>{{$product->price}}</td>
                                
                           </tr>
                            @endforeach
                            <tr><td colspan="3">Status</td> <td colspan="1">{{$order->status}}</td></tr>
                            @empty
                            
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
                    
                </div>
            </div>
        </div>
    </div>
</div>
</main>

@endsection
