<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Application;

class ApplicationPolicy
{
    public function sendMessage(User $user, Application $application)
    {
        // User can send a message if they are either the applicant or the receiver
        return $user->id === $application->applicant_id || 
               $user->id === $application->receiver_id;
    }

    public function viewMessages(User $user, Application $application)
    {
        // User can view messages if they are either the applicant or the receiver
        return $user->id === $application->applicant_id || 
               $user->id === $application->receiver_id;
    }
}