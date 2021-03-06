<?php

namespace App\Http\Controllers;

use App\Admin;
use App\ContactInfoItem;
use App\Donation;
use App\DonationLogs;
use App\EventAttendance;
use App\EventPaymentLogs;
use App\Events;
use App\EventsCategory;
use App\Faq;
use App\Feedback;
use App\Http\Resources\SingleProductResource;
use App\Http\Resources\ProductResource;
use App\Http\Resources\ProductResourceCollection;
use App\Http\Traits\ApiResponseTrait;
use App\ImageGallery;
use App\ImageGalleryCategory;
use App\JobApplicant;
use App\Jobs;
use App\JobsCategory;
use App\Knowledgebase;
use App\KnowledgebaseTopic;
use App\Language;
use App\Mail\AdminResetEmail;
use App\Mail\CallBack;
use App\Mail\ContactMessage;
use App\Mail\PlaceOrder;
use App\Mail\RequestQuote;
use App\Menu;
use App\Newsletter;
use App\Order;
use App\Page;
use App\PaymentLogs;
use App\ProductCategory;
use App\ProductOrder;
use App\ProductRatings;
use App\Products;
use App\ProductShipping;
use App\Quote;
use App\ServiceCategory;
use App\Services;
use App\Blog;
use App\BlogCategory;
use App\Brand;
use App\HeaderSlider;
use App\KeyFeatures;
use App\PricePlan;
use App\TeamMember;
use App\User;
use App\Counterup;
use App\Testimonial;
use App\Works;
use App\WorksCategory;
use Barryvdh\DomPDF\Facade as PDF;
use Dompdf\Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use Svg\Tag\Image;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Process\Process;

class FrontendController extends Controller
{
    use ApiResponseTrait;
    public function index()
    {
        if (!empty(get_static_option('site_maintenance_mode')) && !Auth::guard('admin')->check()) {
            return view('frontend.maintain');
        }

        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $all_header_slider = HeaderSlider::where('lang', $lang)->get();
        $all_counterup = Counterup::where('lang', $lang)->get();
        $all_key_features = KeyFeatures::where('lang', $lang)->get();
        $all_service = Services::where(['lang' => $lang, 'status' => 'publish'])->orderBy('sr_order', 'ASC')->take(get_static_option('home_page_01_service_area_items'))->get();
        $all_testimonial = Testimonial::where(['lang' => $lang, 'status' => 'publish'])->orderBy('id', 'desc')->get();
        $all_price_plan = PricePlan::where(['lang' => $lang, 'status' => 'publish'])->orderBy('id', 'desc')->take(get_static_option('home_page_01_price_plan_section_items'))->get();;
        $all_team_members = TeamMember::where('lang', $lang)->orderBy('id', 'desc')->take(get_static_option('home_page_01_team_member_items'))->get();;
        $all_brand_logo = Brand::all();
        $all_work = Works::where(['lang' => $lang, 'status' => 'publish'])->orderBy('id', 'desc')->take(get_static_option('home_page_01_case_study_items'))->get();
        $all_blog = Blog::where(['lang' => $lang, 'status' => 'publish'])->orderBy('id', 'desc')->take(6)->get();
        $all_service_category = ServiceCategory::where(['lang' => $lang, 'status' => 'publish'])->orderBy('id', 'desc')->take(get_static_option('home_page_01_service_area_items'))->get();;
        $all_contain_cat = [];
        foreach ($all_work as $work) {
            array_push($all_contain_cat, $work->categories_id);
        }
        $all_work_category = WorksCategory::find($all_contain_cat);

        return view('frontend.frontend-home')->with([
            'all_header_slider' => $all_header_slider,
            'all_counterup' => $all_counterup,
            'all_key_features' => $all_key_features,
            'all_service' => $all_service,
            'all_testimonial' => $all_testimonial,
            'all_blog' => $all_blog,
            'all_price_plan' => $all_price_plan,
            'all_team_members' => $all_team_members,
            'all_brand_logo' => $all_brand_logo,
            'all_work_category' => $all_work_category,
            'all_work' => $all_work,
            'all_service_category' => $all_service_category,
        ]);
    }

    public function flutterwave_pay_get()
    {
        return redirect_404_page();
    }

