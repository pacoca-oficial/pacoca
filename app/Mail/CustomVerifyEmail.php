<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Auth\Notifications\VerifyEmail as VerifyEmailNotification;
use Illuminate\Notifications\Messages\MailMessage;

class CustomVerifyEmail extends Mailable
{
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Verificação de Email')
            ->line('Você está recebendo este e-mail porque uma verificação de email foi solicitada para sua conta.')
            ->action('Verificar Email', $this->verificationUrl($notifiable))
            ->line('Se você não solicitou esta verificação, você pode ignorar este email.');
    }
}
