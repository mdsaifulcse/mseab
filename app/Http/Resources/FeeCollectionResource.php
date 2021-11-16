<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class FeeCollectionResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return[
            'id'=>$this->id,
            'status'=>$this->status,
            'fee_amount'=>$this->fee_amount,
            'transaction_id'=>$this->transaction_id,
            'payment_date'=>strtotime($this->payment_date),
    ];

        //return parent::toArray($request);
    }
}
