-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 28, 2024 at 12:14 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pbl_kompen2`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_11_20_131421_m_level', 1),
(2, '2024_11_20_131516_m_user', 2),
(3, '2024_11_20_131527_m_mahasiswa', 3),
(4, '2024_11_20_131537_m_dosen', 4),
(5, '2024_11_20_131545_m_admin', 5),
(6, '2024_11_20_131601_m_tendik', 6),
(7, '2024_11_20_132335_m_periode_akademik', 7),
(8, '2024_11_20_131959_m_alpha', 8),
(9, '2024_11_20_132112_m_bidang_kompetensi', 9),
(10, '2024_11_20_152932_t_detail_bidkom', 10),
(11, '2024_11_20_132304_m_jenis_kompen', 11),
(12, '2024_11_20_132224_t_detail_jenis_kompen', 12),
(13, '2024_11_20_132157_m_tugas_kompeten', 13),
(14, '2024_11_20_131854_m_tugas_mahasiswa', 14),
(15, '2024_11_20_131920_m_tugas_dosen', 15),
(16, '2024_11_20_131931_m_tugas_admin', 16),
(17, '2024_11_20_131944_m_tugas_tendik', 17),
(18, '2024_11_20_144933_t_progres_tugas', 18),
(19, '2024_11_20_145030_t_surat_berita_acara', 19),
(20, '2024_11_20_145058_m_upload', 20),
(21, '2024_11_20_132403_t_riwayat_kompen', 21),
(22, '2014_10_12_000000_create_users_table', 22),
(23, '2014_10_12_100000_create_password_reset_tokens_table', 22),
(24, '2019_08_19_000000_create_failed_jobs_table', 22),
(25, '2019_12_14_000001_create_personal_access_tokens_table', 22);

-- --------------------------------------------------------

--
-- Table structure for table `m_admin`
--

CREATE TABLE `m_admin` (
  `admin_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_alpha`
--

CREATE TABLE `m_alpha` (
  `alpha_id` bigint UNSIGNED NOT NULL,
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `periode_id` bigint UNSIGNED NOT NULL,
  `jumlah_alpha` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_bidang_kompetensi`
--

