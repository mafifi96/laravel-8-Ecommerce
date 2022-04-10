<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Http\Resources\ProductResource;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

       $products = Product::latest()->get();

       return view("admin.layouts.product.products" , ['products' => $products]);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = DB::select('select id,name from categories ');

        $brands = DB::select('select id,name from product_brand');


        return view("admin.layouts.product.create" , ['categories'=>$categories , 'brands' => $brands]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        $data = $request->validate([
            'title' => "required|min:10|max:100",
            'description' => "required|min:5|max:1000",
            'price' => "required|numeric",
            'quantity'=> "required|integer",
            'category_id' => 'required|integer',
            'brand_id'   => 'required|integer'
        ]);
        
        $request->validate([
            'image' => 'required|mimes:png,jpg,jpeg|max:2048'
        ]);

        $file_name = $request->file('image')->storePublicly('covers');

        $product = Product::create($data);

        $image = $product->images()->create(['image'=>$file_name]);

        $request->session()->flash('saved' , '<strong>Product</strong> saved..!');

        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Product $product)
    {

        return view("admin.layouts.product.product" , ['product'=>$product]);

        //return new ProductResource($product);

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(product $product)
    {


        $categories = DB::select('select id,name from categories ');

        $brands = DB::select('select id,name from product_brand');


        return view("admin.layouts.product.edit" , ['product' => $product,'categories'=>$categories , 'brands' => $brands]);

        

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $product = Product::findOrFail($id)->update($request->all());

        $request->session()->flash('edited' , 'Product Updated..!');

        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {

        $product = Product::find($request->id);
        $product->delete();
        return "deleted";
    }
}
