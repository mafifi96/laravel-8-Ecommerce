@extends('master')

@section("title" , "Category | ".$category->name)

@section("content")

<div class="col-md-10 col-lg-10 col-sm-12 ">
        <div class="container">
            <div class="row">
                <!-- Products -->
                <div class="col-md-12">
                    <div class="row">


                        @forelse ($category->products as $product )

                        {{-- <div class="col-md-4 px-1">

                            <div class="card">
                                <a href="/product/{{$product->id}}">
                                    <img src="{{asset("uploads/".$product->images[0]->image)}}" style="height:300px;"
                                        class="img-thumbnail card-img-top" alt="placeholder">
                                </a>
                                <div class="card-body">
                                    <h5 class="card-title"><a href="/product/{{$product->id}}"
                                            class="btn text-left">{{$product->title}}</a></h5>
                                    <p class="card-text">{{$product->price}}</p>
                                    <div class="card-footer">

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
                                                    <button type="submit" data-name="{{$product->title}}" data-price="{{$product->price}}" data-id="{{$product->id}}"
                                                        class="btn btn-primary addtocart" name="submit">Add</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>
                         --}}
                         <div class="col-md-12 col-sm-12 col-lg-6 mb-3 ">
                        

                            <div class="product mb-2 shadow-sm">
                                <div class="pro-header mb-1">
                                    <a href="/product/{{$product->id}}">
                                        <img src="{{asset("uploads/".$product->images[0]->image)}}" style="height:40vh;"
                                            class="img-fluid card-img-top" alt="placeholder">
                                    </a>
                                </div>
                                <div class="pro-body mb-1 p-2">
                                    <h5 title="{{$product->title}}">
                                        <a href="/product/{{$product->id}}" style="color:#555;font-weight:400"
                                            class="text-decoration-none text-left text-capitalize">
                                            {{$product->title}}
                                        </a>
                                        </h5>
                                        <p style="font-weight:800;color:#000;">&dollar;{{$product->price}}</p>
    
                                        <div class="pro-add p-2">
    
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
    
                        @empty
                        <h3 class=" alert alert-info text-capitalize text-center">no products in this category</h3>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
@endsection
