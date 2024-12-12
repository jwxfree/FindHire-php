<?php

use App\Http\Controllers\ChatController;
use App\Http\Controllers\ApplicationController;
use App\Http\Controllers\DashboardListingController;
use App\Http\Controllers\ListingController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RegisterController;
use App\Models\Application;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/about', function () {
    return view('about');
});

Route::get('/team', function () {
    return view('team');
});

Route::get('/contact', function () {
    return view('contact');
});

Route::get('/jobs', [ListingController::class, 'index']);
Route::get('/jobs/{listing}', [ListingController::class, 'show']);

Route::get('/login', [LoginController::class, 'index'])->name('login')->middleware('guest');
Route::post('/login', [LoginController::class, 'authenticate']);
Route::post('/logout', [LoginController::class, 'logout']);

Route::get('/profile', [ProfileController::class, 'edit'])->middleware('auth');
Route::put('/profile', [ProfileController::class, 'update']);

Route::get('/register', [RegisterController::class, 'index'])->middleware('guest');
Route::get('/register/seeker', [RegisterController::class, 'seeker'])->middleware('guest');
Route::post('/register/seeker', [RegisterController::class, 'storeSeeker']);

Route::get('/register/company', [RegisterController::class, 'recruiter'])->middleware('guest');
Route::post('/register/company', [RegisterController::class, 'storeRecruiter']);

Route::get('/dashboard', [DashboardListingController::class, 'dashboard'])->middleware('recruiter');

Route::resource('/dashboard/lists', DashboardListingController::class)->middleware('recruiter');

Route::get('/dashboard/applications', [ApplicationController::class, 'index'])->middleware('recruiter');
Route::get('/dashboard/applications/{application}', [ApplicationController::class, 'show'])->middleware('recruiter');
Route::post('/jobs/apply/{listing}', [ApplicationController::class, 'store']);
Route::delete('/dashboard/applications/{application}', [ApplicationController::class, 'destroy']);


Route::middleware(['auth'])->group(function () {
    Route::post('/chat/send', [ChatController::class, 'sendMessage']);
    Route::get('/chat/{applicationId}/messages', [ChatController::class, 'getMessages']);
    Route::patch('/chat/{applicationId}/read', [ChatController::class, 'markMessagesAsRead']);
});

Route::get('/my-chats', [ChatController::class, 'index'])
    ->middleware('auth')
    ->name('chats.index');

Route::get('/applications/{id}/chat', [ChatController::class, 'chat'])->name('applications.chat');
Route::get('/dashboard/messages/create', [ChatController::class, 'create'])->name('messages.create');

Route::patch('/dashboard/applications/{application}/accept', [ApplicationController::class, 'accept'])
    ->name('applications.accept')
    ->middleware('recruiter');


