<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class cart extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'item_name',
        'quantity',
        'price',
        'image',
        'category',
    ];
    protected $primaryKey = 'cart_id';
}
