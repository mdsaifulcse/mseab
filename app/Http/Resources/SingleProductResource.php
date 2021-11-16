<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SingleProductResource extends JsonResource
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
            'title'=>$this->title,
            'slug'=>$this->slug,
            'regular_price'=>$this->regular_price,
            'sale_price'=>$this->sale_price,
            'category'=>$this->category?$this->category->title:'',
            'tax_percentage'=>$this->tax_percentage,
            'badge'=>$this->badge,
            'average_ratings'=>$this->average_ratings,
            'short_description'=>$this->short_description,
            'description'=>$this->description,
            'images'=>$this->images,
        ];
        //return parent::toArray($request);
    }
}
