<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hpp extends Model
{
    use HasFactory;
    protected $fillable = [
    'description',
    'date',
    'qty',
    'price',
    'cost',
    'total_cost',
    'qty_balance',
    'value_balance',
    'hpp',
];

}
