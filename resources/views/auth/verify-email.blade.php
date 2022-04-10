@extends('master')

@section("title" , "Store | Verify Your Email")

@section("content")

<div class="col-md-10 col-lg-10 col-sm-12 ">
    <div class="container">
        <div class="row">
<div class="alert alert-success text-capitalize ">
        <span>Your account has been successfully registered. Please check your email to verify your email</span>
</div>
            <!-- Products -->
            <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="row">
                @if(session()->has('status'))
                <div class="alert alert-success alert-dismissible fade show">
                <strong>{{session('status')}}</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
                </div>

                @endif

<form action="{{ route('verification.send') }}" method="post">
@csrf
<div class="input-control">
    <button class="btn btn-outline-success" type="submit">Request a new link</button>
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
