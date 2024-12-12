<?php

namespace App\Http\Controllers;

use App\Models\Application;
use App\Models\ChatMessage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ChatController extends Controller
{
    public function sendMessage(Request $request)
    {
        $validatedData = $request->validate([
            'application_id' => 'required|exists:applications,id',
            'message' => 'required|string|max:1000'
        ]);

        $application = Application::findOrFail($validatedData['application_id']);

        // Ensure the current user is either the applicant or the receiver
        $this->authorize('sendMessage', $application);

        $message = ChatMessage::create([
            'application_id' => $validatedData['application_id'],
            'sender_id' => Auth::id(),
            'message' => $validatedData['message'],
            'is_read' => false
        ]);

        return response()->json([
            'message' => 'Message sent successfully',
            'data' => $message
        ]);
    }

    public function getMessages($applicationId)
    {
        $application = Application::findOrFail($applicationId);

        // Ensure the current user has permission to view these messages
        $this->authorize('viewMessages', $application);

        $messages = ChatMessage::where('application_id', $applicationId)
            ->with('sender')
            ->orderBy('created_at', 'asc')
            ->get();

        return response()->json($messages);
    }

    public function markMessagesAsRead($applicationId)
    {
        $application = Application::findOrFail($applicationId);

        // Ensure the current user has permission
        $this->authorize('viewMessages', $application);

        ChatMessage::where('application_id', $applicationId)
            ->where('is_read', false)
            ->where('sender_id', '!=', Auth::id())
            ->update(['is_read' => true]);

        return response()->json(['status' => 'Messages marked as read']);
    }

    public function index()
{
    // Fetch applications where the user is either the applicant or the receiver
    $applications = Application::where('applicant_id', auth()->id())
        ->orWhere('receiver_id', auth()->id())
        ->with(['chatMessages' => function($query) {
            $query->latest()->first(); // Get the latest message
        }])
        ->get();

    return view('chats.index', compact('applications'));
}

public function chat($id)
{
    // Retrieve the application by ID
    $application = Application::with('chatMessages')->findOrFail($id);

    // Pass the application and its messages to the view
    return view('chats.chat', [
        'application' => $application,
        'messages' => $application->chatMessages,
    ]);
}
public function create(Request $request)
{
    $application = Application::findOrFail($request->input('applicant'));
    return view('messages.create', compact('applicant'));
}

}