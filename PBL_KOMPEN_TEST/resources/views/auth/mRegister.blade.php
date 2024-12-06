<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register Pengguna</title>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{ asset('adminlte/plugins/fontawesome-free/css/all.min.css') }}">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="{{ asset('adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="{{ asset('adminlte/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css') }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('adminlte/dist/css/adminlte.min.css') }}">

    <style>
        /* Custom CSS for Register Page */
        body {
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
            position: relative;
        }

        body::before {
            content: '';
            position: absolute;
            top: -100px;
            left: 50%;
            transform: translateX(-50%);
            width: 200%;
            height: 500px;
            background-color: #001c41;
            border-bottom-left-radius: 50%;
            border-bottom-right-radius: 50%;
            z-index: -1;
        }

        .login-page {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-box {
            width: 400px;
            margin: 0 auto;
        }

        .card {
            border-radius: 8px;
        }

        .card-header {
            text-align: center;
            background-color: #062c61;
            color: white;
            padding: 20px 0;
        }

        .card-header h1 {
            font-size: 1.2rem;
            margin-top: 10px;
            font-weight: bold;
        }

        .login-box-msg {
            text-align: center;
            font-weight: bold;
        }

        .login-box .btn-primary {
            background-color: #800000;
            border-color: #800000;
        }

        .login-box .btn-primary:hover {
            background-color: #660000;
        }

        .form-control {
            height: calc(2.25rem + 2px);
            padding: 0.5rem 0.75rem;
        }

        .footer-text {
            text-align: center;
            color: #ffffff;
            background-color: #001c41;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .footer-text a {
            color: #ffffff;
        }
    </style>
</head>

<body class="hold-transition login-page">
    <div class="login-box">
        <div class="card card-outline">
            <div class="card-header">
                <h1>Registrasi Pengguna</h1>
            </div>

            <div class="card-body">
                <p class="login-box-msg">Sign up to create your account</p>
                <form id="form-tambah">
                    @csrf
                    <div class="form-group">
                        <label>Level</label>
                        <select class="form-control" id="level_id" name="level_id" required>
                            <option value="">- Pilih Level -</option>
                            @foreach($level as $item)
                                <option value="{{ $item->level_id }}">{{ $item->level_nama }}</option>
                            @endforeach
                        </select>
                        <small id="error-level_id" class="error-text form-text text-danger"></small>
                    </div>
                    <div class="form-group">
                        <label>Username</label>
                        <input type="text" class="form-control" id="username" name="username" value="{{ old('username') }}" required>
                        <small id="error-username" class="error-text form-text text-danger"></small>
                    </div>
                    <div class="form-group">
                        <label>Nama</label>
                        <input type="text" class="form-control" id="nama" name="nama" value="{{ old('nama') }}" required>
                        <small id="error-nama" class="error-text form-text text-danger"></small>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                        <small id="error-password" class="error-text form-text text-danger"></small>
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="icheck-primary">
                                <a class="btn btn-sm btn-default ml-1" href="{{ url('/') }}">Kembali</a>
                            </div>
                        </div>
                        <div class="col-4">
                            <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="footer-text">
        <p>&copy; 2024 Sistem Toko Barokah</p>
    </div>

    <!-- jQuery -->
    <script src="{{ asset('adminlte/plugins/jquery/jquery.min.js') }}"></script>
    <!-- Bootstrap 4 -->
    <script src="{{ asset('adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <!-- SweetAlert2 -->
    <script src="{{ asset('adminlte/plugins/sweetalert2/sweetalert2.min.js') }}"></script>
    <!-- AdminLTE App -->
    <script src="{{ asset('adminlte/dist/js/adminlte.min.js') }}"></script>

    <script>
        $(document).ready(function() {
            $('#form-tambah').on('submit', function(e) {
                e.preventDefault(); // Mencegah pengiriman form secara default

                $.ajax({
                    url: "{{ url('register') }}",
                    method: 'POST',
                    data: $(this).serialize(),
                    success: function(response) {
                        if (response.status) {
                            Swal.fire({
                                title: 'Sukses!',
                                text: response.message,
                                icon: 'success',
                                confirmButtonText: 'OK'
                            }).then(() => {
                                window.location.href = response.redirect; // Pengalihan ke halaman login
                            });
                        }
                    },
                    error: function(xhr) {
                        // Menampilkan pesan kesalahan
                        $.each(xhr.responseJSON.msgField, function(key, value) {
                            $('#error-' + key).text(value[0]);
                        });
                    }
                });
            });
        });
    </script>
</body>

</html>