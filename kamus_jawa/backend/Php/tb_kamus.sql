-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 21, 2020 at 09:41 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kamus`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_kamus`
--

CREATE TABLE `tb_kamus` (
  `id_kamus` int(11) NOT NULL,
  `indo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jawa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kamus`
--

INSERT INTO `tb_kamus` (`id_kamus`, `indo`, `jawa`) VALUES
(1, 'saya', 'kulo'),
(3, 'kamu', 'koe'),
(4, 'apa', 'opo'),
(9, 'pergi', 'lungo'),
(12, 'lupa', 'lali'),
(13, 'kenapa', 'nyapo'),
(15, 'pepaya', 'kates'),
(16, 'pusing', 'mumet'),
(17, 'mulut', 'lambe'),
(18, 'pisang', 'gedang'),
(19, 'muka', 'rai / meripat'),
(20, 'marah', 'ngamok'),
(21, 'tidur', 'turu'),
(22, 'dimana', 'neng edi'),
(23, 'gigi', 'untu'),
(24, 'sarapan pagi', 'madang '),
(25, 'tidak', 'orak / dudu'),
(26, 'lepas', 'los dol'),
(27, 'cepetan', 'endang'),
(28, 'padi', 'pari'),
(29, 'habis', 'entek / telas'),
(30, 'beli', 'tuku '),
(31, 'jual', 'ngedol'),
(32, 'ingatlah', 'ilingo'),
(33, 'air', 'banyu'),
(34, 'kesini', 'merene'),
(35, 'ku kasih tahu', 'tak dudui'),
(36, 'ular', 'ulo'),
(37, 'mata', 'meripat / moto'),
(38, 'kambing', 'wedos'),
(39, 'siapa', 'sopo '),
(40, 'malam', 'bengi'),
(41, 'gelap', 'peteng'),
(42, 'pagi', 'isuk'),
(43, 'siang', 'awan'),
(44, 'kelelawar', 'lowo'),
(45, 'ayam', 'pitek');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_kamus`
--
ALTER TABLE `tb_kamus`
  ADD PRIMARY KEY (`id_kamus`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_kamus`
--
ALTER TABLE `tb_kamus`
  MODIFY `id_kamus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