    public function blog_page()
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $all_recent_blogs = Blog::where('lang', $lang)->orderBy('id', 'desc')->take(get_static_option('blog_page_recent_post_widget_item'))->get();
        $all_blogs = Blog::where('lang', $lang)->orderBy('id', 'desc')->paginate(get_static_option('blog_page_item'));
        $all_category = BlogCategory::where(['status' => 'publish', 'lang' => $lang])->orderBy('id', 'desc')->get();
        return view('frontend.pages.blog.blog')->with([
            'all_blogs' => $all_blogs,
            'all_categories' => $all_category,
            'all_recent_blogs' => $all_recent_blogs,
        ]);
    }

    public function category_wise_blog_page($id)
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $all_blogs = Blog::where(['blog_categories_id' => $id, 'lang' => $lang])->orderBy('id', 'desc')->paginate(get_static_option('blog_page_item'));
        $all_recent_blogs = Blog::where('lang', $lang)->orderBy('id', 'desc')->take(get_static_option('blog_page_recent_post_widget_item'))->get();
        $all_category = BlogCategory::where(['status' => 'publish', 'lang' => $lang])->orderBy('id', 'desc')->get();
        $category_name = BlogCategory::where(['id' => $id, 'status' => 'publish'])->first()->name;
        return view('frontend.pages.blog.blog-category')->with([
            'all_blogs' => $all_blogs,
            'all_categories' => $all_category,
            'category_name' => $category_name,
            'all_recent_blogs' => $all_recent_blogs,
        ]);
    }

    public function tags_wise_blog_page($tag)
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $all_blogs = Blog::where('lang', $lang)->Where('tags', 'LIKE', '%' . $tag . '%')
            ->orderBy('id', 'desc')->paginate(get_static_option('blog_page_item'));
        $all_recent_blogs = Blog::where('lang', $lang)->orderBy('id', 'desc')->take(get_static_option('blog_page_recent_post_widget_item'))->get();
        $all_category = BlogCategory::where(['status' => 'publish', 'lang' => $lang])->orderBy('id', 'desc')->get();
        return view('frontend.pages.blog.blog-tags')->with([
            'all_blogs' => $all_blogs,
            'all_categories' => $all_category,
            'tag_name' => $tag,
            'all_recent_blogs' => $all_recent_blogs,
        ]);
    }

    public function blog_search_page(Request $request)
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $all_recent_blogs = Blog::where('lang', $lang)->orderBy('id', 'desc')->take(get_static_option('blog_page_recent_post_widget_item'))->get();
        $all_category = BlogCategory::where(['status' => 'publish', 'lang' => $lang])->orderBy('id', 'desc')->get();
        $all_blogs = Blog::where('lang', $lang)->Where('title', 'LIKE', '%' . $request->search . '%')
            ->orderBy('id', 'desc')->paginate(get_static_option('blog_page_item'));

        return view('frontend.pages.blog.blog-search')->with([
            'all_blogs' => $all_blogs,
            'all_categories' => $all_category,
            'search_term' => $request->search,
            'all_recent_blogs' => $all_recent_blogs,
        ]);
    }

    public function blog_single_page($slug)
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $blog_post = Blog::where('slug', $slug)->first();

        $all_recent_blogs = Blog::where(['lang' => $lang])->orderBy('id', 'desc')->paginate(get_static_option('blog_page_recent_post_widget_item'));
        $all_category = BlogCategory::where(['status' => 'publish', 'lang' => $lang])->orderBy('id', 'desc')->get();

        $all_related_blog = Blog::where('lang', $lang)->Where('blog_categories_id', $blog_post->blog_categories_id)->orderBy('id', 'desc')->take(6)->get();

        return view('frontend.pages.blog.blog-single')->with([
            'blog_post' => $blog_post,
            'all_categories' => $all_category,
            'all_recent_blogs' => $all_recent_blogs,
            'all_related_blog' => $all_related_blog,
        ]);
    }


    public function dynamic_single_page($slug)
    {
        $page_post = Page::where('slug', $slug)->first();
        return view('frontend.pages.dynamic-single')->with([
            'page_post' => $page_post
        ]);
    }

    public function showAdminForgetPasswordForm()
    {
        return view('auth.admin.forget-password');
    }

    public function sendAdminForgetPasswordMail(Request $request)
    {
        $this->validate($request, [
            'username' => 'required|string:max:191'
        ]);
        $user_info = Admin::where('username', $request->username)->orWhere('email', $request->username)->first();
        if (!empty($user_info)) {
            $token_id = Str::random(30);
            $existing_token = DB::table('password_resets')->where('email', $user_info->email)->delete();
            if (empty($existing_token)) {
                DB::table('password_resets')->insert(['email' => $user_info->email, 'token' => $token_id]);
            }
            $message = 'Here is you password reset link, If you did not request to reset your password just ignore this mail. <a class="btn" href="' . route('admin.reset.password', ['user' => $user_info->username, 'token' => $token_id]) . '">Click Reset Password</a>';
            $data = [
                'username' => $user_info->username,
                'message' => $message
            ];
            Mail::to($user_info->email)->send(new AdminResetEmail($data));

            return redirect()->back()->with([
                'msg' => __('Check Your Mail For Reset Password Link'),
                'type' => 'success'
            ]);
        }
        return redirect()->back()->with([
            'msg' => __('Your Username or Email Is Wrong!!!'),
            'type' => 'danger'
        ]);
    }

    public function showAdminResetPasswordForm($username, $token)
    {
        return view('auth.admin.reset-password')->with([
            'username' => $username,
            'token' => $token
        ]);
    }

    public function AdminResetPassword(Request $request)
    {
        $this->validate($request, [
            'token' => 'required',
            'username' => 'required',
            'password' => 'required|string|min:8|confirmed'
        ]);
        $user_info = Admin::where('username', $request->username)->first();
        $user = Admin::findOrFail($user_info->id);
        $token_iinfo = DB::table('password_resets')->where(['email' => $user_info->email, 'token' => $request->token])->first();
        if (!empty($token_iinfo)) {
            $user->password = Hash::make($request->password);
            $user->save();
            return redirect()->route('admin.login')->with(['msg' => __('Password Changed Successfully'), 'type' => 'success']);
        }

        return redirect()->back()->with(['msg' => __('Somethings Going Wrong! Please Try Again or Check Your Old Password'), 'type' => 'danger']);
    }

    public function lang_change(Request $request)
    {
        session()->put('lang', $request->lang);
        return redirect()->route('homepage');
    }

    public function home_page_change($id)
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $all_header_slider = HeaderSlider::where('lang', $lang)->get();
        $all_counterup = Counterup::where('lang', $lang)->get();
        $all_key_features = KeyFeatures::where('lang', $lang)->get();
        $all_service = Services::where(['lang' => $lang, 'status' => 'publish'])->orderBy('sr_order', 'asc')->take(get_static_option('home_page_01_service_area_items'))->get();
        $all_service_category = ServiceCategory::where(['lang' => $lang, 'status' => 'publish'])->orderBy('id', 'desc')->take(get_static_option('home_page_01_service_area_items'))->get();;
        $all_testimonial = Testimonial::where(['lang' => $lang, 'status' => 'publish'])->orderBy('id', 'desc')->get();
        $all_price_plan = PricePlan::where(['lang' => $lang, 'status' => 'publish'])->orderBy('id', 'desc')->take(get_static_option('home_page_01_price_plan_section_items'))->get();;
        $all_team_members = TeamMember::where('lang', $lang)->orderBy('id', 'desc')->take(get_static_option('home_page_01_team_member_items'))->get();;
        $all_brand_logo = Brand::all();
        $all_work = Works::where(['lang' => $lang, 'status' => 'publish'])->orderBy('id', 'desc')->take(get_static_option('home_page_01_case_study_items'))->get();
        $all_blog = Blog::where(['lang' => $lang, 'status' => 'publish'])->orderBy('id', 'desc')->take(6)->get();
        $all_contain_cat = [];
        foreach ($all_work as $work) {
            array_push($all_contain_cat, $work->categories_id);
        }
        $all_work_category = WorksCategory::find($all_contain_cat);

        return view('frontend.frontend-home-demo')->with([
            'all_header_slider' => $all_header_slider,
            'all_counterup' => $all_counterup,
            'all_key_features' => $all_key_features,
            'all_service' => $all_service,
            'all_testimonial' => $all_testimonial,
            'all_blog' => $all_blog,
            'all_price_plan' => $all_price_plan,
            'all_team_members' => $all_team_members,
            'all_brand_logo' => $all_brand_logo,
            'all_work_category' => $all_work_category,
            'all_service_category' => $all_service_category,
            'all_work' => $all_work,
            'home_page' => $id,
        ]);
    }

    public function services_single_page($slug)
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $service_item = Services::where('slug', $slug)->first();
        $service_category = ServiceCategory::where(['status' => 'publish', 'lang' => $lang])->get();
        $price_plan =  !empty($service_item) && !empty($service_item->price_plan) ? PricePlan::find(unserialize($service_item->price_plan)) : '' ;
        return view('frontend.pages.service.service-single')->with(['service_item' => $service_item, 'service_category' => $service_category,'price_plan' => $price_plan]);
    }

    public function category_wise_services_page($id, $any)
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $category_name = ServiceCategory::find($id)->name;
        $service_item = Services::where(['categories_id' => $id, 'lang' => $lang])->paginate(6);
        return view('frontend.pages.service.service-category')->with(['service_items' => $service_item, 'category_name' => $category_name]);
    }

    public function work_single_page($slug)
    {
        $work_item = Works::where('slug', $slug)->first();
        $all_works = [];
        $all_related_works = [];
        foreach ($work_item->categories_id as $cat) {
            $all_by_cat = Works::where(['lang' => get_user_lang()])->where('categories_id', 'LIKE', '%' . $work_item->$cat . '%')->take(6)->get();
            for ($i = 0; $i < count($all_by_cat); $i++) {
                array_push($all_works, $all_by_cat[$i]);
            }
        }
        array_unique($all_works);
        return view('frontend.pages.work.work-single')->with(['work_item' => $work_item, 'related_works' => $all_works]);
    }

    public function about_page()
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $all_brand_logo = Brand::all();
        $all_team_members = TeamMember::where('lang', $lang)->orderBy('id', 'desc')->take(get_static_option('about_page_team_member_item'))->get();
        $all_testimonial = Testimonial::where('lang', $lang)->orderBy('id', 'desc')->take(get_static_option('about_page_testimonial_item'))->get();
        $all_key_features = KeyFeatures::where('lang', $lang)->get();
        return view('frontend.pages.about')->with([
            'all_brand_logo' => $all_brand_logo,
            'all_team_members' => $all_team_members,
            'all_testimonial' => $all_testimonial,
            'all_key_features' => $all_key_features,
        ]);
    }

    public function service_page()
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $all_services = Services::where('lang', $lang)->orderBy('sr_order', 'asc')->paginate(get_static_option('service_page_service_items'));
        return view('frontend.pages.service.services')->with(['all_services' => $all_services]);
    }

    public function work_page()
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $all_work = Works::where(['lang' => $lang])->orderBy('id', 'desc')->paginate(12);
        $all_contain_cat = [];
        foreach ($all_work as $work) {
            array_push($all_contain_cat, $work->categories_id);
        }
        $all_work_category = WorksCategory::find($all_contain_cat);

        return view('frontend.pages.work.work')->with(['all_work' => $all_work, 'all_work_category' => $all_work_category]);
    }

    public function team_page()
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $all_team_members = TeamMember::where('lang', $lang)->orderBy('id', 'desc')->paginate(12);

        return view('frontend.pages.team-page')->with(['all_team_members' => $all_team_members]);
    }

    public function faq_page()
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $all_faq = Faq::where(['lang' => $lang, 'status' => 'publish'])->get();
        return view('frontend.pages.faq-page')->with([
            'all_faqs' => $all_faq
        ]);
    }

    public function contact_page()
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $all_contact_info = ContactInfoItem::where('lang', $lang)->get();
        return view('frontend.pages.contact-page')->with([
            'all_contact_info' => $all_contact_info
        ]);
    }

    public function plan_order($id)
    {
        $order_details = PricePlan::find($id);
        return view('frontend.pages.package.order-page')->with([
            'order_details' => $order_details
        ]);
    }

    public function request_quote()
    {
        return view('frontend.pages.quote-page');
    }

    public function subscribe_newsletter(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|string|email|max:191|unique:newsletters'
        ],
            [
                'required' => __('Enter Valid Email'),
                'unique' => __('This Email Already Registered'),
            ]);
        Newsletter::create($request->all());
        return response()->json(__('Thanks for Subscribe Our Newsletter'));
    }

    public function category_wise_works_page($id)
    {

        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $category = WorksCategory::find($id);
        $all_works = Works::where('lang', $lang)->where('categories_id', 'LIKE', '%' . $id . '%')->paginate(12);
        $category_name = $category->name;
        $all_category = WorksCategory::where('lang', $lang)->get();
        return view('frontend.pages.work-category')->with(['all_work' => $all_works, 'category_name' => $category_name, 'all_work_category' => $all_category]);

    }


    public function price_plan_page()
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $all_price_plan = PricePlan::where(['lang' => $lang])->get()->groupBy('categories_id');
        return view('frontend.pages.price-plan')->with(['all_price_plan' => $all_price_plan]);
    }

    public function order_confirm($id)
    {
        $order_details = Order::find($id);
        return view('frontend.payment.order-confirm')->with(['order_details' => $order_details]);
    }

    public function booking_confirm($id)
    {
        $attendance_details = EventAttendance::find($id);
        return view('frontend.payment.booking-confirm')->with(['attendance_details' => $attendance_details]);
    }

    public function event_payment_success($id)
    {
        $extract_id = substr($id,6);
        $extract_id =  substr($extract_id,0,-6);
        $attendance_details = EventAttendance::find($extract_id);
        if (empty($attendance_details)){
            return view('frontend.pages.404');
        }
        $payment_log = EventPaymentLogs::where('attendance_id', $attendance_details->id)->first();
        $event_details = Events::find($attendance_details->event_id);

        return view('frontend.pages.events.attendance-success')->with([
            'attendance_details' => $attendance_details,
            'payment_log' => $payment_log,
            'event_details' => $event_details,
        ]);
    }

    public function event_payment_cancel($id)
    {
        $attendance_details = EventAttendance::find($id);
        return view('frontend.pages.events.attendance-cancel')->with(['attendance_details' => $attendance_details]);
    }

    public function order_payment_success($id)
    {
        $extract_id = substr($id,6);
        $extract_id =  substr($extract_id,0,-6);
        $order_details = Order::find($extract_id);
//        return $order_details;
        if (empty($order_details)){
            return view('frontend.pages.404');
        }
        $package_details = PricePlan::find($order_details->package_id);
        $payment_details = PaymentLogs::where('order_id', $extract_id)->first();
        return view('frontend.payment.payment-success')->with(
            [
                'order_details' => $order_details,
                'package_details' => $package_details,
                'payment_details' => $payment_details,
            ]);
    }

    public function order_payment_cancel($id)
    {
        $order_details = Order::find($id);
        return view('frontend.payment.payment-cancel')->with(['order_details' => $order_details]);
    }

    //donation

    public function donations()
    {
        $all_donations = Donation::where(['status' => 'publish', 'lang' => get_user_lang()])->orderBy('id', 'desc')->paginate(get_static_option('donor_page_post_items'));

        return view('frontend.pages.donations.donation')->with([
            'all_donations' => $all_donations
        ]);
    }

    public function donations_single($slug)
    {
        $donation = Donation::where('slug', $slug)->first();
        if (empty($donation)) {
            return redirect_404_page();
        }
        $all_donations = DonationLogs::where(['status' => 'complete', 'donation_id' => $donation->id])->orderBy('id', 'desc')->paginate(5);
        return view('frontend.pages.donations.donation-single')->with([
            'all_donations' => $all_donations,
            'donation' => $donation,
        ]);
    }

    //jobs
    public function jobs()
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;

        $all_jobs = Jobs::where(['status' => 'publish', 'lang' => $lang])->orderBy('id', 'desc')->paginate(get_static_option('site_job_post_items'));
        $all_job_category = JobsCategory::where(['status' => 'publish', 'lang' => $lang])->get();
        return view('frontend.pages.jobs.jobs')->with([
            'all_jobs' => $all_jobs,
            'all_job_category' => $all_job_category,
        ]);
    }

    public function jobs_category($id, $any)
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;

        $all_jobs = Jobs::where(['status' => 'publish', 'lang' => $lang, 'category_id' => $id])->orderBy('id', 'desc')->paginate(get_static_option('site_job_post_items'));

        $all_job_category = JobsCategory::where(['status' => 'publish', 'lang' => $lang])->get();
        $category_name = JobsCategory::find($id)->title;
        return view('frontend.pages.jobs.jobs-category')->with([
            'all_jobs' => $all_jobs,
            'all_job_category' => $all_job_category,
            'category_name' => $category_name,
        ]);
    }

    public function jobs_search(Request $request)
    {

        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;

        $all_jobs = Jobs::where(['status' => 'publish', 'lang' => $lang])->where('title', 'LIKE', '%' . $request->search . '%')->paginate(get_static_option('site_job_post_items'));
        $all_job_category = JobsCategory::where(['status' => 'publish', 'lang' => $lang])->get();
        $search_term = $request->search;

        return view('frontend.pages.jobs.jobs-search')->with([
            'all_jobs' => $all_jobs,
            'all_job_category' => $all_job_category,
            'search_term' => $search_term,
        ]);
    }

    public function jobs_single($slug)
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;

        $job = Jobs::where('slug', $slug)->first();
        if (empty($job)) {
            return redirect_404_page();
        }
        $all_job_category = JobsCategory::where(['status' => 'publish', 'lang' => $lang])->get();
        return view('frontend.pages.jobs.jobs-single')->with([
            'job' => $job,
            'all_job_category' => $all_job_category
        ]);
    }

    public function jobs_apply($id)
    {
        $job = Jobs::find($id);
        return view('frontend.pages.jobs.jobs-apply')->with([
            'job' => $job
        ]);
    }

    public function categories(Request $request)
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $categories = ProductCategory::select('id','title')->where(['status' => 'publish', 'lang' => $lang])->get();

        if ($request->wantsJson()) {

           // return $this->respondWithSuccess('Product Slug List', $all_productSlugs,Response::HTTP_OK);
            return $this->respondWithSuccess('Category List', $categories,Response::HTTP_OK);
        }

        return view('frontend.pages.products.categories')->with([
            'categories' => $categories,
        ]);
    }



    //products
    public function products(Request $request)
    {

        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $selected_rating = $request->rating ? $request->rating : '';
        $query =  Products::with('category');

        if ($selected_rating) {
            $product_ids = [];
            $all_products_id = ProductRatings::where('ratings', '>=', $selected_rating)->get('product_id');
            foreach ($all_products_id as $product_id) {
                array_push($product_ids, $product_id->product_id);
            }
            $query->find(array_unique($product_ids));
        }
        $query->where(['status' => 'publish', 'lang' => $lang]);
        $maximum_available_price = Products::max('sale_price');
        $all_category = ProductCategory::where(['status' => 'publish', 'lang' => $lang])->get();

        $selected_category = $request->cat_id ? $request->cat_id : '';
        $search_term = $request->q ? $request->q : '';
        $selected_order = $request->orderby ? $request->orderby : 'default';

        if ($selected_category) {
            $query->where(['category_id' => $selected_category]);
        }

        $min_price = $request->min_price ? $request->min_price : 0;
        $max_price = $request->max_price ? $request->max_price : $maximum_available_price;
        if ($min_price) {
            $query->where('sale_price', '>=', $min_price);
        }
        if ($max_price) {
            $query->where('sale_price', '<=', $max_price);
        }
        if ($search_term) {
            $query->where('title', 'LIKE', '%' . $search_term . '%');
        }
        if ($selected_order == 'old') {
            $query->orderBy('id', 'ASC');
        } elseif ($selected_order == 'high_low') {
            $query->orderBy('sale_price', 'DESC');
        } elseif ($selected_order == 'low_high') {
            $query->orderBy('sale_price', 'ASC');
        } else {
            $query->orderBy('id', 'DESC');
        }


        if ($request->wantsJson()) {

            $all_products=$query->paginate(8);
            return $this->respondWithSuccess('Product List',ProductResourceCollection::make($all_products),Response::HTTP_OK);

            }

        $all_products = $query->paginate(get_static_option('product_post_items'));

        return view('frontend.pages.products.products')->with([
            'all_products' => $all_products,
            'all_category' => $all_category,
            'search_term' => $search_term,
            'selected_rating' => $selected_rating,
            'selected_order' => $selected_order,
            'min_price' => $min_price,
            'max_price' => $max_price,
            'selected_category' => $selected_category,
            'maximum_available_price' => $maximum_available_price
        ]);
    }


    public function product_single($slug,Request $request)
    {
        $product = Products::with('category')->where('slug', $slug)->first();
        if (empty($product)) {

            if ($request->wantsJson()) {
                return $this->respondWithError('No Content Found',[],Response::HTTP_NOT_FOUND);
            }

            return redirect_404_page();
        }
        $related_products = Products::where('category_id', $product->category_id)->get()->except($product->id)->take(4);
        $average_ratings = ProductRatings::Where('product_id', $product->id)->pluck('ratings')->avg();

        if ($request->wantsJson()) {


            $productGalleryImages=[];
            if (!empty($product->gallery))
            {
                $product_gallery_images = !empty( $product->gallery) ? explode('|', $product->gallery) : [];

                foreach ($product_gallery_images as $key=>$gl_img){

                    $productGalleryImages[$key]=get_attachment_image_by_id($gl_img)['img_url'];
                }

            }else{
                $productGalleryImages[0]=get_attachment_image_by_id($product->image)['img_url'];
            }

            $product['average_ratings']=$average_ratings;
            $product['images']=$productGalleryImages;

            return $this->respondWithSuccess('Product Details', New SingleProductResource($product),Response::HTTP_OK);
        }

        return view('frontend.pages.products.product-single')->with(
            [
                'product' => $product,
                'related_products' => $related_products,
                'average_ratings' => $average_ratings
            ]);
    }


    public function product_single_gallery($slug,Request $request)
    {

        try{
            $product = Products::where('slug', $slug)->first();

            if (empty($product)) {
                return $this->respondWithError('No Content Found',[],Response::HTTP_NOT_FOUND);
            }

            $productGalleryImages=[];
            if (!empty($product->gallery))
            {
                $product_gallery_images = !empty( $product->gallery) ? explode('|', $product->gallery) : [];

                foreach ($product_gallery_images as $key=>$gl_img){

                    $productGalleryImages[$key]=get_attachment_image_by_id($gl_img)['img_url'];
                }

            }else{
                $productGalleryImages[0]=get_attachment_image_by_id($product->image)['img_url'];
            }

            return $this->respondWithSuccess('Product Gallery Images', $productGalleryImages,Response::HTTP_OK);

        }catch (Exception $e){
            return $this->respondWithError('No Content Found',[],Response::HTTP_NOT_FOUND);
        }


    }


    public function products_category($id, $any)
    {
        $all_products = Products::where(['status' => 'publish', 'category_id' => $id])->orderBy('id', 'desc')->paginate(get_static_option('product_post_items'));
        $category_name = ProductCategory::find($id)->title;
        return view('frontend.pages.products.product-category')->with([
            'all_products' => $all_products,
            'category_name' => $category_name,
        ]);
    }

    public function products_cart(Request $request)
    {
        $all_cart_items = get_cart_items();
        $all_shipping = ProductShipping::where(['lang' => get_default_language(), 'status' => 'publish'])->orderBy('order', 'ASC')->get();

        if ($request->wantsJson()) {

            return $this->respondWithSuccess('Product Cart List', $all_cart_items,Response::HTTP_OK);
        }

        return view('frontend.pages.products.product-cart')->with([
            'all_cart_items' => $all_cart_items,
            'all_shipping' => $all_shipping,
        ]);
    }

    public function product_checkout()
    {
        return view('frontend.pages.products.product-checkout');
    }

    public function product_payment_success($id)
    {
        $extract_id = substr($id,6);
        $extract_id =  substr($extract_id,0,-6);
        $order_details = ProductOrder::find($extract_id);
        if (empty($order_details)) {
            return redirect_404_page();
        }
        return view('frontend.pages.products.product-success')->with(['order_details' => $order_details]);
    }

    public function product_payment_cancel($id)
    {
        $order_details = ProductOrder::find($id);
        if (empty($order_details)) {
            return redirect_404_page();
        }
        return view('frontend.pages.products.product-cancel')->with(['order_details' => $order_details]);
    }

    public function product_ratings(Request $request)
    {
        $this->validate($request, [
            'product_id' => 'required',
            'ratings' => 'required',
            'ratings_message' => 'nullable|string'
        ]);

        $existing_rating = ProductRatings::where(['product_id' => $request->product_id, 'user_id' => auth()->user()->id])->first();
        if (!empty($existing_rating)) {
            return redirect()->back()->with(['msg' => __('You have already rated this product'), 'type' => 'danger']);
        }
        ProductRatings::create([
            'ratings' => $request->ratings,
            'message' => $request->ratings_message,
            'product_id' => $request->product_id,
            'user_id' => auth()->user()->id
        ]);

        return redirect()->back()->with(['msg' => __('Thanks for your rating'), 'type' => 'success']);
    }

    //events
    public function events()
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;

        $all_events = Events::where(['status' => 'publish', 'lang' => $lang])->orderBy('id', 'desc')->paginate(get_static_option('site_events_post_items'));
        $all_event_category = EventsCategory::where(['status' => 'publish', 'lang' => $lang])->get();
        return view('frontend.pages.events.event')->with([
            'all_events' => $all_events,
            'all_event_category' => $all_event_category,
        ]);
    }

    public function events_category($id, $any)
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;

        $all_events = Events::where(['status' => 'publish', 'lang' => $lang, 'category_id' => $id])->orderBy('id', 'desc')->paginate(get_static_option('site_events_post_items'));
        $all_events_category = EventsCategory::where(['status' => 'publish', 'lang' => $lang])->get();
        $category_name = EventsCategory::find($id)->title;

        return view('frontend.pages.events.event-category')->with([
            'all_events' => $all_events,
            'all_events_category' => $all_events_category,
            'category_name' => $category_name,
        ]);
    }

    public function events_search(Request $request)
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;

        $all_events = Events::where(['status' => 'publish', 'lang' => $lang])->where('title', 'LIKE', '%' . $request->search . '%')->paginate(get_static_option('site_events_post_items'));
        $all_events_category = EventsCategory::where(['status' => 'publish', 'lang' => $lang])->get();
        $search_term = $request->search;

        return view('frontend.pages.events.event-search')->with([
            'all_events' => $all_events,
            'all_event_category' => $all_events_category,
            'search_term' => $search_term,
        ]);
    }

    public function events_single($slug)
    {

        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;

        $event = Events::where('slug', $slug)->first();
        if (empty($event)) {
            return redirect_404_page();
        }
        $all_events_category = EventsCategory::where(['status' => 'publish', 'lang' => $lang])->get();
        return view('frontend.pages.events.event-single')->with([
            'event' => $event,
            'all_event_category' => $all_events_category
        ]);
    }

    public function event_booking($id)
    {
        $event = Events::find($id);
        return view('frontend.pages.events.event-booking')->with([
            'event' => $event
        ]);
    }

    //knowledgebase
    public function knowledgebase()
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;

        $all_knowledgebase = Knowledgebase::where(['status' => 'publish', 'lang' => $lang])->paginate(get_static_option('site_knowledgebase_post_items'))->groupby('topic_id');
        $all_knowledgebase_category = KnowledgebaseTopic::where(['status' => 'publish', 'lang' => $lang])->get();
        $popular_articles = Knowledgebase::where(['status' => 'publish', 'lang' => $lang])->orderBy('views', 'desc')->get()->take(5);
        return view('frontend.pages.knowledgebase.knowledgebase')->with([
            'all_knowledgebase' => $all_knowledgebase,
            'popular_articles' => $popular_articles,
            'all_knowledgebase_category' => $all_knowledgebase_category,
        ]);
    }

    public function knowledgebase_category($id, $any)
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;

        $all_knowledgebase = Knowledgebase::where(['status' => 'publish', 'lang' => $lang, 'topic_id' => $id])->orderBy('views', 'desc')->paginate(get_static_option('site_knowledgebase_post_items'));
        $all_knowledgebase_category = KnowledgebaseTopic::where(['status' => 'publish', 'lang' => $lang])->get();
        $popular_articles = Knowledgebase::where(['status' => 'publish', 'lang' => $lang])->orderBy('views', 'desc')->get()->take(5);
        $category_name = KnowledgebaseTopic::find($id)->title;
        return view('frontend.pages.knowledgebase.knowledgebase-category')->with([
            'all_knowledgebase' => $all_knowledgebase,
            'all_knowledgebase_category' => $all_knowledgebase_category,
            'popular_articles' => $popular_articles,
            'category_name' => $category_name,
        ]);
    }

    public function knowledgebase_search(Request $request)
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;

        $all_knowledgebase = Knowledgebase::where(['status' => 'publish', 'lang' => $lang])->where('title', 'LIKE', '%' . $request->search . '%')->orderBy('views', 'desc')->paginate(get_static_option('site_knowledgebase_post_items'));
        $all_knowledgebase_category = KnowledgebaseTopic::where(['status' => 'publish', 'lang' => $lang])->get();
        $popular_articles = Knowledgebase::where(['status' => 'publish', 'lang' => $lang])->orderBy('views', 'desc')->get()->take(5);
        $search_term = $request->search;

        return view('frontend.pages.knowledgebase.knowledgebase-search')->with([
            'all_knowledgebase' => $all_knowledgebase,
            'all_knowledgebase_category' => $all_knowledgebase_category,
            'popular_articles' => $popular_articles,
            'search_term' => $search_term,
        ]);
    }

    public function knowledgebase_single($slug)
    {
        $knowledgebase = Knowledgebase::where('slug', $slug)->first();
        if (empty($knowledgebase)) {
            return redirect_404_page();
        }
        $old_views = is_null($knowledgebase->views) ? 0 : $knowledgebase->views + 1;
        Knowledgebase::find($knowledgebase->id)->update(['views' => $old_views]);
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;

        $all_knowledgebase_category = KnowledgebaseTopic::where(['status' => 'publish', 'lang' => $lang])->get();
        $popular_articles = Knowledgebase::where(['status' => 'publish', 'lang' => $lang])->orderBy('views', 'desc')->get()->take(5);
        return view('frontend.pages.knowledgebase.knowledgebase-single')->with([
            'knowledgebase' => $knowledgebase,
            'all_knowledgebase_category' => $all_knowledgebase_category,
            'popular_articles' => $popular_articles,
        ]);
    }


    public function showUserForgetPasswordForm()
    {
        return view('frontend.user.forget-password');
    }

    public function sendUserForgetPasswordMail(Request $request)
    {
        $this->validate($request, [
            'username' => 'required|string:max:191'
        ]);
        $user_info = User::where('username', $request->username)->orWhere('email', $request->username)->first();
        if (!empty($user_info)) {
            $token_id = Str::random(30);
            $existing_token = DB::table('password_resets')->where('email', $user_info->email)->delete();
            if (empty($existing_token)) {
                DB::table('password_resets')->insert(['email' => $user_info->email, 'token' => $token_id]);
            }
            $message = __('Here is you password reset link, If you did not request to reset your password just ignore this mail.') . ' <a class="btn" href="' . route('user.reset.password', ['user' => $user_info->username, 'token' => $token_id]) . '">' . __('Click Reset Password') . '</a>';
            $data = [
                'username' => $user_info->username,
                'message' => $message
            ];
            Mail::to($user_info->email)->send(new AdminResetEmail($data));

            return redirect()->back()->with([
                'msg' => __('Check Your Mail For Reset Password Link'),
                'type' => 'success'
            ]);
        }
        return redirect()->back()->with([
            'msg' => __('Your Username or Email Is Wrong!!!'),
            'type' => 'danger'
        ]);
    }

    public function showUserResetPasswordForm($username, $token)
    {
        return view('frontend.user.reset-password')->with([
            'username' => $username,
            'token' => $token
        ]);
    }

    public function UserResetPassword(Request $request)
    {
        $this->validate($request, [
            'token' => 'required',
            'username' => 'required',
            'password' => 'required|string|min:8|confirmed'
        ]);
        $user_info = User::where('username', $request->username)->first();
        $user = User::findOrFail($user_info->id);
        $token_iinfo = DB::table('password_resets')->where(['email' => $user_info->email, 'token' => $request->token])->first();
        if (!empty($token_iinfo)) {
            $user->password = Hash::make($request->password);
            $user->save();
            return redirect()->route('user.login')->with(['msg' => __('Password Changed Successfully'), 'type' => 'success']);
        }

        return redirect()->back()->with(['msg' => __('Somethings Going Wrong! Please Try Again or Check Your Old Password'), 'type' => 'danger']);
    }

    public function donation_payment_success($id)
    {
        $extract_id = substr($id,6);
        $extract_id =  substr($extract_id,0,-6);
        $donation_logs = DonationLogs::find($extract_id);
        if (empty($donation_logs)) {
            return redirect_404_page();
        }
        $donation = Donation::find($donation_logs->donation_id);
        return view('frontend.pages.donations.donation-success')->with(['donation_logs' => $donation_logs, 'donation' => $donation]);
    }

    public function donation_payment_cancel($id)
    {
        $donation_logs = DonationLogs::find($id);
        if (empty($donation_logs)) {
            return redirect_404_page();
        }
        return view('frontend.pages.donations.donation-cancel')->with(['donation_logs' => $donation_logs]);
    }

    public function generate_invoice(Request $request)
    {
        $order_details = ProductOrder::find($request->order_id);
        if (empty($order_details)) {
            return redirect_404_page();
        }
        $pdf = PDF::loadView('backend.products.pdf.order', ['order_details' => $order_details]);
        return $pdf->download('product-order-invoice.pdf');
    }

    public function generate_donation_invoice(Request $request)
    {
        $donation_details = DonationLogs::find($request->id);
        if (empty($donation_details)) {
            return redirect_404_page();
        }
        $pdf = PDF::loadView('invoice.donation', ['donation_details' => $donation_details]);
        return $pdf->download('donation-invoice.pdf');
    }

    public function generate_event_invoice(Request $request)
    {
        $attendance_details = EventAttendance::find($request->id);
        if (empty($attendance_details)) {
            return redirect_404_page();
        }
        $payment_log = EventPaymentLogs::where(['attendance_id' => $request->id])->first();
        $pdf = PDF::loadView('invoice.event-attendance', ['attendance_details' => $attendance_details, 'payment_log' => $payment_log]);
        return $pdf->download('event-attendance-invoice.pdf');
    }

    public function generate_package_invoice(Request $request)
    {
        $payment_details = PaymentLogs::where(['order_id' => $request->id])->first();
        $order_details = Order::where(['id' => $request->id])->first();
        if (empty($order_details)) {
            return redirect_404_page();
        }
        $pdf = PDF::loadView('invoice.package-order', ['order_details' => $order_details,'payment_details' => $payment_details]);
        return $pdf->download('package-invoice.pdf');
    }

    public function testimonials()
    {
        $default_lang = Language::where('default', 1)->first();
        $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;
        $all_testimonials = Testimonial::where('lang', $lang)->paginate(6);
        return view('frontend.pages.testimonial-page')->with(['all_testimonials' => $all_testimonials]);
    }

    public function feedback_page()
    {
        return view('frontend.pages.feedback-page');
    }

    public function clients_feedback_page()
    {
        $all_feedback = Feedback::all();
        return view('frontend.pages.clients-feedback')->with(['all_feedback' => $all_feedback]);
    }

    public function image_gallery_page()
    {
        $order = !empty(get_static_option('site_image_gallery_order')) ? get_static_option('site_image_gallery_order') : 'DESC';
        $order_by = !empty(get_static_option('site_image_gallery_order_by')) ? get_static_option('site_image_gallery_order_by') : 'id';
        $all_gallery_images = ImageGallery::where(['lang' => get_user_lang()])->orderBy($order_by, $order)->paginate(get_static_option('site_image_gallery_post_items'));
        $all_contain_cat = [];
        foreach ($all_gallery_images as $work) {
            array_push($all_contain_cat, $work->cat_id);
        }
        $all_category = ImageGalleryCategory::find($all_contain_cat);
        return view('frontend.pages.image-gallery')->with(['all_gallery_images' => $all_gallery_images,'all_category' => $all_category]);
    }

    public function donor_list()
    {
        $all_donation_log = DonationLogs::where('status', 'complete')->get();
        return view('frontend.pages.donor-list')->with(['all_donation_log' => $all_donation_log]);
    }

    public function ajax_login(Request $request)
    {
        $this->validate($request, [
            'username' => 'required|string',
            'password' => 'required|min:6'
        ],[
            'username.required'   => __('username required'),
            'password.required' => __('password required'),
            'password.min' => __('password length must be 6 characters')
        ]);

        if (Auth::guard('web')->attempt(['username' => $request->username, 'password' => $request->password], $request->get('remember'))) {
            return response()->json([
                'msg' => __('login Success Redirecting'),
                'type' => 'danger',
                'status' => 'valid'
            ]);
        }
        return response()->json([
            'msg' => __('Username Or Password Doest Not Matched !!!'),
            'type' => 'danger',
            'status' => 'invalid'
        ]);
    }
    public function job_payment_cancel($id){
        $applicant_details = JobApplicant::find($id);
        $job_details = Jobs::find($applicant_details->jobs_id);
        if (empty($applicant_details)){
            return redirect_404_page();
        }
        return view('frontend.pages.jobs.job-cancel')->with(['applicant_details' => $applicant_details,'job_details' => $job_details]);
    }

    public function job_payment_success($id){
        $extract_id = substr($id,6);
        $extract_id =  substr($extract_id,0,-6);
        $applicant_details = JobApplicant::find($extract_id);
        if (empty($applicant_details)){
            return redirect_404_page();
        }
        $job_details = Jobs::find($applicant_details->jobs_id);
        return view('frontend.pages.jobs.job-success')->with(['applicant_details' => $applicant_details,'job_details' => $job_details]);
    }

}//end class
