<?php

namespace App\Http\Controllers;

use App\Models\order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($id)
    {
        $item = order::where('user_id',$id)->get();
        return response()->json($item);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'user_id' => 'required',
            'customer_name' => 'required',
            'customer_address' => 'required',
            'item_name' => 'required',
            'quantity' => 'required',
            'total' => 'required',
            'image' => 'required',
            'category' => 'required',
        ]);

        order::create($data);
        return response()->json(true);
    }

    /**
     * Display the specified resource.
     */
    public function show($status)
    {
        $product = order::where('status',$status)->get();
        return response()->json($product);
    }

    public function sale() {
        $count = order::where('status', '=', 'Delivered')->count();
        return response()->json($count);
    }

    public function calculateTotalIncome()
    {
        $totalIncome = order::where('status', '=', 'Delivered')->sum('total');
        return $totalIncome;
    }

    public function updateStatus($orderId, $newStatus)
    {
        $order = order::find($orderId);
        $order->status = $newStatus;
        $order->save();
    }

    public function countCategory($category)
    {
        $count = order::where('category',$category)
                    ->where('status', 'Delivered')
                    ->count();
        return response()->json($count);
    }

    public function countAll() {
        $count = order::where('status','Delivered')->count();
        return response()->json($count);
    }
}
