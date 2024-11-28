<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class aManageBidKomSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [
            [
                'bidkom_id' => 1,
                'nama_bidkom' => 'Pemrograman Web',
                'tag_bidkom' => 'HTML & CSS'
            ],
            [
                'bidkom_id' => 2,
                'nama_bidkom' => 'Pengolahan Data',
                'tag_bidkom' => 'MySQL'
            ],
        ];
        DB::table('m_bidang_kompetensi')->insert($data);
    }
}
