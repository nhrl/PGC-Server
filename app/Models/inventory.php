<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class inventory extends Model
{
    use HasFactory;
    protected $table = 'inventories';

    protected $fillable = [
        'name',
        'description',
        'price',
        'quantity',
        'categorie',
        'image',
    ];
}
