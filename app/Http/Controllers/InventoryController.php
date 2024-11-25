<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Storage;
use App\Models\inventory;
use Illuminate\Http\Request;


class InventoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($categories)
    {
        $product = inventory::where('categorie',$categories)->get();
        return response()->json($product);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'name' =>'required',
            'price' =>'required',
            'description' =>'required',
            'quantity' =>'required',
            'categorie'=> 'required',
            'image' => 'image|mimes:jpeg,png,jpg,gif|max:2048'
        ]);
        
        if($request->hasFile('image')) {
           
            $file = $request->file('image');
           
            $originalFileName = $file->getClientOriginalName();
            
            $fileName = pathinfo($originalFileName, PATHINFO_FILENAME) . '.' . $file->getClientOriginalExtension();
            
            $path = $file->storeAs('public/images/product', $fileName);
           
            $data['image'] = $fileName;
            $product = new inventory($data);
            $product->save();
        }
            return response()->json(true);
    }
   
    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, $id)
    {
        $product = inventory::find($id);
        $product->name = $request->input('name');
        $product->description = $request->input('description');
        $product->price = $request->input('price');
        $product->quantity = $request->input('quantity');
        $product->categorie = $request->input('categorie');

        if($request->hasFile('image')) {
            Storage::delete('public/images/product/' . $product->profile);
            $file = $request->file('image');
            $originalFileName = $file->getClientOriginalName();
            $fileName = pathinfo($originalFileName, PATHINFO_FILENAME) . '.' . $file->getClientOriginalExtension();
            $file->storeAs('public/images/product/', $fileName);
            $product->image = $originalFileName;
            $product->update();
            return response()->json([
                'message' => 'product updated successfully',
                'product' => $product,
            ]);
        }
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $product = inventory::find($id);
        $product->delete();
    }

    //Count total product store in the database 
    public function count() {
        $totalProducts = inventory::count();
        return response()->json($totalProducts);
    }

    //Get all product by lowest quantity
    public function getProductsByLowestQuantity()
    {
        $products = inventory::orderBy('quantity')->get();
        return response()->json($products);
    }
}
