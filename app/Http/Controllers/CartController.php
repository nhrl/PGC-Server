<?php

namespace App\Http\Controllers;

use App\Models\cart;
use App\Models\inventory;
use GrahamCampbell\ResultType\Success;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($id)
    {
        $item = cart::where('user_id',$id)->get();
        return response()->json($item);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
      
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'user_id' => 'required',
            'item_name' => 'required',
            'quantity' => 'required',
            'price' => 'required',
            'image' => 'required',
            'category' => 'required',
        ]);
        cart::create($data);
        return response()->json(true);
    }

    //Delete all Data
    public function deleteAllData()
    {
        try {
            // Specify your table name
            $tableName = 'carts';

            // Truncate the table
            DB::table($tableName)->truncate();

            return response()->json(['message' => 'All data deleted successfully']);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
   
    public function buyNow(Request $request, $productId) {
        $buyQty = $request->input('quantity');
        $data = $request->validate([
            'user_id' => 'required',
            'item_name' => 'required',
            'quantity' => 'required',
            'price' => 'required',
            'image' => 'required',
            'category' => 'required',
        ]);
        $invetory = inventory::find($productId);
        $invetory->quantity -= $buyQty;
        $invetory->save();
        cart::create($data);
        return response()->json(true);
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $product = cart::find($id);
        $product->delete();
        return response()->json("success");
    }

    public function fromCart(Request $request) {
        $cartId = $request->input('cart_id');
        $item_name = $request->input('item_name');
        $updatedQuantity = $request->input('quantity');

        $cart = Cart::find($cartId);
        $cart->quantity = $updatedQuantity;

        $inventory = inventory::where('name', $item_name)->first();

        if ($inventory) {
            $inventory->quantity -= $updatedQuantity;

            // Save changes
            $cart->save();
            $inventory->save();

            return response()->json("success");
        }
    }
}
