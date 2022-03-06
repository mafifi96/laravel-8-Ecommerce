@extends('master')

@section("title" , "Store | ". $product->title)

@section("content")

<div class="col-md-9 col-lg-9 col-sm-12">
    <div class="container">
        <div class="row ">
            <!-- Product -->
            <div class="col-md-12 col-sm-12 col-lg-12  ">

                <div class="product jusitfy-content-center">
                    <div class="pro-header mb-1">
                        <div class="pro-img" style="width: 100%;height:80vh;overflow:hidden;">
                            <img src="{{asset("uploads/".$product->images[0]->image)}}" class="img-fluid "
                                style="width:100%;display:block;" alt="{{$product->title}}" title="{{$product->title}}">
                        </div>
                    </div>
                    <div class="pro-body mb-1 p-2">
                        <h2 class="text-capitalize" title="{{$product->title}}">
                            {{$product->title}}
                        </h2>

                        <p style="font-weight:800;color:#000;">&dollar;{{$product->price}}</p>
                        <div class="pro-desc p-2">
                            {!! $product->description !!}
                        </div>

                        <div class="pro-add">

                            <form method="post" name="add">
                                @csrf
                                <div class="row">
                                    <div class="col-md-8 justify-content-">
                                        <div class="form-group">
                                            <input type="number" class="form-control" name="quantity"
                                                placeholder="quantity..." value="" required>
                                        </div>
                                    </div>
                                    <div class="col-md-2 pull-right">
                                        <button type="submit" data-name="{{$product->title}}"
                                            data-price="{{$product->price}}" data-id="{{$product->id}}"
                                            class="btn btn-primary addtocart" name="submit">Add</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
</main>
@endsection
