<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Application extends Model
{
    protected $fillable = [
        'applicant_id', 
        'title', 
        'receiver_id',
        'status'
    ];

    public function chatMessages()
    {
        return $this->hasMany(ChatMessage::class);
    }

    public function applicant()
    {
        return $this->belongsTo(User::class, 'applicant_id');
    }

    public function receiver()
    {
        return $this->belongsTo(User::class, 'receiver_id');
    }
    
}
