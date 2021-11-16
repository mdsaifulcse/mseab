<?php

namespace App\Http\Controllers;

use App\EventAttendance;
use App\FeeCollection;
use App\ProductOrder;
use App\User;
use App\UserInfo;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class FeeCollectionController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }


    public function getAllFeeCollectionData(Request $request)
    {
        $payment = $request->payment;
        $date = $request->date;

        $feeCollections = '';
        $collection = FeeCollection::with('feeUser')->orderBy('created_at', 'desc');
        if ($payment && $date) {
            if ($payment == 'due') {
                $collection = $collection->where('status','pending');
                $feeCollections = $this->checkDate($date,$collection);
            } else {
                $collection->where('payment_type', 'Advance');
                $feeCollections = $this->checkDate($date,$collection);
            }
        } elseif ($payment) {
            $payment == 'due' ? $collection->where('status', 'pending') : $collection->where('payment_type', 'Advance');
            $feeCollections = $collection->get();
        } elseif ($date) {
            $feeCollections = $this->checkDate($date,$collection);
        } else {
            $feeCollections = $collection->get();
        }

        return view('backend.fee-collection.all-fee-collection')->with(['feeCollections' => $feeCollections]);
    }

    public function checkDate($date,$collection){
        $carbon = Carbon::now();
        $feeCollections = '';
        switch ($date) {
            case "daily":
                $feeCollections = $collection->whereDate('created_at', Carbon::today())->get();
                break;
            case "weekly":
                $feeCollections = $collection->where('week_number', $carbon->weekOfYear)->get();
                break;
            case "monthly":
                $feeCollections =  $collection->whereMonth('created_at', $carbon->month)->get();
                break;
            case "yearly":
                $feeCollections = $collection->whereYear('created_at', $carbon->year)->get();
                break;
        }
        return $feeCollections;
    }
}
