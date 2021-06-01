-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2021 at 02:50 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pangkat2`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis`
--

CREATE TABLE `tb_jenis` (
  `id_jenis` int(11) NOT NULL,
  `jenis` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenis`
--

INSERT INTO `tb_jenis` (`id_jenis`, `jenis`) VALUES
(1, 'KEAMANAN'),
(2, 'LINGKUNGAN'),
(3, 'INFRASTRUKTUR'),
(4, 'SOSIAL'),
(6, 'PARIWISATA');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengadu`
--

CREATE TABLE `tb_pengadu` (
  `id_pengadu` varchar(50) NOT NULL,
  `nama_pengadu` varchar(30) NOT NULL,
  `jekel` enum('LK','PR') NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `nomor_nik` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengadu`
--

INSERT INTO `tb_pengadu` (`id_pengadu`, `nama_pengadu`, `jekel`, `no_hp`, `alamat`, `nomor_nik`) VALUES
('0655bcac-ca84-4c56-8b10-1254c631b525', 'anis', 'PR', '087855432155', 'bojong', 32167),
('15d05f33-bd68-4330-ae89-7433bd53c472', 'amir', 'PR', '087855432155', 'bojong', 2147483647),
('305c40f3-365f-4f55-8ab7-7c9cc9ea265a', 'tesdida', 'LK', '123719823', 'rw 2 rw 1', 0),
('49831556-27f1-494c-acdb-480d63322cde', 'anita', 'PR', '087855432155', 'taruma jaya', 2147483647),
('5c29a931-3190-44f0-8c0b-84355a2fa5a0', 'anis', 'PR', '087855432155', 'bojong', 32167),
('64f883f2-aefc-44ee-93c2-d058b6f6be00', 'iyan', 'LK', '0218874653', 'cakung', 321699863),
('9851501b-f3a1-4061-a900-b74845fccd37', 'amir', 'PR', '087855432155657', 'bojong', 0),
('bc26f43b-4ed7-4f82-86d9-544361c9570f', 'aku', 'LK', '087855432155', 'bojong', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengaduan`
--

CREATE TABLE `tb_pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `jenis` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `foto` varchar(300) NOT NULL,
  `waktu_aduan` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'Proses',
  `tanggapan` text DEFAULT NULL,
  `author` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengaduan`
--

INSERT INTO `tb_pengaduan` (`id_pengaduan`, `judul`, `jenis`, `keterangan`, `foto`, `waktu_aduan`, `status`, `tanggapan`, `author`) VALUES
(15, 'got', 2, 'bau', '82ac3e6c83c311240b123d426b2d65f8.png', '2021-05-23 00:14:05', 'Proses', NULL, '15d05f33-bd68-4330-ae89-7433bd53c472'),
(16, 'sampah', 2, 'bau', '2162ccb55ee021cc50edcd1d06702723.png', '2021-05-23 00:32:23', 'Proses', NULL, '49831556-27f1-494c-acdb-480d63322cde'),
(17, 'sampah', 1, 'bau', '7554de857b084fc3b08d115e013f51db.png', '2021-05-23 00:57:52', 'Proses', NULL, 'bc26f43b-4ed7-4f82-86d9-544361c9570f'),
(18, 'jalanan rusak', 3, 'membahayakan..', '6964ef194c249a6d5bb1064edc472f4f.png', '2021-05-23 01:13:04', 'Tanggapi', 'akan kami lihat ke lokasi', '0655bcac-ca84-4c56-8b10-1254c631b525'),
(19, 'sampah', 2, 'bau sekali', '7554de857b084fc3b08d115e013f51db.png', '2021-05-23 21:05:01', 'Tanggapi', 'tunggu', '64f883f2-aefc-44ee-93c2-d058b6f6be00'),
(25, 'sampah', 2, 'aagag', '50c98cfc65dcb1e60519ce106f7fce6d.jpg', '2021-05-24 19:47:57', 'Proses', NULL, '64f883f2-aefc-44ee-93c2-d058b6f6be00'),
(26, 'jalanan rusak', 3, 'dghfdhgd', '803d74e246063f73a8b678fad9251603.jpg', '2021-05-24 19:54:43', 'Proses', NULL, '64f883f2-aefc-44ee-93c2-d058b6f6be00'),
(27, 'sampah', 2, 'fgggs', '43a6f3ce76b16f4a997a3685b632dafe.jpg', '2021-05-24 19:55:20', 'Proses', NULL, '64f883f2-aefc-44ee-93c2-d058b6f6be00'),
(28, 'sampah', 1, 'sgs', '43a6f3ce76b16f4a997a3685b632dafe.jpg', '2021-05-24 20:02:20', 'Proses', NULL, '64f883f2-aefc-44ee-93c2-d058b6f6be00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` varchar(50) NOT NULL,
  `nama_pengguna` varchar(30) NOT NULL,
  `nomer_nik` varchar(16) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` enum('Administrator','Petugas','Pengadu') NOT NULL DEFAULT 'Pengadu',
  `grup` enum('A','B') NOT NULL DEFAULT 'B'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id_pengguna`, `nama_pengguna`, `nomer_nik`, `username`, `password`, `level`, `grup`) VALUES
('5351949a-6598-11eb-96e0-60eb69a13690', 'Jumanto', '0', 'tugas', '1', 'Petugas', 'A'),
('766b07b7-658e-11eb-96e0-60eb69a13690', 'Zainal Arifin', '0', 'admin', '1', 'Administrator', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `tb_telegram`
--

CREATE TABLE `tb_telegram` (
  `id_telegram` varchar(5) NOT NULL,
  `user` varchar(20) NOT NULL,
  `id_chat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_telegram`
--

INSERT INTO `tb_telegram` (`id_telegram`, `user`, `id_chat`) VALUES
('tL9', 'Akun Telegram Admin', '087883663014');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_jenis`
--
ALTER TABLE `tb_jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `tb_pengadu`
--
ALTER TABLE `tb_pengadu`
  ADD PRIMARY KEY (`id_pengadu`);

--
-- Indexes for table `tb_pengaduan`
--
ALTER TABLE `tb_pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`),
  ADD KEY `jenis` (`jenis`),
  ADD KEY `author` (`author`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `tb_telegram`
--
ALTER TABLE `tb_telegram`
  ADD PRIMARY KEY (`id_telegram`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_jenis`
--
ALTER TABLE `tb_jenis`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_pengaduan`
--
ALTER TABLE `tb_pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_pengaduan`
--
ALTER TABLE `tb_pengaduan`
  ADD CONSTRAINT `tb_pengaduan_ibfk_1` FOREIGN KEY (`jenis`) REFERENCES `tb_jenis` (`id_jenis`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pengaduan_ibfk_2` FOREIGN KEY (`author`) REFERENCES `tb_pengadu` (`id_pengadu`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
