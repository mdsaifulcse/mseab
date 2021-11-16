<?php

namespace App\Http\Controllers\Api\V1\Community;

use App\Http\Controllers\Controller;
use App\Http\Resources\PostResourceCollection;
use App\Http\Resources\SinglePostResource;
use App\Http\Traits\ApiResponseTrait;
use App\Notification;
use App\Post;
use App\PostComment;
use App\PostReact;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use DB;
class PostApiController extends Controller
{
    use ApiResponseTrait;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function newsFeed(Request $request)
    {

        $myPosts=Post::with('user','user.userInfo','reacts','comments')->withCount('reacts')->where(['status'=>Post::PUBLISHED]);

        if ($request->has('search'))
        {
            $search=$request->search;
            $myPosts=$myPosts->where('posts.title', 'like','%'.$search.'%')
                ->orWhere('posts.description','like','%'.$search.'%')
                ->orWhereHas('user', function($query) use ($search) {
                    $query->where('users.name', 'like','%'.$search.'%');
                });

            //return count($myPosts);
        }

        if ($request->has('orderBy'))
        {
            $myPosts=$myPosts->orderBy('reacts_count', 'DESC');
        }else{
            $myPosts=$myPosts->orderBy('created_at','DESC');
        }


       $myPosts=$myPosts->paginate(10);


        return $this->respondWithSuccess('News Feed Post',PostResourceCollection::make($myPosts),Response::HTTP_OK);
    }


    public function index()
    {
        $myPosts=Post::with('user','user.userInfo','reacts','comments')->where(['user_id'=>auth()->user()->id])
           ->orderBy('created_at','DESC')->paginate(8);

        return $this->respondWithSuccess('My All Posts',PostResourceCollection::make($myPosts),Response::HTTP_OK);
    }



    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $validateFields=[
            'post_id'=> "required|exists:posts,id",
            'react' => "required|in:Like,Dislike,Unlike,Report",
        ];


        $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

        if ($validateResponse!='pass')
        {
            return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
        }
        DB::beginTransaction();
        try{

            if ($request->react==PostReact::REPORT)
            {

                $myReactAsReport=PostReact::where(['user_id'=>auth()->user()->id,'post_id'=>$request->post_id,'react'=>$request->react])->first();

                if (empty($myReactAsReport))
                {
                    $myReactAsReport= PostReact::create([
                        'user_id'=>auth()->user()->id,
                        'post_id'=>$request->post_id,
                        'react'=>$request->react,
                        'status'=>PostReact::PUBLISHED,
                    ]);
                }else{
                    $myReactAsReport->update([
                        'react'=>$request->react,
                    ]);
                }


                $postReports=PostReact::where(['post_id'=>$request->post_id,'react'=>PostReact::REPORT])->get();

                $message='New post report has been saved successfully';
                if (count($postReports)>=2) {
                     PostReact::where(['post_id'=>$request->post_id])->delete();
                     Post::where('id', $request->post_id)->delete();
                    $myReactAsReport=[];
                    $message='Post has been removed successfully';
                }

                DB::commit();
                return $this->respondWithSuccess($message,$myReactAsReport,Response::HTTP_CREATED);
            }



            $react=PostReact::where(['user_id'=>auth()->user()->id,'post_id'=>$request->post_id,])->first();

            $post=Post::findOrFail($request->post_id);

            if (empty($react))
            {
                $react= PostReact::create([
                    'user_id'=>auth()->user()->id,
                    'post_id'=>$request->post_id,
                    'react'=>$request->react,
                    'status'=>PostReact::PUBLISHED,
                ]);


                Notification::create([
                    'user_id' => auth()->user()->id ,
                    'title' =>  'You '.$request->react.' a post',
                    'description' =>  $post->title,
                    'type'=>Notification::COMMUNITY
                ]);
                
            }else{
                $react->update([
                    'react'=>$request->react,
                ]);
            }


            DB::commit();
            return $this->respondWithSuccess('New post react has been saved successfully',[$react],Response::HTTP_CREATED);
        }catch (\Exception $e)
        {
            DB::rollback();
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validateFields=[
            'title'=> "required|max:100",
            'description' => "required|max:1000",
            'photo' => 'nullable|image|mimes:jpg,jpeg,bmp,png,webp,gif|max:5120',
        ];


        $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

        if ($validateResponse!='pass')
        {
            return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        DB::beginTransaction();
        try{

            $photo='';

            if ($request->hasFile('photo')) { $photo=\MyHelper::photoUpload($request->file('photo'),'images/post',420);}

            $post= Post::with('user','user.userInfo','reacts','comments')->create([
                'user_id'=>auth()->user()->id,
                'title'=>$request->title,
                'description'=>$request->description,
                'photo'=>$photo,
                'status'=>Post::PUBLISHED,
            ]);

            Notification::create([
                'user_id'=>auth()->user()->id,
                'title'=>'You posted a new topic',
                'description'=>$request->title,
                'type'=>Notification::COMMUNITY
            ]);

            DB::commit();
            return $this->respondWithSuccess('New post has been saved successfully',New SinglePostResource($post),Response::HTTP_CREATED);
        }catch (\Exception $e)
        {
            DB::rollback();
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show($postId)
    {

        try{
            $myPost=Post::with('user','user.userInfo','reacts','comments')->where(['user_id'=>auth()->user()->id,'id'=>$postId])->first();

            if (empty($myPost))
            {
                return $this->respondWithError('No Post Data Found !',[],Response::HTTP_NOT_FOUND);
            }


            return $this->respondWithSuccess('Single Post Data',New SinglePostResource($myPost),Response::HTTP_CREATED);
        }catch (\Exception $e)
        {
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $postId)
    {
        $validateFields=[
                        'title'=> "required|max:100",
                        'description' => "required|max:1000",
                        'photo' => 'nullable|image|mimes:jpg,jpeg,bmp,png,webp,gif|max:5120',
                        ];


        $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

        if ($validateResponse!='pass')
        {
            return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        try{
            $myPost=Post::where(['user_id'=>auth()->user()->id,'id'=>$postId])->first();

            if (empty($myPost))
            {
                return $this->respondWithError('No Post Data Found !',[],Response::HTTP_NOT_FOUND);
            }

            $photo='';

            if ($request->hasFile('photo')) {
                $photo=\MyHelper::photoUpload($request->file('photo'),'images/post',420);

                if (!empty($myPost) && file_exists($myPost->photo)){
                    unlink($myPost->photo);
                }
            }

            $myPost->update([
                'title'=>$request->title,
                'description'=>$request->description,
                'photo'=>$photo,
            ]);


            return $this->respondWithSuccess('Your post has been update successfully',New SinglePostResource($myPost),Response::HTTP_CREATED);
        }catch (\Exception $e)
        {
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy($postId)
    {

        try{
            $myPost=Post::where(['user_id'=>auth()->user()->id,'id'=>$postId])->first();

            if (empty($myPost))
            {
                return $this->respondWithError('No Post Data Found !',[],Response::HTTP_NOT_FOUND);
            }


            if (!empty($myPost) && file_exists($myPost->photo)){
                unlink($myPost->photo);
            }

            $myPost->delete();

            return $this->respondWithSuccess('Your post has been Removed successfully',[],Response::HTTP_OK);
        }catch (\Exception $e)
        {
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
