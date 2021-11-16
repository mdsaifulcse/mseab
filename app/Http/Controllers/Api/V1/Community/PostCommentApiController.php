<?php

namespace App\Http\Controllers\Api\V1\Community;

use App\Http\Controllers\Controller;
use App\Http\Resources\CommentResourceCollection;
use App\Http\Resources\SingleCommentResource;
use App\Http\Traits\ApiResponseTrait;
use App\Notification;
use App\Post;
use App\PostComment;
use App\PostCommentReact;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use DB;

class PostCommentApiController extends Controller
{
    use ApiResponseTrait;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $validateFields=[
            'comment_id'=> "required|exists:post_comments,id",
            'react' => "required|in:Like,Dislike,Unlike",
        ];


        $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

        if ($validateResponse!='pass')
        {
            return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        DB::beginTransaction();
        try{


            if ($request->react==PostCommentReact::REPORT)
            {

                $myCommentReactAsReport=PostCommentReact::where(['user_id'=>auth()->user()->id,'comment_id'=>$request->comment_id,'react'=>$request->react])->first();

                if (empty($myCommentReactAsReport))
                {
                    $myCommentReactAsReport= PostCommentReact::create([
                        'user_id'=>auth()->user()->id,
                        'comment_id'=>$request->comment_id,
                        'react'=>$request->react,
                        'status'=>PostCommentReact::PUBLISHED,
                    ]);
                }else{
                    $myCommentReactAsReport->update([
                        'react'=>$request->react,
                    ]);
                }


                $commentReports=PostCommentReact::where(['comment_id'=>$request->comment_id,'react'=>PostCommentReact::REPORT])->get();

                $message='New Comment report has been saved successfully';
                if (count($commentReports)>=10) {
                    PostCommentReact::where(['post_id'=>$request->post_id,'react'=>PostCommentReact::REPORT])->delete();
                    PostComment::where('id', $request->comment_id)->delete();
                    $message='Comment has been removed successfully';
                    $myCommentReactAsReport=[];
                }

                DB::commit();
                return $this->respondWithSuccess($message,$myCommentReactAsReport,Response::HTTP_CREATED);
            }



            $commentReact=PostCommentReact::where(['user_id'=>auth()->user()->id,'comment_id'=>$request->comment_id,])->first();

            if (empty($commentReact))
            {
                $commentReact= PostCommentReact::create([
                    'user_id'=>auth()->user()->id,
                    'comment_id'=>$request->comment_id,
                    'react'=>$request->react,
                    'status'=>PostCommentReact::PUBLISHED,
                ]);
            }else{
                $commentReact->update([
                    'react'=>$request->react,
                ]);
            }



            return $this->respondWithSuccess('New comments react has been saved successfully',[$commentReact],Response::HTTP_CREATED);
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
            'post_id'=> "required|exists:posts,id",
            'comments' => "required|max:500",
        ];


        $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

        if ($validateResponse!='pass')
        {
            return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        DB::beginTransaction();
        try{

            $photo='';

            if ($request->hasFile('photo')) { $photo=\MyHelper::photoUpload($request->file('photo'),'images/post-comment',420);}

            $postComment= PostComment::with('commentReact','user','user.userInfo')->create([
                'user_id'=>auth()->user()->id,
                'post_id'=>$request->post_id,
                'comments'=>$request->comments,
                'status'=>PostComment::PUBLISHED,
            ]);

            $post=Post::findOrFail($request->post_id);


            Notification::create([
                'user_id' => auth()->check() ? auth()->user()->id : null,
                'title' =>  'You commented on a post',
                'description' =>  $post->title,
                'type'=>Notification::COMMUNITY
            ]);

            DB::commit();
            return $this->respondWithSuccess('New comments has been saved successfully',New SingleCommentResource($postComment),Response::HTTP_CREATED);
        }catch (\Exception $e)
        {
            DB::commit();
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\PostComment  $postComment
     * @return \Illuminate\Http\Response
     */
    public function show($postId)
    {
        $postComments=PostComment::with('commentReact','user','user.userInfo')->where(['post_id'=>$postId])
            ->orderBy('created_at','DESC')->paginate(8);

        return $this->respondWithSuccess('All Comments under the post',CommentResourceCollection::make($postComments),Response::HTTP_OK);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\PostComment  $postComment
     * @return \Illuminate\Http\Response
     */
    public function edit(PostComment $postComment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\PostComment  $postComment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PostComment $postComment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\PostComment  $postComment
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            $postComment=PostComment::where(['id'=>$id])->first();

            if (empty($postComment))
            {
                return $this->respondWithError('No Post Comment Data Found !',[],Response::HTTP_NOT_FOUND);
            }

            if ($postComment->user_id!=auth()->user()->id)
            {
                return $this->respondWithError('You do not have permission to delete this comment',[],Response::HTTP_UNPROCESSABLE_ENTITY);
            }


            if (!empty($postComment) && file_exists($postComment->photo)){
                unlink($postComment->photo);
            }

            $postComment->delete();

            return $this->respondWithSuccess('Your post has been Removed successfully',[],Response::HTTP_OK);
        }catch (\Exception $e)
        {
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
