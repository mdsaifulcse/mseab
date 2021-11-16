@extends('backend.admin-master')
@section('style')
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
    <style>
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 0 !important;
        }

        div.dataTables_wrapper div.dataTables_length select {
            width: 60px;
            display: inline-block;
        }
    </style>
    <link rel="stylesheet" href="{{asset('assets/backend/css/dropzone.css')}}">
    <link rel="stylesheet" href="{{asset('assets/backend/css/media-uploader.css')}}">
@endsection
@section('site-title')
    {{__('User Payment Details')}}
@endsection
@section('content')
@section('content')
    <div class="col-lg-12 col-ml-12 padding-bottom-30">
        <div class="row">
            <div class="col-12 mt-5">
                <div class="card">
                    <div class="card-body">
                        <div class="col-12 mt-5">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">{{__('User Payment Details')}}</h4>
                                    <div class="">
                                        <table id="datatable" class="text-center">
                                            <thead class="text-capitalize">
                                            <tr>
                                                <th>{{__('Serial')}}</th>
                                                <th>{{__('TrxId')}}</th>
                                                <th>{{__('Payment Method')}}</th>
                                                <th>{{__('Payment Date')}}</th>
                                                <th>{{__('Amount')}}</th>
                                                <th>{{__('Status')}}</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($user_payments as $key => $payment)
                                                <tr>
                                                    <td>{{ ++$key }}</td>
                                                    <td>{{ $payment->transaction_id}}</td>
                                                    <td>{{ $payment->payment_gateway}}</td>
                                                    <td>{{date('d-M-Y',strtotime($payment->payment_date))}}</td>
                                                    <td style="text-align: right">{{ number_format($payment->fee_amount,2) }}</td>
                                                    <td>{{$payment->status}}
                                                        @if($payment->status==\App\FeeCollection::COMPLETE) <i class="fas fa-check-circle text-success"></i>@else
                                                            <i class="fas fa-waning text-success"></i>
                                                        @endif
                                                    </td>
                                                </tr>
                                            @endforeach
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th colspan="4" style="text-align: center"><h4>Total Amount: <span class="text-success">{{ number_format($user_payments->sum('fee_amount'),2) }}</span></h4></th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <!-- Start datatable js -->
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#datatable').DataTable();
        });
    </script>

@endsection