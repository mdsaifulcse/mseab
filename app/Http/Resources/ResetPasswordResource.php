<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ResetPasswordResource extends JsonResource
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
            'password_reset_otp'=>$this->password_reset_otp,
            'otp_validity'=>$this->otp_validity,
            'otp_status'=>$this->otp_status,
            'id'=>$this->id,
            'first_name'=>$this->userInfo->first_name,
            'last_name'=>$this->userInfo->last_name,
            'phone'=>$this->phone,
            'email'=>$this->email,
            'photo'=>$this->userInfo?url('/'.$this->userInfo->photo):'',
            'father_name'=>$this->userInfo?$this->userInfo->father_name:'',
            'mother_name'=>$this->userInfo?$this->userInfo->mother_name:'',
            
        ];
        //return parent::toArray($request);
    }
}
