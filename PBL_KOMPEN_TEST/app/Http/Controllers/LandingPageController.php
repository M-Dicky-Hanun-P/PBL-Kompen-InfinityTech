<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class LandingPageController extends Controller
{
    public function index()
    {
        return view('landing.index'); // Sesuaikan dengan lokasi file blade Anda
    }
}
