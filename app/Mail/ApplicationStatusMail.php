<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class ApplicationStatusMail extends Mailable implements ShouldQueue
{
    use Queueable, SerializesModels;

    public $application;

    public function __construct($application)
    {
        // Expecting $application with relations user, job loaded
        $this->application = $application;
    }

    public function envelope(): Envelope
    {
        $status = $this->application->status;
        $jobTitle = optional($this->application->job)->title;
        $subject = 'Status Lamaran: ' . $status . ($jobTitle ? ' - ' . $jobTitle : '');
        return new Envelope(subject: $subject);
    }

    public function content(): Content
    {
        return new Content(
            view: 'emails.application_status',
            with: [
                'application' => $this->application,
                'user' => $this->application->user,
                'job' => $this->application->job,
            ],
        );
    }
}
