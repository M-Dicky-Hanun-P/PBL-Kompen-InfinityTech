-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 28, 2024 at 11:28 AM
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
-- Database: `pbl_kompen`
--

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
-- Table structure for table `m_admin`
--

CREATE TABLE `m_admin` (
  `id_admin` int NOT NULL,
  `id_level` int DEFAULT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `nip` char(18) NOT NULL,
  `no_telepon` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `m_bidang_kompetensi`
--

CREATE TABLE `m_bidang_kompetensi` (
  `id_bidkom` int NOT NULL,
  `nama_bidkom` varchar(100) DEFAULT NULL,
  `tag_bidkom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_dosen`
--

CREATE TABLE `m_dosen` (
  `id_dosen` int NOT NULL,
  `id_level` int DEFAULT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `nip` char(18) NOT NULL,
  `no_telepon` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `password` varchar(15) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `prodi` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tahun_masuk` int DEFAULT NULL,
  `no_telepon` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_periode_akademik`
--

CREATE TABLE `m_periode_akademik` (
  `id_periode` int NOT NULL,
  `semester` enum('ganjil','genap') DEFAULT NULL,
  `tahun_ajaran` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_tendik`
--

CREATE TABLE `m_tendik` (
  `id_tendik` int NOT NULL,
  `id_level` int DEFAULT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `nip` char(18) NOT NULL,
  `no_telepon` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `kuota` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `id_tag_bidkom` int NOT NULL,
  `id_mahasiswa` int DEFAULT NULL,
  `id_bidkom` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `file_upload`
--
ALTER TABLE `file_upload`
  ADD PRIMARY KEY (`id_upload`),
  ADD KEY `id_surat` (`id_surat`);

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
  ADD PRIMARY KEY (`id_tugas_kompen`);

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
  ADD PRIMARY KEY (`id_tag_bidkom`),
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_admin`
--
ALTER TABLE `m_admin`
  MODIFY `id_admin` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_alpha`
--
ALTER TABLE `m_alpha`
  MODIFY `id_alpha` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_bidang_kompetensi`
--
ALTER TABLE `m_bidang_kompetensi`
  MODIFY `id_bidkom` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_dosen`
--
ALTER TABLE `m_dosen`
  MODIFY `id_dosen` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_level`
--
ALTER TABLE `m_level`
  MODIFY `id_level` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_mahasiswa`
--
ALTER TABLE `m_mahasiswa`
  MODIFY `id_mahasiswa` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_periode_akademik`
--
ALTER TABLE `m_periode_akademik`
  MODIFY `id_periode` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_tendik`
--
ALTER TABLE `m_tendik`
  MODIFY `id_tendik` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_tugas_kompen`
--
ALTER TABLE `m_tugas_kompen`
  MODIFY `id_tugas_kompen` int NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_tag_bidkom` int NOT NULL AUTO_INCREMENT;

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
