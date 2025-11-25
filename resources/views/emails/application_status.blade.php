<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Status Lamaran</title>
    <style>
        body { font-family: Arial, Helvetica, sans-serif; }
    </style>
    </head>
<body>
    <h2>Halo {{ $user->name }},</h2>
    <p>Berikut pembaruan status lamaran Anda untuk posisi <b>{{ $job->title }}</b> di {{ $job->company }}:</p>

    @if($application->status === 'Accepted')
        <p><b>Status: Diterima</b></p>
        <p>Selamat! Lamaran Anda telah diterima. Tim kami akan menghubungi Anda untuk proses selanjutnya.</p>
    @elseif($application->status === 'Rejected')
        <p><b>Status: Ditolak</b></p>
        <p>Terima kasih atas ketertarikan Anda. Saat ini kami belum dapat melanjutkan proses, namun kami akan menyimpan profil Anda untuk kesempatan berikutnya.</p>
    @else
        <p><b>Status: {{ $application->status }}</b></p>
    @endif

    <br>
    <p>Salam,</p>
    <p><b>Tim {{ config('app.name') }}</b></p>
</body>
</html>
