<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ChatMessage extends Model
{
    protected $fillable = [
        'application_id', 
        'sender_id', 
        'message', 
        'is_read'
    ];

    public function application()
    {
        return $this->belongsTo(Application::class);
    }

    public function sender()
    {
        return $this->belongsTo(User::class, 'sender_id');
    }
}
