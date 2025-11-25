<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NewApplicationNotification extends Notification implements ShouldQueue
{
    use Queueable;

    /**
     * Create a new notification instance.
     */
    public function __construct($application)
    {
        $this->application = $application;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['mail', 'database'];
    }

    /**
     * Get the mail representation of the notification.
     */
    public function toMail(object $notifiable): MailMessage
    {
        return (new MailMessage)
        ->subject('Lamaran Baru Diterima')
        ->line('Ada lamaran baru untuk pekerjaan: ' . $this->application->job->title)
        ->line('Pelamar: ' . $this->application->user->name)
        ->action('Lihat Lamaran', url('/applications'));
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            'application_id' => $this->application->id,
            'job_id' => $this->application->job->id,
            'job_title' => $this->application->job->title,
            'applicant_name' => $this->application->user->name,
            'cv_url' => asset('storage/' . ltrim($this->application->cv, '/')),
        ];
    }
}
