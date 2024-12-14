<?php

return [

    'defaults' => [
        'guard' => 'web',
        'passwords' => 'users',
    ],

    'guards' => [
        'web' => [
            'driver' => 'session',
            'provider' => 'users', // Menggunakan model User
        ],
        'admin' => [
            'driver' => 'session',
            'provider' => 'admins',
        ],
        'mahasiswa' => [
            'driver' => 'session',
            'provider' => 'mahasiswa',
        ],
        'dosen' => [
            'driver' => 'session',
            'provider' => 'dosen',
        ],
        'tendik' => [
            'driver' => 'session',
            'provider' => 'tendik',
        ],
    ],

    'providers' => [
    'admins' => [
        'driver' => 'eloquent',
        'model' => App\Models\AdminModel::class,
        'table' => 'm_admin', // Tabel yang sesuai
    ],
    'mahasiswa' => [
        'driver' => 'eloquent',
        'model' => App\Models\MahasiswaModel::class,
        'table' => 'm_mahasiswa',
    ],
    'dosen' => [
        'driver' => 'eloquent',
        'model' => App\Models\DosenModel::class,
        'table' => 'm_dosen',
    ],
    'tendik' => [
        'driver' => 'eloquent',
        'model' => App\Models\TendikModel::class,
        'table' => 'm_tendik',
    ],
],


    'password_timeout' => 10800,
];
