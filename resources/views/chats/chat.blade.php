@extends('layouts.main')

@section('container')
<div class="container">
    <h1>Job Position: {{ $application->title }}</h1>

    <!-- Chat Box -->
    <div id="chat-box" class="chat-box border rounded p-3 mb-3" style="height: 400px; overflow-y: auto;">
        @forelse($messages as $message)
            <div class="mb-2 {{ $message->sender_id == auth()->id() ? 'text-end' : 'text-start' }}">
                <div class="d-inline-block p-2 {{ $message->sender_id == auth()->id() ? 'bg-primary text-white' : 'bg-light text-dark' }} rounded">
                    <p class="mb-0">{{ $message->message }}</p>
                    <small class="text-muted">{{ $message->created_at->format('H:i A') }}</small>
                </div>
            </div>
        @empty
            <p class="text-center text-muted" id="no-messages">No messages yet.</p>
        @endforelse
    </div>

    <!-- Message Form -->
    <form id="message-form" action="{{ url('/chat/send') }}" method="POST" class="d-flex">
        @csrf
        <input type="hidden" name="application_id" value="{{ $application->id }}">
        <textarea name="message" id="message-input" class="form-control me-2" rows="1" placeholder="Type your message..." required></textarea>
        <button type="submit" class="btn btn-primary">Send</button>
    </form>
</div>

<!-- JavaScript -->
<script>
    // JavaScript for handling real-time message updates
    document.getElementById('message-form').addEventListener('submit', function (e) {
        e.preventDefault(); // Prevent form from refreshing the page

        const messageInput = document.getElementById('message-input');
        const message = messageInput.value.trim();

        if (!message) return;

        const formData = new FormData(this);

        // Send the message via AJAX
        fetch(this.action, {
            method: 'POST',
            body: formData,
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}',
            },
        })
            .then(response => response.json())
            .then(data => {
                if (data.message === 'Message sent successfully') {
                    const chatBox = document.getElementById('chat-box');
                    const noMessages = document.getElementById('no-messages');

                    // Remove "No messages yet" if it exists
                    if (noMessages) noMessages.remove();

                    // Format the current time using the user's local timezone
                    const localTime = new Date().toLocaleTimeString([], {
                        hour: '2-digit',
                        minute: '2-digit',
                    });

                    // Append the new message to the chat box
                    const newMessageDiv = document.createElement('div');
                    newMessageDiv.classList.add('mb-2', 'text-end'); // Sender's message is right-aligned
                    newMessageDiv.innerHTML = `
                        <div class="d-inline-block p-2 bg-primary text-white rounded">
                            <p class="mb-0">${message}</p>
                            <small class="text-muted">${localTime}</small>
                        </div>
                    `;
                    chatBox.appendChild(newMessageDiv);

                    // Scroll to the bottom of the chat box
                    chatBox.scrollTop = chatBox.scrollHeight;

                    // Clear the message input
                    messageInput.value = '';
                } else {
                    alert('Failed to send the message. Please try again.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred while sending the message.');
            });
    });

    // Format timestamps for existing messages
    document.querySelectorAll('.chat-time').forEach(element => {
        const serverTimestamp = element.dataset.timestamp;
        const localTime = new Date(serverTimestamp).toLocaleTimeString([], {
            hour: '2-digit',
            minute: '2-digit',
        });
        element.textContent = localTime;
    });
</script>
@endsection
