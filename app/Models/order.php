<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class order extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'customer_name',
        'customer_address',
        'item_name',
        'quantity',
        'total',
        'image',
        'category'
    ];
    protected $primaryKey = 'order_id';
}
