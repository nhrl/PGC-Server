<?php

use App\Http\Controllers\CartController;
use App\Http\Controllers\CustomerController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\InventoryController;
use App\Http\Controllers\OrderController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
//Employee 
Route::post("register",[EmployeeController::class,'store']);
Route::post("login",[EmployeeController::class,'valid']);
Route::get("profile/{id}",[EmployeeController::class,'show']);
Route::get('/pictures/{filename}', [EmployeeController::class, 'profile']);
Route::post("edit-profile/{employeeId}",[EmployeeController::class, 'edit']);


//Product
Route::post('add-product',[InventoryController::class,'store']);
Route::get('product/{category}',[InventoryController::class,'index']);
Route::post('edit-product/{id}',[InventoryController::class,'edit']);
Route::delete('delete-product/{id}',[InventoryController::class,'destroy']);
Route::get('total-product',[InventoryController::class,'count']);
Route::get('lowest-product',[InventoryController::class,'getProductsByLowestQuantity']);


//Customer
Route::post('add-customer',[CustomerController::class,'store']);
Route::post('login-customer',[CustomerController::class,'login']);
Route::get("customer/{id}",[CustomerController::class,'show']);
Route::post("edit-customer-profile/{id}",[CustomerController::class, 'edit']);
Route::get('total-customer',[CustomerController::class, 'count']);

//Cart
Route::post('add-cart',[CartController::class,'store']);
Route::get('cart-item/{id}',[CartController::class,'index']);
Route::delete('remove-item/{id}',[CartController::class,'destroy']);
Route::get('/delete-all-data', [CartController::class, 'deleteAllData']);
Route::post('buy-now/{productId}',[CartController::class, 'buyNow']);
Route::put('proceed-payment',[CartController::class, 'fromCart']);
//Order
Route::post('order',[OrderController::class,'store']);
Route::get('get-order/{id}',[OrderController::class,'index']);
Route::get('get-order-status/{status}',[OrderController::class,'show']);
Route::get('sale',[OrderController::class,'sale']);
Route::get('total-income',[OrderController::class,'calculateTotalIncome']);
Route::post('/orders/{id}/update-status/{newStatus}', [OrderController::class, 'updateStatus']);
Route::get('count/{category}',[OrderController::class, 'countCategory']);
Route::get('count-all',[OrderController::class, 'countAll']);



Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

