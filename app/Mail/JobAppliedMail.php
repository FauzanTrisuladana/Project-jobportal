<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class JobAppliedMail extends Mailable
{
	use Queueable, SerializesModels;

	// Rename from $job to avoid collision with Mailable internal queued job property
	public $jobVacancy;
	public $user;
	public string $cvPath;

	public function __construct($jobVacancy, $user, string $cvPath)
	{
		$this->jobVacancy = $jobVacancy;
		$this->user = $user;
		$this->cvPath = $cvPath;
	}

	public function envelope(): Envelope
	{
		return new Envelope(
			subject: 'Lamaran Baru untuk ' . ($this->jobVacancy->title ?? 'Pekerjaan'),
		);
	}

	public function content(): Content
	{
		return new Content(
			view: 'emails.job_applied',
			with: [
				'job' => $this->jobVacancy, // keep variable name 'job' for the blade template
				'user' => $this->user,
				'cvUrl' => asset('storage/' . ltrim($this->cvPath, '/')),
			],
		);
	}
}
