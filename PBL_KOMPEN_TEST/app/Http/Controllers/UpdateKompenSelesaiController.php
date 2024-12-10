<?php

namespace App\Http\Controllers;

use App\Models\TugasKompenModel;
use Illuminate\Http\Request;

class UpdateKompenSelesaiController extends Controller
{
    public function index()
    {
        // Breadcrumb and page metadata
        $breadcrumb = (object) [
            'title' => 'Update Kompen Selesai',
            'list' => ['Home', 'Update Kompen Selesai']
        ];

        $page = (object) [
            'title' => 'Update Kompen Selesai'
        ];

        $activeMenu = 'mUpdateKompenSelesai'; 

        return view('mUpdateKompenSelesai.index', compact('breadcrumb', 'page', 'activeMenu'));
    }
}

