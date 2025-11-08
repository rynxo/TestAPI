<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HppController;

Route::post('/hpp/add', [HppController::class, 'add']);

Route::put('/hpp/update/{id}', [HppController::class, 'update']);

Route::delete('/hpp/remove/{id}', [HppController::class, 'remove']);

Route::get('/hpp/list', [HppController::class, 'list']);