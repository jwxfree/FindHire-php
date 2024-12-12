@extends('dashboard.layouts.main')

@section('main')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 >Welcome back, {{ auth()->user()->name }} </h1>
    </div>

    <h2>
        Total Applicants: 
        <span class="badge bg-success">
            {{ $applicantCount }}
        </span>
    </h2>

    <a href="/jobs" class="btn btn-success">Exit dashboard</a>
@endsection
