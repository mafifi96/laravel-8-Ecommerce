<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\GuestController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\OrderController;

Route::get('/', [GuestController::class , 'index']);
Route::get('/product/{product}', [GuestController::class , 'product']);
Route::get('/category/{category}/{name}', [GuestController::class , 'category']);
Route::get('/brand/{brand}/{name}', [GuestController::class , 'brand'])->where(['brand'=>'[0-9]+' , 'name'=> '[a-zA-Z-0-9]+']);
Route::get("/cart" , [CartController::class , 'index']);
Route::post("/cart/add" , [CartController::class , 'add']);
Route::post("/cart/quantity" , [CartController::class , 'cart_quantity']);
Route::post("/cart/delete" , [CartController::class , 'destroy']);
Route::get('/checkout', [UserController::class , 'checkout']);
Route::post('/customer/info', [UserController::class , 'customer_info']);
Route::get("/search" , [GuestController::class , 'search']);

Route::middleware(['auth','admin'])->group(function () {

    Route::get('/dashboard', [UserController::class , 'admin'])->name('dashboard');

    Route::get('/admin/categories',[CategoryController::class , 'index'])->name('categories');

    Route::get('/admin/category/{category}',[CategoryController::class , 'show'])->where('category' ,'[0-9]+');

    Route::get('/admin/category/create',[CategoryController::class , 'create'])->name('category_create');

    Route::get('/admin/category/{category}/edit',[CategoryController::class , 'edit'])->name('category_edit');

    Route::post('/admin/category/store', [CategoryController::class, 'store']);

    Route::post('/admin/category/{category}/update', [CategoryController::class, 'update']);

    Route::get('/admin/products',[ProductController::class ,'index'])->name('products');

    Route::get('/admin/product/{product}',[ProductController::class ,'show'])->where('product','[0-9]+')->name('product');

    Route::get('/admin/product/create',[ProductController::class , 'create'])->name('product_create');

    Route::get('/admin/product/{product}/edit',[ProductController::class , 'edit']);

    Route::post('/admin/product/{product}/update',[ProductController::class , 'update']);

    Route::post('/admin/product/store', [ProductController::class, 'store']);

    Route::post('/admin/product/delete', [ProductController::class, 'destroy']);

    Route::get('/admin/orders' , [OrderController::class , 'orders']);

    Route::get('/admin/customers' , [UserController::class , 'customers']);



});

Route::middleware(['auth', 'customer' , 'verified'])->group(function () {

    Route::get('/customer', [UserController::class , 'customer'])->middleware('auth' , 'customer');
    Route::get('/confirm/order', [OrderController::class , 'confirm']);
    Route::get('/customer/{id}/orders' , [UserController::class , 'user_orders']);
});

require __DIR__.'/auth.php';
