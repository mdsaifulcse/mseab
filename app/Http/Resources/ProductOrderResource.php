<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductOrderResource extends JsonResource
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
            'status'=>$this->status,
            'payment_status'=>$this->payment_status,
            'total'=>$this->total,
            'payment_gateway'=>$this->payment_gateway,
            'payment_date'=>!empty($this->payment_date)?date('d-M-Y',strtotime($this->payment_date)):'',
        ];
        //return parent::toArray($request);
    }
}
