<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=\, initial-scale=1.0">
    <title>Forgot Password  Email</title>
</head>
<body>
    <h1>Hello {{ $mailData['user']->name }}</h1>

    <p>Click below to change your password.</p>

    <a href="{{ route("account.resetPassword",$mailData['token']) }}">Reset Password</a>

</body>
</html>