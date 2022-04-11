<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Order;
use App\Models\User;
use Illuminate\Auth\Events\Registered;
use App\Http\Requests\CustomerRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function admin()
    {
        $total_orders = Order::count();

        $total_cutomers = User::count();

        $total_sales = Order::sum("total_price");

        if ($total_sales < 1000000) {

            $total_sales = number_format($total_sales, 0, '.', ',') . "K";

        } elseif ($total_sales >= 1000000) {

            $total_sales = number_format($total_sales, 0, '.', ',') . "M";
        }

        return view('admin.dashboard', ['total_customers' => $total_cutomers, 'total_orders' => $total_orders, 'total_sales' => $total_sales]);

    }

    public function customer()
    {
        $carts = Auth::user()->cart;

        $total_price = Cart::where("user_id", Auth::id())->sum('price');

        return view('customer.profile', ['carts' => $carts, 'total_price' => $total_price]);

    }

    public function customers()
    {
        $customers = User::whereNotIn('id' , [Auth::id()])->get();

        return view("admin.layouts.customer.customers" , ['customers' => $customers]);
    }

    public function checkout()
    {

        if (Auth::check()) {return redirect("/customer");}
        return view('guest.check');

    }

    public function customer_info(CustomerRequest $request)
    {

        $session_id = session()->getId();

        $request->validate([

        ]);

        $user = User::create($request->validated());

        $user->assignRole("customer");

        event(new Registered($user));

        Auth::login($user);

        $u_id = Auth::id();

        $cart = DB::update('update carts set user_id = ? where session_id = ?', [$u_id, $session_id]);

        return redirect("/customer");
    }

    public function user_orders($id)
    {
        if (auth()->id() != $id) {return back();}

        $user = User::findOrFail($id);

        $orders = $user->orders;

        $orders->load("products");

        return view("customer.orders", ['orders' => $orders, 'total_price' => $user->orders->sum('total_price')]);

    }

}
