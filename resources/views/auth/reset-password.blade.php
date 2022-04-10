@extends('master')

@section("title" , "Store | Reset Password")

@section("content")

<div class="col-md-10 col-lg-10 col-sm-12 ">
    <div class="container">
        <div class="row">

            <!-- Products -->
            <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="row justify-content-center">
                @if ($errors->any())
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                                @endif
                                @if(session()->has('status'))
                <div class="alert alert-success alert-dismissible fade show">
                <strong>{{session('status')}}</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
                </div>

                @endif



<div class="col-md-4 col-lg-4 col-sm-12 ">
<form action="{{ route('password.update') }}" method="post">
@csrf
<input type="hidden" name="token" value="{{ $request->route('token') }}">
<div class="form-group">
    <input type="email" class="form-control" placeholder="Email.." name="email" value="{{old('email')}}">
</div>

<div class="form-group">
    <input type="password" class="form-control" placeholder="New Password.." name="password">
</div>

<div class="form-group">
    <input type="password" class="form-control" placeholder="Retype Password.." name="password_confirmation">
</div>

<div class="form-group">
    <button class="btn btn-outline-success form-control" type="submit">Reset Password</button>
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
