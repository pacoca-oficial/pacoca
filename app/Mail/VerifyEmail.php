<?php
namespace Illuminate\Auth\Notifications;

use Illuminate\Notifications\Messages\MailMessage;

class VerifyEmail extends Notification
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
