
<style>
    .list-group-item{
        margin:0 8px;
        margin-bottom: 15px;
        border-color: red;
    }
    .list-group-item p{
        font-size: 28px;
    }
    .pull-right{
        float: right;
    }
    .badge{
        font-size: 25px;
    }

</style>

<ul class="list-group">
    @forelse($notifications as $key=>$notification)
        <li class="list-group-item list-group-item-success0">

            <div class="">
                <div class="badge pull-right"><i class="fa fa-clock"></i> {{date('d-M-Y h:i A',strtotime($notification->created_at))}} </div>

                <h1 class="list-group-item-heading">{{$notification->title}}</h1>
                <p class="list-group-item-text">{{$notification->description}}</p>
            </div>

        </li>
    @empty

        <li class="list-group-item text-center">{{$else}}</li>

    @endforelse
</ul>