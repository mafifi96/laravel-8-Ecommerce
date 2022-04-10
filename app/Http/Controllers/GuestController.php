<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Product;
use App\Models\Sessions;
use App\Models\ProductBrand;

class GuestController extends Controller
{
    public function index()
    {
        $session = Sessions::find(session()->getId());

        if (!$session) {

            $session = new Sessions;
            $session->session_id = session()->getId();
            $session->save();
        }

        return view("guest.home", ['products' => Product::latest()->get(), 'categories' => Category::all()]);
    }

    public function product(Product $product)
    {
        return view("guest.product", ['product' => $product , 'categories' => Category::all()]);
    }

    public function brand(ProductBrand $brand,$name){
$brand->load('products');


        return view("guest.brand" ,['brand' => $brand]);
    }

    public function category(category $category, $name = null)
    {
        return view("guest.category", ['category' => $category , 'categories'=> Category::all()]);
    }

    public function search(Request $request)
    {
        $product = $request->q;

        $products = Product::where("title" , "like" , "%$product%")->get();

        return view("guest.home" , ['products'=> $products]);
    }


}
