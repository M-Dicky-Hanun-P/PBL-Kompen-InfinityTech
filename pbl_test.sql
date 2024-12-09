-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 05, 2024 at 03:18 AM
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
-- Database: `pbl_test`
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
-- Table structure for table `file_upload`
--

CREATE TABLE `file_upload` (
  `id_upload` int NOT NULL,
  `id_surat` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_admin`
--

CREATE TABLE `m_admin` (
  `id_admin` int NOT NULL,
  `id_level` int DEFAULT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nip` char(18) NOT NULL,
  `no_telepon` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `m_admin`
--

INSERT INTO `m_admin` (`id_admin`, `id_level`, `username`, `password`, `nip`, `no_telepon`, `email`, `nama`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 1, 'jason', '$2y$12$xw3dlS0UG/C62rV1uKN4AekXfy29EH39mRJ5hVKJJ0I7cM9N6huUO', '200001012002021001', '081233334444', 'jason@gmail.com', 'Jason Huang', '', '2024-11-30 19:38:54', '2024-11-30 19:38:54'),
(2, 1, 'justin', '$2y$12$K4l0AkPBU9cTfHFa3RmUgOgJneklKBLWnKlKN9AeIAGIDI1KyXpje', '200201122022022012', '081255556666', 'justin@gmail.com', 'Justin Patrick', '', '2024-11-30 19:38:54', '2024-11-30 19:38:54'),
(3, 1, 'angela', '$2y$12$nRGWEESDElBrpSn9PQ1PiesXQEFnsitR8VfrV1n./SQx1xKJbFfke', '199801122020022017', '081299998888', 'angela@gmail.com', 'angela fey', '', '2024-11-30 19:38:54', '2024-11-30 19:38:54'),
(4, 1, 'zeeeeee', '$2y$12$FvHpopPczSfmusz4Y7NKj.yHkZTpH5ep19PEmeRNfOhx6U6CoGg7S', '200101122020022022', '081299998888', 'zee@gmail.com', 'zee zee', '', '2024-11-30 19:38:54', '2024-12-04 11:14:45');

-- --------------------------------------------------------

--
-- Table structure for table `m_alpha`
--

CREATE TABLE `m_alpha` (
  `id_alpha` int NOT NULL,
  `id_mahasiswa` int DEFAULT NULL,
  `jumlah_alpha` int DEFAULT NULL,
  `id_periode` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `m_alpha`
--

INSERT INTO `m_alpha` (`id_alpha`, `id_mahasiswa`, `jumlah_alpha`, `id_periode`) VALUES
(1, 1, 4, 5),
(2, 2, 10, 5),
(3, 3, 2, 5),
(4, 4, 16, 5),
(5, 5, 90, 5);

-- --------------------------------------------------------

--
-- Table structure for table `m_bidang_kompetensi`
--

CREATE TABLE `m_bidang_kompetensi` (
  `id_bidkom` int NOT NULL,
  `nama_bidkom` varchar(100) DEFAULT NULL,
  `tag_bidkom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `m_bidang_kompetensi`
--

INSERT INTO `m_bidang_kompetensi` (`id_bidkom`, `nama_bidkom`, `tag_bidkom`) VALUES
(1, 'Pemrograman Web', 'HTML'),
(2, 'Pemrograman Web', 'CSS'),
(3, 'Pemrograman Web', 'JavaScript'),
(4, 'Pemrograman Web', 'Frontend'),
(5, 'Pemrograman Web', 'Backend'),
(6, 'Jaringan Komputer', 'Networking'),
(7, 'Jaringan Komputer', 'LAN'),
(8, 'Jaringan Komputer', 'WAN'),
(9, 'Jaringan Komputer', 'Protocols'),
(10, 'Jaringan Komputer', 'Security'),
(11, 'Kecerdasan Buatan', 'Artificial Intelligents'),
(12, 'Kecerdasan Buatan', 'Machine Learning'),
(13, 'Kecerdasan Buatan', 'Deep Learning'),
(14, 'Kecerdasan Buatan', 'Natural Language Processing'),
(15, 'Pengolahan Data', 'SQL'),
(16, 'Pengolahan Data', 'Data Analysis'),
(17, 'Pengolahan Data', 'ETL'),
(18, 'Pengolahan Data', 'data Visualization');

-- --------------------------------------------------------

--
-- Table structure for table `m_data_mhs_kompen`
--

CREATE TABLE `m_data_mhs_kompen` (
  `id_data_mhs_kompen` int NOT NULL,
  `id_mahasiswa` int NOT NULL,
  `id_alpha` int NOT NULL,
  `id_kompen` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `m_data_mhs_kompen`
--

INSERT INTO `m_data_mhs_kompen` (`id_data_mhs_kompen`, `id_mahasiswa`, `id_alpha`, `id_kompen`) VALUES
(1, 1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_dosen`
--

CREATE TABLE `m_dosen` (
  `id_dosen` int NOT NULL,
  `id_level` int DEFAULT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nip` char(18) NOT NULL,
  `no_telepon` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `m_dosen`
--

INSERT INTO `m_dosen` (`id_dosen`, `id_level`, `username`, `password`, `nip`, `no_telepon`, `email`, `nama`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 2, 'felix', '$2y$12$w.ZEuwp9cOY4NjjpW4y4Mub.Wj1R8cwkOz2C4aPJ1UOyeLwo3GjMW', '199001012000011001', '081233334444', 'felix@gmail.com', 'Felix', '', '2024-11-30 19:54:05', '2024-11-30 19:54:05'),
(2, 2, 'dio', '$2y$12$EBr4J4Ohu1MyzqCnmmvIuOQ5M4Xyuk/N5bYFLqlrAXHr9rCij9lCi', '199001022000011002', '081255556666', 'dio@gmail.com', 'Dio', '', '2024-11-30 19:54:05', '2024-11-30 19:54:05'),
(3, 2, 'felicia', '$2y$12$9PbwjmidmCSehPPzhE3bHe4mf8J8RkfhwNmA7Z62eOpDAxobO4hTG', '199001032000012003', '081299998888', 'felicia@gmail.com', 'Felicia', '', '2024-11-30 19:54:05', '2024-11-30 19:54:05'),
(4, 2, 'freya', '$2y$12$NI6CKkCUaz83kQNH9uVa5OWwBw/hvo0hB9SVDZxuNfVsOPjW6kCOO', '199001042000012004', '081299998888', 'freya@gmail.com', 'Freya', '', '2024-11-30 19:54:05', '2024-11-30 19:54:05');

-- --------------------------------------------------------

--
-- Table structure for table `m_jenis_kompen`
--

CREATE TABLE `m_jenis_kompen` (
  `id_jenis_kompen` int NOT NULL,
  `jenis_kompen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_jenis_tugas`
--

CREATE TABLE `m_jenis_tugas` (
  `id_jenis_tugas` int NOT NULL,
  `jenis_tugas` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `m_jenis_tugas`
--

INSERT INTO `m_jenis_tugas` (`id_jenis_tugas`, `jenis_tugas`, `created_at`, `updated_at`) VALUES
(1, 'Teknisi', '2024-12-03 13:13:42', '2024-12-03 21:18:40'),
(2, 'Pengabdian', '2024-12-03 13:13:42', '2024-12-03 21:18:07'),
(3, 'Penelitian', '2024-12-03 13:13:42', '2024-12-03 06:15:19');

-- --------------------------------------------------------

--
-- Table structure for table `m_kompen`
--

CREATE TABLE `m_kompen` (
  `id_kompen` int NOT NULL,
  `id_mahasiswa` int NOT NULL,
  `id_alpha` int NOT NULL,
  `jumlah_alpha_sudah_dikerjakan` int NOT NULL,
  `id_periode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `m_kompen`
--

INSERT INTO `m_kompen` (`id_kompen`, `id_mahasiswa`, `id_alpha`, `jumlah_alpha_sudah_dikerjakan`, `id_periode`) VALUES
(1, 1, 1, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `m_level`
--

CREATE TABLE `m_level` (
  `id_level` int NOT NULL,
  `kode_level` varchar(50) NOT NULL,
  `nama_level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `m_level`
--

INSERT INTO `m_level` (`id_level`, `kode_level`, `nama_level`) VALUES
(1, 'ADM', 'Administrator'),
(2, 'DSN', 'Dosen'),
(3, 'TND', 'Tenaga Kependidikan'),
(4, 'MHS', 'Mahasiswa');

-- --------------------------------------------------------

--
-- Table structure for table `m_mahasiswa`
--

CREATE TABLE `m_mahasiswa` (
  `id_mahasiswa` int NOT NULL,
  `id_level` int DEFAULT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nim` varchar(15) NOT NULL,
  `prodi` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tahun_masuk` int DEFAULT NULL,
  `no_telepon` varchar(50) DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `m_mahasiswa`
--

INSERT INTO `m_mahasiswa` (`id_mahasiswa`, `id_level`, `username`, `password`, `nim`, `prodi`, `email`, `tahun_masuk`, `no_telepon`, `nama`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 4, 'kenneth', '$2y$12$Waalz4BkWmqWA/J6WwnMKeMjsScifuA2W5UgJ10YeS7LEOW0IuLri', '2241760001', 'Sistem Informasi Bisnis', 'kenneth@gmail.com', 2022, '081233334444', 'Kenneth', '', '2024-11-30 21:16:07', '2024-11-30 21:16:07'),
(2, 4, 'brandon', '$2y$12$vc73pzSl8vX1TPFk9W4UNuVJqcvUXbFqeYvrsQK9OAIzIduaoYxJa', '2241760002', 'Sistem Informasi Bisnis', 'brandon@gmail.com', 2022, '081255556666', 'Brandon', '', '2024-11-30 21:16:07', '2024-11-30 21:16:07'),
(3, 4, 'jocelyn', '$2y$12$fMdS3UhwhMlZZWaza8t5EeZCFVMTI1J3B6HW/3mUKT6OrkarPmEAi', '2241760003', 'Sistem Informasi Bisnis', 'jocelyn@gmail.com', 2022, '081299998888', 'Jocelyn', '', '2024-11-30 21:16:07', '2024-11-30 21:16:07'),
(4, 4, 'aileen', '$2y$12$OOlh53oIxG641WX1aqHqy.5ABwCm/EeZIUNgYlRDpwtSNraOT18Hq', '2241760004', 'Sistem Informasi Bisnis', 'aileen@gmail.com', 2022, '081299998888', 'Aileen', '', '2024-11-30 21:16:07', '2024-11-30 21:16:07'),
(5, 4, 'keenan', '$2y$12$FQw.QqqlhRJEajC9n6Up5.yjLtua4IjJQ7Yn/MtdqDR1ZmJyjFk9y', '2241760005', 'Teknik Informatika', 'keenan@gmail.com', 2023, '08144441111', 'Keenan', NULL, '2024-12-03 06:51:17', '2024-12-03 06:51:17'),
(6, 4, 'renoakuino', '$2y$12$KAAA53L2DCus9OyyF4.ScOLF9kNHPEowwJbCJSXjtDQgcrw2mT5ya', '2241760033', 'Sistem Informasi Bisnis', 'reno@gmail.com', 2023, '088805046782', 'Reno Akuino', NULL, '2024-12-04 11:01:08', '2024-12-04 11:01:08'),
(7, 4, 'andreas', '$2y$12$ghAU75q3Oz9nF3jO3e.N1OYDH6BQgMbqDp9dg.fwq9ri0TigFeRM2', '2241769867', 'Sistem Informasi Bisnis', 'johan@schooltech.biz.id', 2024, '08880504687', 'Johann', NULL, '2024-12-05 02:41:14', '2024-12-05 02:41:14');

-- --------------------------------------------------------

--
-- Table structure for table `m_periode_akademik`
--

CREATE TABLE `m_periode_akademik` (
  `id_periode` int NOT NULL,
  `semester` enum('ganjil','genap') DEFAULT NULL,
  `tahun_ajaran` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `m_periode_akademik`
--

INSERT INTO `m_periode_akademik` (`id_periode`, `semester`, `tahun_ajaran`) VALUES
(1, 'ganjil', 2022),
(2, 'genap', 2022),
(3, 'ganjil', 2023),
(4, 'genap', 2023),
(5, 'ganjil', 2024),
(6, 'genap', 2024);

-- --------------------------------------------------------

--
-- Table structure for table `m_tendik`
--

CREATE TABLE `m_tendik` (
  `id_tendik` int NOT NULL,
  `id_level` int DEFAULT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nip` char(18) NOT NULL,
  `no_telepon` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `m_tendik`
--

INSERT INTO `m_tendik` (`id_tendik`, `id_level`, `username`, `password`, `nip`, `no_telepon`, `email`, `nama`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 3, 'andrew', '$2y$12$O7f06nXa8LSh0HnmdxOmA.ng5gp8GvSUxe97g6gCfA.Py88EYfejy', '199101012000011001', '081233334444', 'andrew@gmail.com', 'Andrew', '', '2024-11-30 19:59:32', '2024-11-30 19:59:32'),
(2, 3, 'jevan', '$2y$12$az9CKaPbS74VbCzL.vgFK.DUI4D3inGbLTCFaRu1PvbA2.k.0XG6G', '199101022000011002', '081255556666', 'jevan@gmail.com', 'Jevan', '', '2024-11-30 19:59:32', '2024-11-30 19:59:32'),
(3, 3, 'jocelyn', '$2y$12$HLirj6lKyV5Exsz6t2lZYuWmZ3fQza9ppv1J1JQso6GziqgmMsZRa', '199101032000012003', '081299998888', 'jocelyn@gmail.com', 'Jocelyn', '', '2024-11-30 19:59:32', '2024-11-30 19:59:32'),
(4, 3, 'aileen', '$2y$12$J1pKrb9jLxjbHigGooWvIOin76X5G63hjrmOJQb/AoZfezd/kusIa', '199001042000012004', '081299998888', 'aileen@gmail.com', 'Aileen', '', '2024-11-30 19:59:32', '2024-11-30 19:59:32');

-- --------------------------------------------------------

--
-- Table structure for table `m_tugas_kompen`
--

CREATE TABLE `m_tugas_kompen` (
  `id_tugas_kompen` int NOT NULL,
  `nama_tugas` varchar(50) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `status` enum('dibuka','ditutup') NOT NULL,
  `tanggal_mulai` datetime NOT NULL,
  `tanggal_selesai` datetime NOT NULL,
  `jam_kompen` varchar(50) NOT NULL,
  `pemberi_tugas` varchar(50) NOT NULL,
  `kuota` int NOT NULL,
  `id_jenis_tugas` int DEFAULT NULL,
  `status_permintaan` enum('Request','Diterima','Ditolak') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `m_tugas_kompen`
--

INSERT INTO `m_tugas_kompen` (`id_tugas_kompen`, `nama_tugas`, `deskripsi`, `status`, `tanggal_mulai`, `tanggal_selesai`, `jam_kompen`, `pemberi_tugas`, `kuota`, `id_jenis_tugas`, `status_permintaan`, `created_at`) VALUES
(1, 'Membersihkan Ruang Kelas', 'Membersihkan kelas B3 sebelum ujian.', 'dibuka', '2024-12-01 10:00:00', '2024-12-01 12:00:00', '2', 'Dosen A', 5, 1, NULL, NULL),
(2, 'Mengatur Arsip', 'Membantu mengatur dokumen di ruang administrasi.', 'dibuka', '2024-12-02 09:00:00', '2024-12-02 12:00:00', '3', 'Dosen B', 3, 2, NULL, NULL),
(3, 'Memperbaiki Inventaris', 'Mengecek dan memperbaiki peralatan laboratorium.', 'dibuka', '2024-12-03 13:00:00', '2024-12-03 17:00:00', '4', 'Tendik C', 2, 3, NULL, NULL);

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
-- Table structure for table `tugas_admin`
--

CREATE TABLE `tugas_admin` (
  `id_tugas_admin` int NOT NULL,
  `id_admin` int NOT NULL,
  `deskripsi_tugas` text NOT NULL,
  `tanggal_tugas` date NOT NULL,
  `id_tugas_kompen` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tugas_dosen`
--

CREATE TABLE `tugas_dosen` (
  `id_tugas_dosen` int NOT NULL,
  `id_dosen` int NOT NULL,
  `deskripsi_tugas` text NOT NULL,
  `tanggal_tugas` date NOT NULL,
  `id_tugas_kompen` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tugas_mahasiswa`
--

CREATE TABLE `tugas_mahasiswa` (
  `id_tugas_mahasiswa` int NOT NULL,
  `id_mahasiswa` int NOT NULL,
  `deskripsi_tugas` text NOT NULL,
  `tanggal_tugas` date NOT NULL,
  `id_tugas_kompen` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tugas_tendik`
--

CREATE TABLE `tugas_tendik` (
  `id_tugas_tendik` int NOT NULL,
  `id_tendik` int NOT NULL,
  `deskripsi_tugas` text NOT NULL,
  `tanggal_tugas` date NOT NULL,
  `id_tugas_kompen` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_detail_bidkom`
--

CREATE TABLE `t_detail_bidkom` (
  `id_detail_bidkom` int NOT NULL,
  `id_mahasiswa` int DEFAULT NULL,
  `id_bidkom` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_detail_bidkom`
--

INSERT INTO `t_detail_bidkom` (`id_detail_bidkom`, `id_mahasiswa`, `id_bidkom`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `t_detail_jenis_kompen`
--

CREATE TABLE `t_detail_jenis_kompen` (
  `id_detail_jenis_kompen` int NOT NULL,
  `id_bidkom` int NOT NULL,
  `id_jenis_kompen` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_progres_tugas`
--

CREATE TABLE `t_progres_tugas` (
  `id_progres_tugas` int NOT NULL,
  `id_tugas` int NOT NULL,
  `nim` int NOT NULL,
  `status_progres` enum('selesai','progres') NOT NULL,
  `progress` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_riwayat_kompen`
--

CREATE TABLE `t_riwayat_kompen` (
  `id_riwayat` int NOT NULL,
  `id_tugas_kompen` int NOT NULL,
  `id_mahasiswa` int NOT NULL,
  `tanggal_mulai` datetime NOT NULL,
  `tanggal_selesai` datetime NOT NULL,
  `status_riwayat` enum('selesai','tidak_selesai') NOT NULL,
  `id_upload` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_surat_berita_acara`
--

CREATE TABLE `t_surat_berita_acara` (
  `id_surat` int NOT NULL,
  `id_mahasiswa` int NOT NULL,
  `id_progres_tugas` int NOT NULL,
  `id_tugas_kompen` int NOT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Indexes for table `file_upload`
--
ALTER TABLE `file_upload`
  ADD PRIMARY KEY (`id_upload`),
  ADD KEY `id_surat` (`id_surat`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_admin`
--
ALTER TABLE `m_admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `id_level` (`id_level`);

--
-- Indexes for table `m_alpha`
--
ALTER TABLE `m_alpha`
  ADD PRIMARY KEY (`id_alpha`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_periode` (`id_periode`);

--
-- Indexes for table `m_bidang_kompetensi`
--
ALTER TABLE `m_bidang_kompetensi`
  ADD PRIMARY KEY (`id_bidkom`);

--
-- Indexes for table `m_dosen`
--
ALTER TABLE `m_dosen`
  ADD PRIMARY KEY (`id_dosen`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `id_level` (`id_level`);

--
-- Indexes for table `m_jenis_kompen`
--
ALTER TABLE `m_jenis_kompen`
  ADD PRIMARY KEY (`id_jenis_kompen`);

--
-- Indexes for table `m_jenis_tugas`
--
ALTER TABLE `m_jenis_tugas`
  ADD PRIMARY KEY (`id_jenis_tugas`);

--
-- Indexes for table `m_kompen`
--
ALTER TABLE `m_kompen`
  ADD PRIMARY KEY (`id_kompen`);

--
-- Indexes for table `m_level`
--
ALTER TABLE `m_level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `m_mahasiswa`
--
ALTER TABLE `m_mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD KEY `id_level` (`id_level`);

--
-- Indexes for table `m_periode_akademik`
--
ALTER TABLE `m_periode_akademik`
  ADD PRIMARY KEY (`id_periode`);

--
-- Indexes for table `m_tendik`
--
ALTER TABLE `m_tendik`
  ADD PRIMARY KEY (`id_tendik`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `id_level` (`id_level`);

--
-- Indexes for table `m_tugas_kompen`
--
ALTER TABLE `m_tugas_kompen`
  ADD PRIMARY KEY (`id_tugas_kompen`),
  ADD KEY `id_jenis_tugas` (`id_jenis_tugas`);

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
-- Indexes for table `tugas_admin`
--
ALTER TABLE `tugas_admin`
  ADD PRIMARY KEY (`id_tugas_admin`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_tugas_kompen` (`id_tugas_kompen`);

--
-- Indexes for table `tugas_dosen`
--
ALTER TABLE `tugas_dosen`
  ADD PRIMARY KEY (`id_tugas_dosen`),
  ADD KEY `id_dosen` (`id_dosen`),
  ADD KEY `id_tugas_kompen` (`id_tugas_kompen`);

--
-- Indexes for table `tugas_mahasiswa`
--
ALTER TABLE `tugas_mahasiswa`
  ADD PRIMARY KEY (`id_tugas_mahasiswa`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_tugas_kompen` (`id_tugas_kompen`);

--
-- Indexes for table `tugas_tendik`
--
ALTER TABLE `tugas_tendik`
  ADD PRIMARY KEY (`id_tugas_tendik`),
  ADD KEY `id_tendik` (`id_tendik`),
  ADD KEY `id_tugas_kompen` (`id_tugas_kompen`);

--
-- Indexes for table `t_detail_bidkom`
--
ALTER TABLE `t_detail_bidkom`
  ADD PRIMARY KEY (`id_detail_bidkom`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_bidkom` (`id_bidkom`);

--
-- Indexes for table `t_detail_jenis_kompen`
--
ALTER TABLE `t_detail_jenis_kompen`
  ADD PRIMARY KEY (`id_detail_jenis_kompen`),
  ADD KEY `id_bidkom` (`id_bidkom`),
  ADD KEY `id_jenis_kompen` (`id_jenis_kompen`);

--
-- Indexes for table `t_progres_tugas`
--
ALTER TABLE `t_progres_tugas`
  ADD PRIMARY KEY (`id_progres_tugas`),
  ADD KEY `id_tugas` (`id_tugas`);

--
-- Indexes for table `t_riwayat_kompen`
--
ALTER TABLE `t_riwayat_kompen`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `id_tugas_kompen` (`id_tugas_kompen`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_upload` (`id_upload`);

--
-- Indexes for table `t_surat_berita_acara`
--
ALTER TABLE `t_surat_berita_acara`
  ADD PRIMARY KEY (`id_surat`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_progres_tugas` (`id_progres_tugas`);

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_admin`
--
ALTER TABLE `m_admin`
  MODIFY `id_admin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_alpha`
--
ALTER TABLE `m_alpha`
  MODIFY `id_alpha` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `m_bidang_kompetensi`
--
ALTER TABLE `m_bidang_kompetensi`
  MODIFY `id_bidkom` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `m_dosen`
--
ALTER TABLE `m_dosen`
  MODIFY `id_dosen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_kompen`
--
ALTER TABLE `m_kompen`
  MODIFY `id_kompen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_level`
--
ALTER TABLE `m_level`
  MODIFY `id_level` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_mahasiswa`
--
ALTER TABLE `m_mahasiswa`
  MODIFY `id_mahasiswa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `m_periode_akademik`
--
ALTER TABLE `m_periode_akademik`
  MODIFY `id_periode` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `m_tendik`
--
ALTER TABLE `m_tendik`
  MODIFY `id_tendik` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_tugas_kompen`
--
ALTER TABLE `m_tugas_kompen`
  MODIFY `id_tugas_kompen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tugas_admin`
--
ALTER TABLE `tugas_admin`
  MODIFY `id_tugas_admin` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tugas_dosen`
--
ALTER TABLE `tugas_dosen`
  MODIFY `id_tugas_dosen` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tugas_mahasiswa`
--
ALTER TABLE `tugas_mahasiswa`
  MODIFY `id_tugas_mahasiswa` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tugas_tendik`
--
ALTER TABLE `tugas_tendik`
  MODIFY `id_tugas_tendik` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_detail_bidkom`
--
ALTER TABLE `t_detail_bidkom`
  MODIFY `id_detail_bidkom` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `file_upload`
--
ALTER TABLE `file_upload`
  ADD CONSTRAINT `file_upload_ibfk_1` FOREIGN KEY (`id_surat`) REFERENCES `t_surat_berita_acara` (`id_surat`) ON DELETE CASCADE;

--
-- Constraints for table `m_admin`
--
ALTER TABLE `m_admin`
  ADD CONSTRAINT `m_admin_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `m_level` (`id_level`);

--
-- Constraints for table `m_alpha`
--
ALTER TABLE `m_alpha`
  ADD CONSTRAINT `m_alpha_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `m_mahasiswa` (`id_mahasiswa`),
  ADD CONSTRAINT `m_alpha_ibfk_2` FOREIGN KEY (`id_periode`) REFERENCES `m_periode_akademik` (`id_periode`);

--
-- Constraints for table `m_dosen`
--
ALTER TABLE `m_dosen`
  ADD CONSTRAINT `m_dosen_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `m_level` (`id_level`);

--
-- Constraints for table `m_mahasiswa`
--
ALTER TABLE `m_mahasiswa`
  ADD CONSTRAINT `m_mahasiswa_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `m_level` (`id_level`);

--
-- Constraints for table `m_tendik`
--
ALTER TABLE `m_tendik`
  ADD CONSTRAINT `m_tendik_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `m_level` (`id_level`);

--
-- Constraints for table `m_tugas_kompen`
--
ALTER TABLE `m_tugas_kompen`
  ADD CONSTRAINT `m_tugas_kompen_ibfk_1` FOREIGN KEY (`id_jenis_tugas`) REFERENCES `m_jenis_tugas` (`id_jenis_tugas`);

--
-- Constraints for table `tugas_admin`
--
ALTER TABLE `tugas_admin`
  ADD CONSTRAINT `tugas_admin_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `m_admin` (`id_admin`),
  ADD CONSTRAINT `tugas_admin_ibfk_2` FOREIGN KEY (`id_tugas_kompen`) REFERENCES `m_tugas_kompen` (`id_tugas_kompen`);

--
-- Constraints for table `tugas_dosen`
--
ALTER TABLE `tugas_dosen`
  ADD CONSTRAINT `tugas_dosen_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `m_dosen` (`id_dosen`),
  ADD CONSTRAINT `tugas_dosen_ibfk_2` FOREIGN KEY (`id_tugas_kompen`) REFERENCES `m_tugas_kompen` (`id_tugas_kompen`);

--
-- Constraints for table `tugas_mahasiswa`
--
ALTER TABLE `tugas_mahasiswa`
  ADD CONSTRAINT `tugas_mahasiswa_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `m_mahasiswa` (`id_mahasiswa`),
  ADD CONSTRAINT `tugas_mahasiswa_ibfk_2` FOREIGN KEY (`id_tugas_kompen`) REFERENCES `m_tugas_kompen` (`id_tugas_kompen`);

--
-- Constraints for table `tugas_tendik`
--
ALTER TABLE `tugas_tendik`
  ADD CONSTRAINT `tugas_tendik_ibfk_1` FOREIGN KEY (`id_tendik`) REFERENCES `m_tendik` (`id_tendik`),
  ADD CONSTRAINT `tugas_tendik_ibfk_2` FOREIGN KEY (`id_tugas_kompen`) REFERENCES `m_tugas_kompen` (`id_tugas_kompen`);

--
-- Constraints for table `t_detail_bidkom`
--
ALTER TABLE `t_detail_bidkom`
  ADD CONSTRAINT `t_detail_bidkom_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `m_mahasiswa` (`id_mahasiswa`),
  ADD CONSTRAINT `t_detail_bidkom_ibfk_2` FOREIGN KEY (`id_bidkom`) REFERENCES `m_bidang_kompetensi` (`id_bidkom`);

--
-- Constraints for table `t_detail_jenis_kompen`
--
ALTER TABLE `t_detail_jenis_kompen`
  ADD CONSTRAINT `t_detail_jenis_kompen_ibfk_1` FOREIGN KEY (`id_bidkom`) REFERENCES `m_bidang_kompetensi` (`id_bidkom`),
  ADD CONSTRAINT `t_detail_jenis_kompen_ibfk_2` FOREIGN KEY (`id_jenis_kompen`) REFERENCES `m_jenis_kompen` (`id_jenis_kompen`);

--
-- Constraints for table `t_progres_tugas`
--
ALTER TABLE `t_progres_tugas`
  ADD CONSTRAINT `t_progres_tugas_ibfk_1` FOREIGN KEY (`id_tugas`) REFERENCES `t_detail_jenis_kompen` (`id_jenis_kompen`) ON DELETE CASCADE;

--
-- Constraints for table `t_riwayat_kompen`
--
ALTER TABLE `t_riwayat_kompen`
  ADD CONSTRAINT `t_riwayat_kompen_ibfk_1` FOREIGN KEY (`id_tugas_kompen`) REFERENCES `t_detail_jenis_kompen` (`id_jenis_kompen`) ON DELETE CASCADE,
  ADD CONSTRAINT `t_riwayat_kompen_ibfk_2` FOREIGN KEY (`id_mahasiswa`) REFERENCES `t_detail_jenis_kompen` (`id_jenis_kompen`) ON DELETE CASCADE,
  ADD CONSTRAINT `t_riwayat_kompen_ibfk_3` FOREIGN KEY (`id_upload`) REFERENCES `file_upload` (`id_upload`);

--
-- Constraints for table `t_surat_berita_acara`
--
ALTER TABLE `t_surat_berita_acara`
  ADD CONSTRAINT `t_surat_berita_acara_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `t_detail_jenis_kompen` (`id_jenis_kompen`) ON DELETE CASCADE,
  ADD CONSTRAINT `t_surat_berita_acara_ibfk_2` FOREIGN KEY (`id_progres_tugas`) REFERENCES `t_progres_tugas` (`id_progres_tugas`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
