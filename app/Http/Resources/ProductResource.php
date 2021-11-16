<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
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
            'title'=>$this->title,
            'slug'=>$this->slug,
            'regular_price'=>$this->regular_price,
            'sale_price'=>$this->sale_price,
            'badge'=>$this->badge,
            'category'=>$this->category?$this->category->title:'',
            'image'=>$this->image?get_attachment_image_by_id($this->image,'thumb')['img_url']:'',
        ];
        //return parent::toArray($request);
    }
}
