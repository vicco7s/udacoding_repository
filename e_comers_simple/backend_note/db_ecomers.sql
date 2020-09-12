-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 12, 2020 at 01:44 PM
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
-- Database: `db_ecomers`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_toko`
--

CREATE TABLE `tb_toko` (
  `id` int(11) NOT NULL,
  `kategori` text NOT NULL,
  `produk1` text NOT NULL,
  `produk2` text NOT NULL,
  `produk3` text NOT NULL,
  `produk4` text NOT NULL,
  `produk5` text NOT NULL,
  `produk6` text NOT NULL,
  `produk7` text NOT NULL,
  `produk8` text NOT NULL,
  `produk9` text NOT NULL,
  `produk10` text NOT NULL,
  `harga` int(11) NOT NULL,
  `image` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_toko`
--

INSERT INTO `tb_toko` (`id`, `kategori`, `produk1`, `produk2`, `produk3`, `produk4`, `produk5`, `produk6`, `produk7`, `produk8`, `produk9`, `produk10`, `harga`, `image`) VALUES
(1, 'Buah', 'Apel', 'Jeruk', 'Mangga', 'Rambutan', 'Pepaya', 'Kelengkeng', 'Buah Naga', 'Durian', 'Semangka', 'Kelapa', 50000, 'buah.jpg'),
(2, 'sayuran', 'Sawi', 'Timun', 'Wortel', 'Kentang', 'Jamur', 'Terong', 'Cabe', 'tidak ada produk', 'tidak ada produk', 'tidak ada produk', 10000, 'sayuran.jpg'),
(3, 'Makanan', 'Rendang', 'Pecel', 'Pecel Lele', 'Nasi Kucing', 'Nasi Goreng', 'Bubur Ayam', 'Tidak Ada Produk', 'Tidak Ada Produk', 'Tidak  Ada Produk', '-', 50000, 'makanan.jpg'),
(4, 'Tas', 'Hago', 'Nike', '-', '-', '-', '-', '-', '-', '-', '-', 100000, 'tas.jpg'),
(5, 'SmartPhone', 'Xiaomi', 'Oppo', 'Realme', 'Vivo', 'Iphone', '', '', '', '', '', 1000000, 'hp.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `email`, `password`) VALUES
(2, 'adminn', 'adminn@mail.com', '1234567'),
(3, 'admin', 'adminn@mail.com', '1234567'),
(4, 'mail', 'mael@mail.com', '1234567'),
(5, 'maill', 'mael@mail.com', '1234567'),
(6, 'mailll', 'mael@mail.com', '1234567'),
(7, 'maillll', 'mael@mail.com', '1234567'),
(8, '', '', ''),
(9, 'cocok', 'cocok@email.id', '123y456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_toko`
--
ALTER TABLE `tb_toko`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_toko`
--
ALTER TABLE `tb_toko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
