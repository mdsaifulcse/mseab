<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            'name'=>$this->name,
            'phone'=>$this->phone,
            'email'=>$this->email,
            'present_address'=>$this->userInfo?$this->userInfo->present_address:'',
            'photo'=>$this->userInfo?url('/'.$this->userInfo->photo):'',
            'father_name'=>$this->userInfo?$this->userInfo->father_name:'',
            'mother_name'=>$this->userInfo?$this->userInfo->mother_name:'',
            'followers'=>0,
            'points'=>0,
        ];
        //return parent::toArray($request);
    }
}
