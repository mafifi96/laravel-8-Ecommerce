@extends('master')

@section("title" , "Store | Reset Password")

@section("content")

<div class="col-md-10 col-lg-10 col-sm-12 ">
    <div class="container">
        <div class="row">

            <!-- Products -->
            <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="row justify-content-center">
                @if(session()->has('status'))
                <div class="alert alert-success alert-dismissible fade show">
                <strong>{{session('status')}}</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
                </div>

                @endif

<div class="col-md-4 col-lg-4 col-sm-12 ">
<form action="{{ route('password.email') }}" method="post">
@csrf
<div class="form-group">
    <input type="Email" class="form-control" placeholder="Email.." name="email" value="{{old('email')}}">
</div>

<div class="form-group">
    <button class="btn btn-outline-success form-control" type="submit">Send Password Reset Link</button>
</div>

</form>
</div>
</div>
            </div>
        </div>
    </div>

    
</div>
</div>
</div>
</main>



@endsection
