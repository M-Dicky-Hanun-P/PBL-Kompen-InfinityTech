<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIKOMTI - Politeknik Negeri Malang</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #0d47a1;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            min-height: 100vh;
        }

        .container {
            max-width: 800px;
            margin: auto;
            text-align: center;
            background-color: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        .logo-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .logo-container img {
            max-width: 80px;
            height: auto;
        }

        .title {
            font-size: 1.8rem;
            color: #0d47a1;
            margin: 1rem 0;
        }

        .login-options {
            margin-top: 2rem;
        }

        .btn {
            display: inline-block;
            background-color: #d32f2f;
            color: white;
            border: none;
            padding: 0.8rem 1.5rem;
            margin: 0.5rem;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: bold;
            text-transform: uppercase;
            text-decoration: none;
        }

        .btn:hover {
            opacity: 0.9;
            transition: 0.3s ease;
        }

        .btn.admin {
            background-color: #d32f2f;
        }

        .btn.dosen {
            background-color: #f57c00;
        }

        .btn.mahasiswa {
            background-color: #ffca28;
            color: #000;
        }

        footer {
            text-align: center;
            padding: 1rem;
            color: white;
            font-size: 0.9rem;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="logo-container">
            <img src="{{ asset('images/logo_polinema.png') }}" alt="Logo Polinema">
            <img src="{{ asset('images/logo_ti.png') }}" alt="Logo TI">
        </div>
        <h1 class="title">SIKOMTI</h1>
        <p>Sistem Kompensasi Teknologi Informasi</p>
        <p>POLITEKNIK NEGERI MALANG</p>
        <p>Login Sebagai</p>
        <div class="login-options">
            <a href="{{ url('/Admin') }}" class="btn admin">Admin</a>
            <a href="{{ url('/DosenTeknisi') }}" class="btn dosen">Dosen/Tendik</a>
            <a href="{{ url('/Mahasiswa') }}" class="btn mahasiswa">Mahasiswa</a>
        </div>
    </div>
    <footer>
        ©2024 Sistem Kompetensi Jurusan
    </footer>
</body>

</html>
