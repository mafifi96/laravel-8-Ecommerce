@extends('admin.master')

@section("title" , "product | " . $product->title)

@section("content")


<div class="dialog">
    <div class="card">
        <div class="card-header">
            <h4>Are You Sure You Want To Delete This Item ?</h4>
        </div>
        <div class="card-body" style="padding:10px;text-align:center;">
            <div class="btn-group">
                <a class="btn btn-danger mx-4" id="delete">Delete</a>
                <a class="btn btn-primary" id="cancel">Cancel</a>
            </div>
        </div>
        <div class="card-footer"></div>
    </div>
</div>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page header -->
    <div class="d-sm-flex align-items-center justify-content-end mb-4">
        {{-- <h1 class="h3 mb-0 text-gray-800">products</h1> --}}

        <a href="/admin/product/create" class="btn btn-sm btn-primary shadow-sm mx-2"><i class="fas fa-plus fa-sm "></i>
            Create product</a>
        <a href="/admin/product/{{$product->id}}/edit" class="btn btn-info btn-sm shadow-sm"><i
                class="fas fa-edit fa-sm"></i> Edit</a>


    </div>

    <!-- Content Row -->
    <div class="row">

        <div class="col-md-12">
            <h3 class="h3">{{$product->title}}</h3>

            <div class="product-cover" style="height: 400px; width:100%;overflow:hidden">
                <img class="img-thumbnail" style="display: block; width:100%;height:100%"
                    src="{{asset('/ecommerce/storage/app/'.$product->images[0]->image)}}" alt="{{$product->title}}" title="{{$product->title}}">
            </div>
            <div class="body mt-3">
                {!! $product->desc !!}
                <p class="mt-3"> Category : <a class="text-decoration-none" href="/admin/category/{{$product->category->id}}"><strong>{{$product->category->name}}</strong></a></p>
                
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
            <span>Copyright &copy; Your Website 2021</span>
        </div>
    </div>
</footer>
<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

@endsection
