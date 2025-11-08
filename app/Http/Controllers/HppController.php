<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Hpp;

class HppController extends Controller
{

    public function add(Request $request)
    {
        $request->validate([
            'qty' => 'required|numeric',
            'price' => 'required|numeric',
            'date' => 'required|date',
            'type' => 'required|in:Pembelian,Penjualan',
        ]);

        $before = Hpp::where('date', '<=', $request->date)
            ->orderBy('date', 'desc')
            ->orderBy('id', 'desc')
            ->first();

        $qty_before = $before->qty_balance ?? 0;
        $value_before = $before->value_balance ?? 0;
        $hpp_before = $before->hpp ?? 0;

        if ($request->type == 'Penjualan') {
            if($request->qty > 0 ) {
                return response()->json([
                    'message' => 'Gunakan (-) diawal angka.'
                ], 422);
            }
            if (abs($request->qty) > $qty_before) {
                return response()->json([
                    'message' => 'Stok tidak mencukupi, transaksi digagalkna.'
                ], 422);
            }
            $cost = $hpp_before;
            $total_cost = $request->qty * $cost;
            $qty_balance = $qty_before + $request->qty;
            $value_balance = $qty_balance * $cost;
            $hpp = $cost;
        } else {
            $cost = $request->price;
            $total_cost = $request->qty * $cost;
            $qty_balance = $qty_before + $request->qty; 
            $value_balance = $value_before + $total_cost;
            $hpp = $qty_balance > 0 ? $value_balance / $qty_balance : 0;
        }

        $insert = Hpp::create([
            'description' => $request->type,
            'date' => $request->date,
            'qty' => $request->qty,
            'price' => $request->price,
            'cost' => $cost,
            'total_cost' => $total_cost,
            'qty_balance' => $qty_balance,
            'value_balance' => $value_balance,
            'hpp' => $hpp,
        ]);

        $this->hitungUlang($insert);

        return response()->json([
            'message' => 'Data berhasil ditambahkan',
            'data' => $insert
        ]);
    }

    private function hitungUlang($startRecord = null)
    {
        if (!$startRecord) {
            $startRecord = Hpp::orderBy('date')->orderBy('id')->first();
            if (!$startRecord) return;
        }

        $qty_balance = $startRecord->qty_balance ?? 0;
        $value_balance = $startRecord->value_balance ?? 0;
        $hpp = $startRecord->hpp ?? 0;

        $afterRecords = Hpp::where(function ($q) use ($startRecord) {
            $q->where('date', '>', $startRecord->date)
            ->orWhere(function ($q2) use ($startRecord) {
                $q2->where('date', '=', $startRecord->date)
                    ->where('id', '>', $startRecord->id);
            });
        })->orderBy('date')->orderBy('id')->get();

        foreach ($afterRecords as $row) {
            if ($row->description == 'Pembelian') {
                $cost = $row->cost;
                $total_cost = $row->qty * $cost;
                $qty_balance += $row->qty; 
                $value_balance += $total_cost;
                $hpp = $qty_balance > 0 ? $value_balance / $qty_balance : 0;
            } else {
                $cost = $hpp;
                $total_cost = $row->qty * $cost;
                $qty_balance += $row->qty;
                $value_balance = $qty_balance * $cost;
            }

            $row->update([
                'cost' => $cost,
                'total_cost' => $total_cost,
                'qty_balance' => $qty_balance,
                'value_balance' => $value_balance,
                'hpp' => $hpp,
            ]);
        }
    }


    public function update(Request $request, $id)
    {
        $request->validate([
            'qty' => 'required|numeric',
            'price' => 'nullable|numeric',
            'date' => 'required|date',
            'type' => 'required|in:Pembelian,Penjualan',
        ]);

        $hpp = Hpp::find($id);
        if (!$hpp) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        $last = Hpp::where('id', '<', $id)->orderBy('id', 'desc')->first();

        $qty_balance_sebelumnya = $last->qty_balance ?? 0;
        $value_balance_sebelumnya = $last->value_balance ?? 0;
        $hpp_sebelumnya = $last->hpp ?? 0;

        if ($request->type == 'Pembelian') {
            $cost = $request->price;
        } else { 
            if($request->qty > 0 ) {
                    return response()->json([
                        'message' => 'Gunakan (-) diawal angka.'
                    ], 422);
                }
            $cost = $hpp_sebelumnya;
        }
        
        

        $total_cost = $request->qty * $cost;

        if ($request->type == 'Pembelian') {
            $qty_balance = $qty_balance_sebelumnya + $request->qty;
            $value_balance = $value_balance_sebelumnya + $total_cost;
        } else {
            $qty_balance = $qty_balance_sebelumnya + $request->qty;
            $value_balance = $qty_balance * $cost;
        }

        $hpp_baru = $qty_balance != 0 ? $value_balance / $qty_balance : 0;

        $hpp->update([
            'description' => $request->type,
            'date' => $request->date,
            'qty' => $request->qty,
            'price' => $request->price,
            'cost' => $cost,
            'total_cost' => $total_cost,
            'qty_balance' => $qty_balance,
            'value_balance' => $value_balance,
            'hpp' => $hpp_baru,
        ]);

        $nextRecords = Hpp::where('id', '>', $id)->orderBy('id')->get();
        foreach ($nextRecords as $next) {
            if ($next->description == 'Pembelian') {
                $cost = $next->price;
                $total_cost = $next->qty * $cost;
                $qty_balance += $next->qty;
                $value_balance += $total_cost;
            } else { 
                $cost = $hpp_baru;
                $total_cost = $next->qty * $cost;
                $qty_balance += $next->qty; 
                $value_balance = $qty_balance * $cost;
            }

            $hpp_baru = $qty_balance != 0 ? $value_balance / $qty_balance : 0;

            $next->update([
                'cost' => $cost,
                'total_cost' => $total_cost,
                'qty_balance' => $qty_balance,
                'value_balance' => $value_balance,
                'hpp' => $hpp_baru,
            ]);
        }

        return response()->json([
            'message' => 'Data berhasil diupdate',
            'data' => $hpp,
        ]);
    }


    public function remove($id)
    {
        $hpp = Hpp::find($id);
        if (!$hpp) {
            return response()->json([
                'message' => 'Data tidak ditemukan'
            ], 404);
        }

        $prevRecord = Hpp::where('id', '<', $id)->orderBy('id', 'desc')->first();
        $qty_balance = $prevRecord->qty_balance ?? 0;

        $afterRecords = Hpp::where('id', '>', $id)
            ->orderBy('date')
            ->orderBy('id')
            ->get();

        foreach ($afterRecords as $row) {
            if ($row->description == 'Pembelian') {
                $qty_balance += $row->qty;
            } else {
                $qty_balance += $row->qty;
            }

            if ($qty_balance < 0) {
                return response()->json([
                    'message' => 'Menghapus transaksi ini akan membuat stok minus, proses dibatalkan.'
                ], 422);
            }
        }

        $hpp->delete();

        $this->hitungUlang($prevRecord);

        return response()->json([
            'message' => 'Data berhasil dihapus dan saldo diperbarui'
        ]);
    }


    public function list()
    {
        $data = Hpp::orderBy('date')
            ->orderBy('id')
            ->get();

        $last = $data->last();

        return response()->json([
            'message' => 'Daftar data HPP berhasil diambil',
            'summary' => [
                'total_record' => $data->count(),
                'qty_balance_akhir' => $last->qty_balance ?? 0,
                'value_balance_akhir' => $last->value_balance ?? 0,
                'hpp_akhir' => $last->hpp ?? 0,
            ],
            'data' => $data
        ]);
    }

    


    
}