<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SIKOMTI - Login Mahasiswa</title>
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Source Sans Pro', sans-serif;
            background-color: #f4f6f9;
        }

        /* Header dengan setengah lingkaran biru */
        .header-background {
            background-color: #001c41;
            width: 100%;
            height: 300px;
            border-bottom-left-radius: 150px;
            border-bottom-right-radius: 150px;
            position: relative;
            text-align: center;
            color: #fff;
            padding-top: 50px;
        }

        .header-background h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }

        .header-background h2 {
            font-size: 1.2rem;
            font-weight: normal;
        }

        /* Kontainer form login */
        .login-container {
            margin-top: -80px;
            max-width: 400px;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-left: auto;
            margin-right: auto;
        }

        .login-container h3 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.5rem;
            color: #001c41;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn-login {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
        }

        .btn-login:hover {
            background-color: #218838;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
            color: #001c41;
            font-size: 0.9rem;
        }

        .footer a {
            color: #007bff;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <!-- Header -->
    <div class="header-background">
        <h1>SIKOMTI</h1>
        <h2>Sistem Kompensasi Teknologi Informasi</h2>
    </div>

    <!-- Form Login -->
    <div class="login-container">
        <h3>Login Mahasiswa</h3>
        <form action="/login/mahasiswa" method="POST">
            @csrf <!-- Tambahkan token CSRF -->
            <input type="text" name="username" class="form-control" placeholder="Username" required>
            <input type="password" name="password" class="form-control" placeholder="Password" required>
            <div style="margin-bottom: 10px;">
                <input type="checkbox" id="show-password" onclick="togglePassword()"> Tampilkan Password
            </div>
            <button type="submit" class="btn-login">Login</button>
        </form>
        <div class="footer">
            <p><a href="/register">Registrasi Mahasiswa?</a></p>
            <p>2024 &copy; Sistem Kompensasi Jurusan</p>
        </div>
    </div>

    <script>
        function togglePassword() {
            var passwordField = document.querySelector('input[name="password"]');
            passwordField.type = passwordField.type === 'password' ? 'text' : 'password';
        }
    </script>
</body>

</html>
