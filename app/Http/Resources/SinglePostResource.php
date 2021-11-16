<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SinglePostResource extends JsonResource
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
            'author_id'=>$this->user?$this->user->id:'',
            'author'=>$this->user?$this->user->name:'',
            'authorPhoto'=>$this->user->userInfo?url('/'.$this->user->userInfo->photo):'',
            'title'=>$this->title,
            'description'=>$this->description,
            'status'=>$this->status,
            'postPhoto'=>!empty($this->photo)?url('/'.$this->photo):'',
            'created_at'=>date('M-d-Y',strtotime($this->created_at)),
            'myReact'=>in_array(auth()->user()->id,$this->reacts->pluck('user_id')->toArray())?true:false,
            'totalReact'=>$this->reacts->count(),
            'totalComment'=>$this->comments->count(),
        ];
        //return parent::toArray($request);
    }
}
