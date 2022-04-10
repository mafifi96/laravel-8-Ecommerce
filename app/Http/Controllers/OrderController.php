<?php

namespace App\Http\Controllers;

use App\Events\OrderConfirmed;
use App\Models\Cart;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{

    public function orders()
    {
        $orders = Order::latest()->get();

        $orders->load("user.orders");

        return view('admin.layouts.order.orders', ['orders' => $orders]);
    }

    public function confirm(Request $request)
    {

        $products = Cart::where('user_id', Auth::id())->get();

        if ($products->count() <= 0) {
            return back();
        }

            DB::transaction(function () use ($products) {

            $total_price = $products->sum('price');

            $data = [];

            $items = $products->flatten()->pluck('quantity', 'product_id')->map(function ($value, $key) use ($data) {

                return $data[$key] = ['quantity' => $value];
            })->toArray();

            $order = Order::Create([
                'status' => "shipping",
                'total_price' => $total_price,
                'user_id' => Auth::id(),

            ]);

            $order->products()->attach($items);

            Cart::where("user_id", Auth::id())->delete();

            event(new OrderConfirmed($order));

        });



        $request->session()->put('cart_quantity', 0);

        $request->session()->flash('orderconfirmed', '<strong>Order</strong> sent successfuly');

        return back();
    }
}
