<?php

namespace App\Http\Controllers;

use App\Blog;
use App\Donation;
use App\Events;
use App\Jobs;
use App\Knowledgebase;
use App\Language;
use App\Menu;
use App\Page;
use App\Products;
use App\Services;
use App\Works;
use Illuminate\Http\Request;

class MenuController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }
    public function index(){
        $all_menu = Menu::all()->groupBy('lang');
        $all_language = Language::all();
        return view('backend.pages.menu.menu-index')->with([
            'all_menu' => $all_menu,
            'all_languages' => $all_language,
        ]);
    }

    public function store_new_menu(Request $request){
        $this->validate($request,[
            'content' => 'nullable',
            'title' => 'required',
            'lang' => 'nullable|string',
        ]);

        Menu::create([
            'content' => $request->page_content,
            'title' => $request->title,
            'lang' => $request->lang,
        ]);

        return redirect()->back()->with([
            'msg' => __('New Menu Created...'),
            'type' => 'success'
        ]);
    }
    public function edit_menu($id){
        $page_post = Menu::find($id);
        $all_page = Page::where(['status'=>'publish','lang' => $page_post->lang])->get();
        $all_language = Language::all();
        $all_services = Services::where(['status'=>'publish','lang' => $page_post->lang])->get();
        $all_events = Events::where(['status'=>'publish','lang' => $page_post->lang])->get();
        $all_works = Works::where(['status'=>'publish','lang' => $page_post->lang])->get();
        $all_blogs = Blog::where(['status'=>'publish','lang' => $page_post->lang])->get();
        $all_jobs = Jobs::where(['status'=>'publish','lang' => $page_post->lang])->get();
        $all_knowledgebase = Knowledgebase::where(['status'=>'publish','lang' => $page_post->lang])->get();
        $all_products = Products::where(['status'=>'publish','lang' => $page_post->lang])->get();
        $all_donations = Donation::where(['status'=>'publish','lang' => $page_post->lang])->get();

        return view('backend.pages.menu.menu-edit')->with([
            'page_post' => $page_post,
            'all_page' => $all_page,
            'all_languages' => $all_language,
            'all_services' => $all_services,
            'all_events' => $all_events,
            'all_works' => $all_works,
            'all_blogs' => $all_blogs,
            'all_jobs' => $all_jobs,
            'all_knowledgebase' => $all_knowledgebase,
            'all_products' => $all_products,
            'all_donations' => $all_donations,
        ]);
    }
    public function update_menu(Request $request,$id){

        $this->validate($request,[
            'content' => 'nullable',
            'lang' => 'nullable|string',
            'title' => 'required',
        ]);
        Menu::where('id',$id)->update([
            'content' => $request->menu_content,
            'lang' => $request->lang,
            'title' => $request->title,
        ]);

        return redirect()->back()->with([
            'msg' => __('Menu updated...'),
            'type' => 'success'
        ]);
    }
    public function delete_menu(Request $request,$id){
        Menu::find($id)->delete();
        return redirect()->back()->with([
            'msg' => __('Menu Delete Success...'),
            'type' => 'danger'
        ]);
    }

    public function set_default_menu(Request $request,$id){
        $lang = Menu::find($id);
        Menu::where(['status' => 'default', 'lang' => $lang->lang])->update(['status' => '']);

        Menu::find($id)->update(['status' => 'default']);
        $lang->status = 'default';
        $lang->save();
        return redirect()->back()->with([
            'msg' => 'Default Menu Set To '.$lang->title,
            'type' => 'success'
        ]);
    }

    public function mega_menu_item_select_markup(Request $request){

        return render_mega_menu_item_select_markup($request->type,$request->menu_id);
    }
}
