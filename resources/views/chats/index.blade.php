@extends('layouts.main')

@section('container')
<div class="container">
    <h1>My Chats</h1>
    
    @if($applications->isEmpty())
        <div class="alert alert-info">
            You have no active chats at the moment.
        </div>
    @else
        <div class="list-group">
            @foreach($applications as $application)
                <a href="{{ route('applications.chat', $application->id) }}" class="list-group-item list-group-item-action">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">
                            {{ $application->title }}
                        </h5>
                        @if($application->chatMessages->first())
                            <small>
                                {{ $application->chatMessages->first()->created_at->diffForHumans() }}
                            </small>
                        @endif
                    </div>
                    @if($application->chatMessages->first())
                        <p class="mb-1">
                            {{ Str::limit($application->chatMessages->first()->message, 100) }}
                        </p>
                    @endif
                </a>
            @endforeach
        </div>
    @endif
</div>
@endsection