CREATE TABLE `m_bidang_kompetensi` (
  `bidkom_id` bigint UNSIGNED NOT NULL,
  `nama_bidkom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_bidkom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_bidang_kompetensi`
--

INSERT INTO `m_bidang_kompetensi` (`bidkom_id`, `nama_bidkom`, `tag_bidkom`, `created_at`, `updated_at`) VALUES
(1, 'Pemrograman Web', 'HTML & CSS', NULL, NULL),
(2, 'Pengolahan Data', 'MySQL', NULL, NULL),
(3, 'Kecerdasan Buatan', 'Machine Learning', '2024-11-27 17:05:21', '2024-11-27 17:05:21');

-- --------------------------------------------------------

--
-- Table structure for table `m_dosen`
--

CREATE TABLE `m_dosen` (
  `dosen_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_jenis_kompen`
--

CREATE TABLE `m_jenis_kompen` (
  `jenis_kompen_id` bigint UNSIGNED NOT NULL,
  `jenis_kompen` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_level`
--

CREATE TABLE `m_level` (
  `level_id` bigint UNSIGNED NOT NULL,
  `level_kode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_level`
--

INSERT INTO `m_level` (`level_id`, `level_kode`, `level_nama`, `created_at`, `updated_at`) VALUES
(1, 'ADM', 'Administrator', NULL, NULL),
(2, 'DSN', 'Dosen', NULL, NULL),
(3, 'TDK', 'Tendik', NULL, NULL),
(4, 'MHS', 'Mahasiswa', NULL, '2024-11-27 09:20:38'),
(5, 'TKN', 'Teknisi', '2024-11-25 01:10:42', '2024-11-25 01:10:42'),
(6, 'RKT', 'Rektor', '2024-11-25 01:31:13', '2024-11-27 08:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `m_mahasiswa`
--

CREATE TABLE `m_mahasiswa` (
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nim` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun_masuk` int NOT NULL,
  `no_telpon` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_periode_akademik`
--

CREATE TABLE `m_periode_akademik` (
  `periode_id` bigint UNSIGNED NOT NULL,
  `semester` enum('ganjil','genap') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun_ajaran` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_tendik`
--

CREATE TABLE `m_tendik` (
  `tendik_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_tugas_admin`
--

CREATE TABLE `m_tugas_admin` (
  `tugas_admin_id` bigint UNSIGNED NOT NULL,
  `admin_id` bigint UNSIGNED NOT NULL,
  `tugas_kompeten_id` bigint UNSIGNED NOT NULL,
  `deskripsi_tugas` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_tugas` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_tugas_dosen`
--

CREATE TABLE `m_tugas_dosen` (
  `tugas_dosen_id` bigint UNSIGNED NOT NULL,
  `dosen_id` bigint UNSIGNED NOT NULL,
  `tugas_kompeten_id` bigint UNSIGNED NOT NULL,
  `deskripsi_tugas` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_tugas` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_tugas_kompeten`
--

CREATE TABLE `m_tugas_kompeten` (
  `tugas_kompeten_id` bigint UNSIGNED NOT NULL,
  `nama_tugas` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('dibuka','ditutup') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_mulai` datetime NOT NULL,
  `tanggal_selesai` datetime NOT NULL,
  `jam_kompen` int NOT NULL,
  `pemberi_tugas` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_tugas_mahasiswa`
--

CREATE TABLE `m_tugas_mahasiswa` (
  `tugas_mahasiswa_id` bigint UNSIGNED NOT NULL,
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `tugas_kompeten_id` bigint UNSIGNED NOT NULL,
  `deskripsi_tugas` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_tugas` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_tugas_tendik`
--

CREATE TABLE `m_tugas_tendik` (
  `tugas_dosen_id` bigint UNSIGNED NOT NULL,
  `tendik_id` bigint UNSIGNED NOT NULL,
  `tugas_kompeten_id` bigint UNSIGNED NOT NULL,
  `deskripsi_tugas` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_tugas` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_upload`
--

CREATE TABLE `m_upload` (
  `upload_id` bigint UNSIGNED NOT NULL,
  `surat_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_user`
--

CREATE TABLE `m_user` (
  `user_id` bigint UNSIGNED NOT NULL,
  `level_id` bigint UNSIGNED NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_user`
--

INSERT INTO `m_user` (`user_id`, `level_id`, `username`, `nama`, `password`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'Administrator', '$2y$12$p5dBSiXrcZ9mgA7JYv5WOuZm4wkTvprXPReimEBcLtf.k0bSj7OOS', '', NULL, NULL),
(2, 2, 'dosen', 'Dosen', '$2y$12$ccMwxIvh50d6ZjPQf1gOK.G3fIy.yE1vvBogCF.88qcTclKcpwdbi', '', NULL, NULL),
(3, 3, 'tendik', 'Tendik', '$2y$12$Ljq1mdlBJs5E5FdjqnQbluYEZGbvg5qfTaHVBn0UtrqTKkcVaPF72', '', NULL, NULL),
(4, 4, 'mahasiswa', 'Mahasiswa', '$2y$12$6xMJLHV7uEqtSMvrSPat/.Lwx/vlTKN71bTip4qufl57m/XqJvBBu', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_detail_bidkom`
--

CREATE TABLE `t_detail_bidkom` (
  `detail_bidkom_id` bigint UNSIGNED NOT NULL,
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `bidkom_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_detail_jenis_kompen`
--

CREATE TABLE `t_detail_jenis_kompen` (
  `detail_jenis_kompen_id` bigint UNSIGNED NOT NULL,
  `bidkom_id` bigint UNSIGNED NOT NULL,
  `jenis_kompen_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_progres_tugas`
--

CREATE TABLE `t_progres_tugas` (
  `progres_tugas_id` bigint UNSIGNED NOT NULL,
  `tugas_mahasiswa_id` bigint UNSIGNED NOT NULL,
  `nim` bigint UNSIGNED NOT NULL,
  `status_progres` enum('selesai','progres') COLLATE utf8mb4_unicode_ci NOT NULL,
  `progres` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_riwayat_kompen`
--

CREATE TABLE `t_riwayat_kompen` (
  `riwayat_id` bigint UNSIGNED NOT NULL,
  `tugas_kompeten_id` bigint UNSIGNED NOT NULL,
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `tanggal_mulai` datetime NOT NULL,
  `tanggal_selesai` datetime NOT NULL,
  `status_riwayat` enum('selesai','tidak_selesai') COLLATE utf8mb4_unicode_ci NOT NULL,
  `upload_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_surat_berita_acara`
--

CREATE TABLE `t_surat_berita_acara` (
  `surat_id` bigint UNSIGNED NOT NULL,
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `progres_tugas_id` bigint UNSIGNED NOT NULL,
  `tugas_kompeten_id` bigint UNSIGNED NOT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','dosen','tendik','mahasiswa') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('verify','active','banned') COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_admin`
--
ALTER TABLE `m_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `m_admin_user_id_index` (`user_id`);

--
-- Indexes for table `m_alpha`
--
ALTER TABLE `m_alpha`
  ADD PRIMARY KEY (`alpha_id`),
  ADD KEY `m_alpha_mahasiswa_id_index` (`mahasiswa_id`),
  ADD KEY `m_alpha_periode_id_index` (`periode_id`);

--
-- Indexes for table `m_bidang_kompetensi`
--
ALTER TABLE `m_bidang_kompetensi`
  ADD PRIMARY KEY (`bidkom_id`);

--
-- Indexes for table `m_dosen`
--
ALTER TABLE `m_dosen`
  ADD PRIMARY KEY (`dosen_id`),
  ADD KEY `m_dosen_user_id_index` (`user_id`);

--
-- Indexes for table `m_jenis_kompen`
--
ALTER TABLE `m_jenis_kompen`
  ADD PRIMARY KEY (`jenis_kompen_id`);

--
-- Indexes for table `m_level`
--
ALTER TABLE `m_level`
  ADD PRIMARY KEY (`level_id`),
  ADD UNIQUE KEY `m_level_level_kode_unique` (`level_kode`);

--
-- Indexes for table `m_mahasiswa`
--
ALTER TABLE `m_mahasiswa`
  ADD PRIMARY KEY (`mahasiswa_id`),
  ADD KEY `m_mahasiswa_user_id_index` (`user_id`);

--
-- Indexes for table `m_periode_akademik`
--
ALTER TABLE `m_periode_akademik`
  ADD PRIMARY KEY (`periode_id`);

--
-- Indexes for table `m_tendik`
--
ALTER TABLE `m_tendik`
  ADD PRIMARY KEY (`tendik_id`),
  ADD KEY `m_tendik_user_id_index` (`user_id`);

--
-- Indexes for table `m_tugas_admin`
--
ALTER TABLE `m_tugas_admin`
  ADD PRIMARY KEY (`tugas_admin_id`),
  ADD KEY `m_tugas_admin_admin_id_index` (`admin_id`),
  ADD KEY `m_tugas_admin_tugas_kompeten_id_index` (`tugas_kompeten_id`);

--
-- Indexes for table `m_tugas_dosen`
--
ALTER TABLE `m_tugas_dosen`
  ADD PRIMARY KEY (`tugas_dosen_id`),
  ADD KEY `m_tugas_dosen_dosen_id_index` (`dosen_id`),
  ADD KEY `m_tugas_dosen_tugas_kompeten_id_index` (`tugas_kompeten_id`);

--
-- Indexes for table `m_tugas_kompeten`
--
ALTER TABLE `m_tugas_kompeten`
  ADD PRIMARY KEY (`tugas_kompeten_id`);

--
-- Indexes for table `m_tugas_mahasiswa`
--
ALTER TABLE `m_tugas_mahasiswa`
  ADD PRIMARY KEY (`tugas_mahasiswa_id`),
  ADD KEY `m_tugas_mahasiswa_mahasiswa_id_index` (`mahasiswa_id`),
  ADD KEY `m_tugas_mahasiswa_tugas_kompeten_id_index` (`tugas_kompeten_id`);

--
-- Indexes for table `m_tugas_tendik`
--
ALTER TABLE `m_tugas_tendik`
  ADD PRIMARY KEY (`tugas_dosen_id`),
  ADD KEY `m_tugas_tendik_tendik_id_index` (`tendik_id`),
  ADD KEY `m_tugas_tendik_tugas_kompeten_id_index` (`tugas_kompeten_id`);

--
-- Indexes for table `m_upload`
--
ALTER TABLE `m_upload`
  ADD PRIMARY KEY (`upload_id`),
  ADD KEY `m_upload_surat_id_index` (`surat_id`);

--
-- Indexes for table `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `m_user_level_id_index` (`level_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `t_detail_bidkom`
--
ALTER TABLE `t_detail_bidkom`
  ADD PRIMARY KEY (`detail_bidkom_id`),
  ADD KEY `t_detail_bidkom_mahasiswa_id_index` (`mahasiswa_id`),
  ADD KEY `t_detail_bidkom_bidkom_id_index` (`bidkom_id`);

--
-- Indexes for table `t_detail_jenis_kompen`
--
ALTER TABLE `t_detail_jenis_kompen`
  ADD PRIMARY KEY (`detail_jenis_kompen_id`),
  ADD KEY `t_detail_jenis_kompen_bidkom_id_index` (`bidkom_id`),
  ADD KEY `t_detail_jenis_kompen_jenis_kompen_id_index` (`jenis_kompen_id`);

--
-- Indexes for table `t_progres_tugas`
--
ALTER TABLE `t_progres_tugas`
  ADD PRIMARY KEY (`progres_tugas_id`),
  ADD KEY `t_progres_tugas_tugas_mahasiswa_id_index` (`tugas_mahasiswa_id`),
  ADD KEY `t_progres_tugas_nim_index` (`nim`);

--
-- Indexes for table `t_riwayat_kompen`
--
ALTER TABLE `t_riwayat_kompen`
  ADD PRIMARY KEY (`riwayat_id`),
  ADD KEY `t_riwayat_kompen_tugas_kompeten_id_index` (`tugas_kompeten_id`),
  ADD KEY `t_riwayat_kompen_mahasiswa_id_index` (`mahasiswa_id`),
  ADD KEY `t_riwayat_kompen_upload_id_index` (`upload_id`);

--
-- Indexes for table `t_surat_berita_acara`
--
ALTER TABLE `t_surat_berita_acara`
  ADD PRIMARY KEY (`surat_id`),
  ADD KEY `t_surat_berita_acara_mahasiswa_id_index` (`mahasiswa_id`),
  ADD KEY `t_surat_berita_acara_progres_tugas_id_index` (`progres_tugas_id`),
  ADD KEY `t_surat_berita_acara_tugas_kompeten_id_index` (`tugas_kompeten_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `m_admin`
--
ALTER TABLE `m_admin`
  MODIFY `admin_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_alpha`
--
ALTER TABLE `m_alpha`
  MODIFY `alpha_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_bidang_kompetensi`
--
ALTER TABLE `m_bidang_kompetensi`
  MODIFY `bidkom_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `m_dosen`
--
ALTER TABLE `m_dosen`
  MODIFY `dosen_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_jenis_kompen`
--
ALTER TABLE `m_jenis_kompen`
  MODIFY `jenis_kompen_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_level`
--
ALTER TABLE `m_level`
  MODIFY `level_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `m_mahasiswa`
--
ALTER TABLE `m_mahasiswa`
  MODIFY `mahasiswa_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_periode_akademik`
--
ALTER TABLE `m_periode_akademik`
  MODIFY `periode_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_tendik`
--
ALTER TABLE `m_tendik`
  MODIFY `tendik_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_tugas_admin`
--
ALTER TABLE `m_tugas_admin`
  MODIFY `tugas_admin_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_tugas_dosen`
--
ALTER TABLE `m_tugas_dosen`
  MODIFY `tugas_dosen_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_tugas_kompeten`
--
ALTER TABLE `m_tugas_kompeten`
  MODIFY `tugas_kompeten_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_tugas_mahasiswa`
--
ALTER TABLE `m_tugas_mahasiswa`
  MODIFY `tugas_mahasiswa_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_tugas_tendik`
--
ALTER TABLE `m_tugas_tendik`
  MODIFY `tugas_dosen_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_upload`
--
ALTER TABLE `m_upload`
  MODIFY `upload_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_user`
--
ALTER TABLE `m_user`
  MODIFY `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_detail_bidkom`
--
ALTER TABLE `t_detail_bidkom`
  MODIFY `detail_bidkom_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_detail_jenis_kompen`
--
ALTER TABLE `t_detail_jenis_kompen`
  MODIFY `detail_jenis_kompen_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_progres_tugas`
--
ALTER TABLE `t_progres_tugas`
  MODIFY `progres_tugas_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_riwayat_kompen`
--
ALTER TABLE `t_riwayat_kompen`
  MODIFY `riwayat_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_surat_berita_acara`
--
ALTER TABLE `t_surat_berita_acara`
  MODIFY `surat_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `m_admin`
--
ALTER TABLE `m_admin`
  ADD CONSTRAINT `m_admin_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);

--
-- Constraints for table `m_alpha`
--
ALTER TABLE `m_alpha`
  ADD CONSTRAINT `m_alpha_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `m_mahasiswa` (`mahasiswa_id`),
  ADD CONSTRAINT `m_alpha_periode_id_foreign` FOREIGN KEY (`periode_id`) REFERENCES `m_periode_akademik` (`periode_id`);

--
-- Constraints for table `m_dosen`
--
ALTER TABLE `m_dosen`
  ADD CONSTRAINT `m_dosen_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);

--
-- Constraints for table `m_mahasiswa`
--
ALTER TABLE `m_mahasiswa`
  ADD CONSTRAINT `m_mahasiswa_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);

--
-- Constraints for table `m_tendik`
--
ALTER TABLE `m_tendik`
  ADD CONSTRAINT `m_tendik_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);

--
-- Constraints for table `m_tugas_admin`
--
ALTER TABLE `m_tugas_admin`
  ADD CONSTRAINT `m_tugas_admin_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `m_admin` (`admin_id`),
  ADD CONSTRAINT `m_tugas_admin_tugas_kompeten_id_foreign` FOREIGN KEY (`tugas_kompeten_id`) REFERENCES `m_tugas_kompeten` (`tugas_kompeten_id`);

--
-- Constraints for table `m_tugas_dosen`
--
ALTER TABLE `m_tugas_dosen`
  ADD CONSTRAINT `m_tugas_dosen_dosen_id_foreign` FOREIGN KEY (`dosen_id`) REFERENCES `m_dosen` (`dosen_id`),
  ADD CONSTRAINT `m_tugas_dosen_tugas_kompeten_id_foreign` FOREIGN KEY (`tugas_kompeten_id`) REFERENCES `m_tugas_kompeten` (`tugas_kompeten_id`);

--
-- Constraints for table `m_tugas_mahasiswa`
--
ALTER TABLE `m_tugas_mahasiswa`
  ADD CONSTRAINT `m_tugas_mahasiswa_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `m_mahasiswa` (`mahasiswa_id`),
  ADD CONSTRAINT `m_tugas_mahasiswa_tugas_kompeten_id_foreign` FOREIGN KEY (`tugas_kompeten_id`) REFERENCES `m_tugas_kompeten` (`tugas_kompeten_id`);

--
-- Constraints for table `m_tugas_tendik`
--
ALTER TABLE `m_tugas_tendik`
  ADD CONSTRAINT `m_tugas_tendik_tendik_id_foreign` FOREIGN KEY (`tendik_id`) REFERENCES `m_tendik` (`tendik_id`),
  ADD CONSTRAINT `m_tugas_tendik_tugas_kompeten_id_foreign` FOREIGN KEY (`tugas_kompeten_id`) REFERENCES `m_tugas_kompeten` (`tugas_kompeten_id`);

--
-- Constraints for table `m_upload`
--
ALTER TABLE `m_upload`
  ADD CONSTRAINT `m_upload_surat_id_foreign` FOREIGN KEY (`surat_id`) REFERENCES `t_surat_berita_acara` (`surat_id`);

--
-- Constraints for table `m_user`
--
ALTER TABLE `m_user`
  ADD CONSTRAINT `m_user_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `m_level` (`level_id`);

--
-- Constraints for table `t_detail_bidkom`
--
ALTER TABLE `t_detail_bidkom`
  ADD CONSTRAINT `t_detail_bidkom_bidkom_id_foreign` FOREIGN KEY (`bidkom_id`) REFERENCES `m_bidang_kompetensi` (`bidkom_id`),
  ADD CONSTRAINT `t_detail_bidkom_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `m_mahasiswa` (`mahasiswa_id`);

--
-- Constraints for table `t_detail_jenis_kompen`
--
ALTER TABLE `t_detail_jenis_kompen`
  ADD CONSTRAINT `t_detail_jenis_kompen_bidkom_id_foreign` FOREIGN KEY (`bidkom_id`) REFERENCES `m_bidang_kompetensi` (`bidkom_id`),
  ADD CONSTRAINT `t_detail_jenis_kompen_jenis_kompen_id_foreign` FOREIGN KEY (`jenis_kompen_id`) REFERENCES `m_jenis_kompen` (`jenis_kompen_id`);

--
-- Constraints for table `t_progres_tugas`
--
ALTER TABLE `t_progres_tugas`
  ADD CONSTRAINT `t_progres_tugas_tugas_mahasiswa_id_foreign` FOREIGN KEY (`tugas_mahasiswa_id`) REFERENCES `m_tugas_mahasiswa` (`tugas_mahasiswa_id`);

--
-- Constraints for table `t_riwayat_kompen`
--
ALTER TABLE `t_riwayat_kompen`
  ADD CONSTRAINT `t_riwayat_kompen_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `m_mahasiswa` (`mahasiswa_id`),
  ADD CONSTRAINT `t_riwayat_kompen_tugas_kompeten_id_foreign` FOREIGN KEY (`tugas_kompeten_id`) REFERENCES `m_tugas_kompeten` (`tugas_kompeten_id`),
  ADD CONSTRAINT `t_riwayat_kompen_upload_id_foreign` FOREIGN KEY (`upload_id`) REFERENCES `m_upload` (`upload_id`);

--
-- Constraints for table `t_surat_berita_acara`
--
ALTER TABLE `t_surat_berita_acara`
  ADD CONSTRAINT `t_surat_berita_acara_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `m_mahasiswa` (`mahasiswa_id`),
  ADD CONSTRAINT `t_surat_berita_acara_progres_tugas_id_foreign` FOREIGN KEY (`progres_tugas_id`) REFERENCES `t_progres_tugas` (`progres_tugas_id`),
  ADD CONSTRAINT `t_surat_berita_acara_tugas_kompeten_id_foreign` FOREIGN KEY (`tugas_kompeten_id`) REFERENCES `m_tugas_kompeten` (`tugas_kompeten_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
