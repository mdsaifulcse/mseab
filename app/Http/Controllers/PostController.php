<?php

namespace App\Http\Controllers;

use App\Brand;
use App\Post;
use Carbon\Carbon;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index(Request $request){
//        dd(Carbon::now()->subHour());
        $time = '';
        $carbon = Carbon::now();
        $posts_query = Post::with('user','user.userInfo','reacts','comments')->withCount('reacts');
        if($request->get('time')){
            $time = $request->time;
        }
        if($time == 'last_five_minutes'){
            $allPosts = $posts_query->where('created_at','>=',$carbon->subMinutes(5)->toDateTimeString());
        }elseif($time == 'last_ten_minutes'){
            $allPosts = $posts_query->where('created_at','>=',$carbon->subMinutes(10)->toDateTimeString());
        }elseif($time == 'last_thirty_minutes'){
            $allPosts = $posts_query->where('created_at','>=',$carbon->subMinutes(30)->toDateTimeString());
        }elseif($time == 'last_hour'){
            $allPosts = $posts_query->where('created_at','>=',$carbon->subHour()->toDateTimeString());
        }elseif($time == 'last_five_hours'){
            $allPosts = $posts_query->where('created_at','>=',$carbon->subHours(5)->toDateTimeString());
        }elseif ($time == 'last_twelve_hours'){
            $allPosts = $posts_query->where('created_at','>=',$carbon->subHours(12)->toDateTimeString());
        }elseif ($time == 'last_twenty_four_hours'){
            $allPosts = $posts_query->where('created_at','>=',$carbon->subDay()->toDateTimeString());
        }else{
            $allPosts = $posts_query;
        }


        if ($request->has('search'))
        {
            $search=$request->search;
            $allPosts=$allPosts->where('posts.title', 'like','%'.$search.'%')
                ->orWhere('posts.description','like','%'.$search.'%');

            //return count($allPosts);
        }

        if ($request->has('orderBy'))
        {
            $allPosts=$allPosts->orderBy('reacts_count', 'DESC');
        }else{
            $allPosts=$allPosts->orderBy('created_at','DESC');
        }


        $allPosts=$allPosts->paginate(10);
        return view('backend.community.all-posts')->with(['allPosts' => $allPosts]);
    }

    public function store(Request $request){

        $this->validate($request,[
            'title' => 'required|string|max:191',
            'image' => 'nullable|string|max:191',
            'url' => 'nullable|string|max:191',
        ]);

        Brand::create($request->all());

        return redirect()->back()->with(['msg' => __('New Brand Added...'),'type' => 'success']);
    }

    public function update(Request $request){

        $this->validate($request,[
            'title' => 'required|string|max:191',
            'image' => 'nullable|string|max:191',
            'url' => 'nullable|string|max:191',
        ]);

        Brand::find($request->id)->update([
            'title' => $request->title,
            'image' => $request->image,
            'url' => $request->url,
        ]);

        return redirect()->back()->with(['msg' => __('Brands Updated...'),'type' => 'success']);
    }

    public function deleteOPost(Request $request){


        Post::find($request->id)->delete();
        return redirect()->back()->with(['msg' =>__( 'Delete Success...'),'type' => 'danger']);
    }


}
