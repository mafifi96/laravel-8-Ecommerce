<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
    public function index()
    {
        if (Auth::check()) {
            
            $items = Cart::where("user_id", Auth::id())->get();

        } else {

            $items = Cart::where("session_id", session()->getId())->get();
        }
        
        return view("guest.cart", ['cart_items' => $items]);
    }

    public function add(Request $request)
    {
        $user_id = Auth::check() ? Auth::id() : null;
        $productId = $request->product_id;
        $productName = $request->product_name;
        $session = session()->getId();
        $quantity = $request->quantity;
        $price = $request->price;
        $price = ($quantity * $price);

        
        if (Auth::check()) {
            $count = Cart::where('user_id', $user_id)
                ->where('product_id', $productId)->count('quantity');

        } else {
            $count = Cart::where('session_id', $session)
                ->where('product_id', $productId)->count('quantity');

        }

        if ($count >= 1) {

            $data['quantity'] = $quantity;
            $data['price'] = $quantity * $price;

            if (Auth::check()) {

                $update = Cart::where('user_id', $user_id)
                    ->where('product_id', $productId)->update($data);

            } else {

                $update = Cart::where('session_id', $session)
                    ->where('product_id', $productId)->update($data);

            }
        } else {

            $data = [
                'product_name' => $productName,
                'quantity' => $quantity,
                'price' => $price,
                'product_id' => $productId,
                'session_id' => $session,
                'user_id' => $user_id,
            ];

            $cart = new Cart($data);
            $cart->save();
            
        }

    }

    public function destroy(Request $request)
    {
        $id = $request->product_id;
        if (Auth::check()) {

            $item = Cart::where("user_id", Auth::id())->where("product_id" , $id)->delete();

            return back();

        } else {

            $item = Cart::where("session_id", session()->getId())->where("product_id" , $id)->delete();

            return back();

        }
    }

    public function cart_quantity(Request $request)
    {

        if (Auth::check()) {
            
            $cart_quantity = Cart::where("user_id", Auth::id())->sum('quantity');
            $request->session()->put('cart_quantity',$cart_quantity);

        } else {

            $cart_quantity = Cart::where("session_id", session()->getId())->sum('quantity');
            $request->session()->put('cart_quantity',$cart_quantity);
        }

        return response()->json([
            'quantity' => $cart_quantity
        ]);
    }

}
