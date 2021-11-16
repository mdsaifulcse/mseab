<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CommentResource extends JsonResource
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
            'author_id'=>$this->user_id,
            'author'=>$this->user?$this->user->name:'',
            'authorPhoto'=>$this->user->userInfo?url('/'.$this->user->userInfo->photo):'',
            'comments'=>$this->comments,
            'status'=>$this->status,
            'created_at'=>date('M-d-Y',strtotime($this->created_at)),
            'myReact'=>in_array(auth()->user()->id,$this->commentReact->pluck('user_id')->toArray())?true:false,
            'totalReact'=>$this->commentReact->count(),
        ];
        //return parent::toArray($request);
    }
}
