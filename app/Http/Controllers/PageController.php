<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use \Illuminate\Support\Collection;


class PageController extends Controller
{

    public function index(){

        return view("guest.home" , ['products'=> Product::latest()->paginate(10)]);

    }

}
