<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class PageController extends Controller
{

    public function index(){

        return view("guest.home" , ['products'=> Product::all()]);

    }

}
