@extends('dashboard.layouts.main')

@section('main')
    <div class=" d-flex flex-column flex-wrap flex-md-nowrap align-items-start pt-3 mt-2 pb-1 mb-2 border-bottom">
        <h1 class="h2">Details applicant</h1>
        <h4 class="mb-2">Position apply: {{ $app->title }}</h4>
    </div>
    <a class="btn btn-success me-2" href="/dashboard/applications/"> <span data-feather="arrow-left"
            class="mb-1"></span> Back to all
        applications</a>
    <a class="btn btn-outline-info me-2" href="{{ route('applications.chat', $app->id) }}"> 
    <span data-feather="mail" class="mb-1"></span> Message
    </a>
    <form action="{{ route('applications.accept', $app->id) }}" method="POST" class="d-inline">
    @csrf
    @method('PATCH')

    <button class="btn btn-outline-success" onclick="return confirm('Are you sure you want to accept this applicant?');">
        <span data-feather="check-circle" class="mb-1"></span> Accept
    </button>
    </form>

    <form action="/dashboard/applications/{{ $app->id }}" method="POST" class="d-inline">
        @csrf
        @method('delete')

        <button class="btn btn-outline-danger" onclick="return confirm('Are you sure want to reject?');">
            <span data-feather="x-circle" class="mb-1"></span> Reject
        </button>
    </form>
    <div class="row ">
        <x-box class="col-md-8 mt-4">
            <h1 class="text-center ">{{ $app->applicant->name }}</h1>
            
            <h5 class="text-center text-muted mb-3 border-bottom border-2 border-secondary pb-2">
                {{ $app->applicant->email }}</h5>
               
            <div class="row mb-4">
                <div class="col-sm-6">
                    <div class="card border-0">
                        <div class="card-body">
                            <h5 class="card-title border-bottom pb-1">Address</h5>
                            <p class="card-text">{{ $app->applicant->address }}
                            </p>
                        </div>
                    </div>
                </div>
                @if ($app->applicant->file)
                    <div class="col-sm-6">
                        <div class="card border-0">
                            <div class="card-body">
                                <h5 class="card-title border-bottom pb-1">Resume</h5>
                                <div class="border border-dark mb-3 p-2">
                                    <i data-feather="file"></i> <a class="text-decoration-none text-dark" target="_blank"
                                        href="{{ asset('storage/' . $app->applicant->file) }}">Download File</a>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
            </div>
            <h5 class="border-bottom pb-1">About Me</h5>
            {!! $app->applicant->desc !!}
        </x-box>
    </div>
@endsection
