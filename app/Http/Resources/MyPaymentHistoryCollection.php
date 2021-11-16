<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class MyPaymentHistoryCollection extends JsonResource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'=>$this->id,
            'transaction_id'=>$this->transaction_id,
            'payment_gateway'=>$this->payment_gateway,
            'fee_amount'=>$this->fee_amount,
            'payment_date'=>$this->payment_date,
        ];
        //return parent::toArray($request);
    }
}
