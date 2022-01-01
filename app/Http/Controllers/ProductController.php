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

       $products = Product::paginate(20);

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


        return view("admin.layouts.product.create" , ['categories'=>$categories]);
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
            'title' => "required|min:10|max:50",
            'description' => "required|min:5|max:1000",
            'price' => "required|numeric",
            'quantity'=> "required|integer",
            'category_id' => 'required|integer'
        ]);

        $request->validate([
            'image' => 'required|mimes:png,jpg,jpeg|max:2048'
        ]);

        $file_name = time(). "_". $request->image->extension();

        $request->image->move(public_path('uploads'), $file_name);

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

        return new ProductResource($product);

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(product $product)
    {

        dd($product);

        return  $product;

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

        $product = Product::findOrFail($id)->upadte($request->all());

        $request->session()->flash('ProductUpadted' , 'Product Updated..!');

        //return back();
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
