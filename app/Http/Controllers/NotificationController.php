<?php

namespace App\Http\Controllers;

use App\BlogCategory;
use App\Language;
use App\Notification;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {
        $notices=Notification::where('type',Notification::NOTICE)->orderBy('id','DESC')->get();
        return view('backend.notification.all-admin-notification',compact('notices'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required|string|max:150',
            'description' => 'required|string|max:300',
        ]);

        try {

            Notification::create([
                'title'=>$request->title,
                'description'=>$request->description,
                'type'=>Notification::NOTICE,
                'read_status'=>Notification::UNREAD,
            ]);

            return redirect()->back()->with(['msg' => __('New Notice Created Successfully'),'type'=>'success']);
        } catch (\Exception $e) {

            return redirect()->back()->with(['msg' => __($e->getMessage()),'type'=>'danger']);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Notification  $notification
     * @return \Illuminate\Http\Response
     */
    public function show(Notification $notification)
    {
        return 'sdfsdd';
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Notification  $notification
     * @return \Illuminate\Http\Response
     */
    public function edit(Notification $notification)
    {

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Notification  $notification
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Notification $notification)
    {
        $this->validate($request, [
            'title' => 'required|string|max:150',
            'description' => 'required|string|max:300',
        ]);




        try {

            $notification->update([
                'title'=>$request->title,
                'description'=>$request->description,
            ]);

            return redirect()->back()->with(['msg' => __(' Notice Update Successfully'),'type'=>'success']);
        } catch (\Exception $e) {

            return redirect()->back()->with(['msg' => __($e->getMessage()),'type'=>'danger']);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Notification  $notification
     * @return \Illuminate\Http\Response
     */
    public function destroy(Notification $notification)
    {
        try {
            $notification->delete();

            return redirect()->back()->with(['msg' => __(' Notice Delete Successfully'),'type'=>'success']);
        } catch (\Exception $e) {

            return redirect()->back()->with(['msg' => __($e->getMessage()),'type'=>'danger']);
        }
    }
}
