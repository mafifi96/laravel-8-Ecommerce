<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{

    public function orders()
    {
        $orders = Order::all();
        
        $orders->load("user.orders");

        return view('admin.layouts.orders', ['orders' => $orders]);
    }

    public function confirm(Request $request)
    {

        $products = Cart::where('user_id', Auth::id())->get();

        $total_price = $products->sum('price');

        $data = [];

        $items = $products->flatten()->pluck( 'quantity','product_id')->map(function ($value, $key) use ($data) {

            return $data[$key] = ['quantity' => $value];

        })->toArray();

        $order = Order::Create([
            'status' => "shipping",
            'total_price' => $total_price,
            'user_id' => Auth::id(),

        ]);

        
        $order->products()->attach($items);

        $delete = Cart::where("user_id", Auth::id())->delete();

        $request->session()->forget('cart_quantity');

        $request->session()->flash('orderconfirmed', '<strong>Order</strong> sent successfuly');

        return back();

    }

}
