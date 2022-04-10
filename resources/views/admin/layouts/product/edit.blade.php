@extends('admin.master')

@section("title" , "Edit Product")

@section("content")

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page header -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Products</h1>

    </div>

    <!-- Content Row -->
    <div class="row">

        <div class="col-md-12">

            <div class="card">
                <div class="card-header">
                    <h6 class="h6 text-muted">Edit Product</h4>

                        @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                        @endif

                        @if(session()->has('edited'))
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            {!! session()->get('edited') !!}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        @endif

                </div>
                <div class="card-body">
                    <form action="/admin/product/{{$product->id}}/update" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <input type="text" class="form-control form-control-user" name="title"
                        placeholder="title" required value="{{$product->title}}">
                        </div>
                        <div class="form-group">
                            <input type="file" class="form-control form-control-user" name="image"
                        placeholder="image" required value="{{old('image')}}">
                        </div>

                        <div class="form-group">
                            <textarea  class="form-control form-control-user"
                                 name="description"  required placeholder="Description...">{{$product->description}}</textarea>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control form-control-user"
                                 name="price"
                        placeholder="price" required value="{{$product->price}}">
                        </div>
                        <div class="form-group">
                            <input  class="form-control form-control-user"
                        name="quantity" value="{{$product->quantity}}" type="number" required placeholder="quantity">
                        </div>
                        <div class="form-group">
                            <select name="brand_id" class="form-control form-control-user">
                                <option value="" selected>--Brand--</option>
                                @foreach ($brands as $brand)
                            <option value="{{$brand->id}}" @if($product->brand_id == $brand->id) {{'selected'}} @endif>{{$brand->name}}</option>
                                @endforeach

                            </select>
                        </div>
                        
                        <div class="form-group">
                            <select name="category_id" class="form-control form-control-user">
                                <option value="" selected>--Category--</option>
                                @foreach ($categories as $category)
                            <option value="{{$category->id}}" @if($product->category_id == $category->id) {{'selected'}} @endif>{{$category->name}}</option>
                                @endforeach

                            </select>
                        </div>




                    <button onclick="this.disabled='disabled';this.closest('form').submit();" type="submit" class="btn btn-primary btn-user btn-block">
                            Save
                        </button>
                    </form>
                </div>
            </div>
        </div>

    </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Footer -->
<footer class="sticky-footer bg-white">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright &copy; Mohamed Afifi</span>
        </div>
    </div>
</footer>
<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->


@endsection
