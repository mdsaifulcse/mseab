<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserFullProfileResource extends JsonResource
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
            'photo'=>$this->userInfo?url('/'.$this->userInfo->photo):'',
            'phone'=>$this->phone,
            'email'=>$this->email,
            'present_address'=>$this->userInfo?$this->userInfo->present_address:'',
            'permanent_address'=>$this->userInfo?$this->userInfo->permanent_address:'',
            'father_name'=>$this->userInfo?$this->userInfo->father_name:'',
            'mother_name'=>$this->userInfo?$this->userInfo->mother_name:'',
            'business_name'=>$this->userInfo?$this->userInfo->business_name:'',
            'business_address'=>$this->userInfo?$this->userInfo->business_address:'',
            'blood_group'=>$this->userInfo?$this->userInfo->blood_group:'',
            'nid'=>$this->userInfo?$this->userInfo->nid:'',
            'nominee_name'=>$this->userInfo?$this->userInfo->nominee_name:'',
            'nominee_nid'=>$this->userInfo?$this->userInfo->nominee_nid:'',
            'nominee_address'=>$this->userInfo?$this->userInfo->nominee_address:'',
            'nominee_phone'=>$this->userInfo?$this->userInfo->nominee_phone:'',
            'relation_with_nominee'=>$this->userInfo?$this->userInfo->relation_with_nominee:'',
            'nominee_photo'=>$this->userInfo?url('/'.$this->userInfo->nominee_photo):'',
            'followers'=>0,
            'points'=>0,
        ];
        //return parent::toArray($request);
    }
}
