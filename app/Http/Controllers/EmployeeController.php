<?php

namespace App\Http\Controllers;

use App\Models\employee;
use Illuminate\Http\Request;
use App\Http\Requests\UpdateemployeeRequest;
use Illuminate\Support\Facades\Storage;
class EmployeeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        return "hello";
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
            'username' =>'required',
            'password' =>'required',
        ]);
            employee::create($data);
            return response()->json(true);
    }

    public function valid(Request $request) {
        $user = employee::where('username','=',$request->username)->first();
        if($user && $request->password == $user->password) {
            return response()->json($user->emp_id);
        } else {
            return response()->json(false);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request)
    {
        $data = employee::find($request->id);
        return response()->json($data);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, $employeeId)
    {
        $employee = Employee::find($employeeId);
        $employee->first_name = $request->input('first_name');
        $employee->last_name = $request->input('last_name');
        $employee->age =  $request->input('editage');
        $employee->address = $request->input('editaddress');

        //deleting the current profile if it is not a default image
        if ($employee->profile != 'default.jpg') {
            Storage::delete('public/images/profile/' . $employee->profile);
        }

        if ($request->hasFile('profile')) {
            $file = $request->file('profile');
            $originalFileName = $file->getClientOriginalName();
            $fileName = pathinfo($originalFileName, PATHINFO_FILENAME) . '.' . $file->getClientOriginalExtension();
            $path = $file->storeAs('public/images/profile', $fileName);
            $employee->profile = $originalFileName;
            $employee->update();
            return response()->json([
                'message' => 'Employee updated successfully',
                'employee' => $employee,
            ]);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateemployeeRequest $request, employee $employee)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(employee $employee)
    {
        //
    }
    public function profile($filename)
    {
     
        try {
            // Check if the file exists in the 'public/images/profile' directory
            $filePath = "public/images/profile/{$filename}";

            if (Storage::exists($filePath)) {
                // File exists, return the picture's URL
                $picture = [
                    'filename' => $filename,
                    'url' => asset("storage/images/profile/{$filename}"), // Construct the full URL
                ];

                return response()->json($picture);
            } else {
                // File not found
                return response()->json(['error' => 'Picture not found.'], 404);
            }
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error fetching picture.'], 500);
        
        }
    }
}
