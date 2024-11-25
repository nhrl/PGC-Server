<?php

namespace App\Http\Controllers;
use App\Models\customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        
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
            'first_name' =>'required',
            'last_name' =>'required',
            'age' =>'required',
            'address' =>'required',
            "email" =>'required',
            'username' =>'required',
            'password' =>'required',
        ]);
            customer::create($data);
            return response()->json(true);
    }

    public function login(Request $request) {
        $user = customer::where('username','=',$request->username)->first();
        if($user && $request->password == $user->password) {
            return response()->json($user->emp_id);
        } else {
            return response()->json("unathorized");
        }
    }


    /**
     * Display the specified resource.
     */
    public function show(Request $request)
    {
        $data = customer::find($request->id);
        return response()->json($data);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, $id)
    {
        $customer = customer::find($id);
        $customer->first_name = $request->input('first_name');
        $customer->last_name = $request->input('last_name');
        $customer->age =  $request->input('age');
        $customer->address = $request->input('address');

        //deleting the current profile if it is not a default image
        if ($customer->profile != 'default.jpg') {
            Storage::delete('public/images/customer/' . $customer->profile);
        }

        if ($request->hasFile('profile')) {
            $file = $request->file('profile');
            $originalFileName = $file->getClientOriginalName();
            $fileName = pathinfo($originalFileName, PATHINFO_FILENAME) . '.' . $file->getClientOriginalExtension();
            $path = $file->storeAs('public/images/customer', $fileName);
            $customer->profile = $originalFileName;
            $customer->update();
            return response()->json('Profile updated successfully');
        }
    }

    public function count() {
        $total = customer::count();
        return response()->json($total);
    }
}
