-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2020 at 07:21 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbwifi`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_login`
--

CREATE TABLE IF NOT EXISTS `t_login` (
`id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `level` enum('admin','operator') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_login`
--

INSERT INTO `t_login` (`id`, `username`, `password`, `nama_lengkap`, `level`) VALUES
(1, 'arif', '123', 'arif', 'admin'),
(2, 'dimas', '123', 'arif dimas', 'operator');

-- --------------------------------------------------------

--
-- Table structure for table `t_paket`
--

CREATE TABLE IF NOT EXISTS `t_paket` (
  `id_paket` varchar(3) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `harga` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_paket`
--

INSERT INTO `t_paket` (`id_paket`, `nama`, `harga`) VALUES
('P01', '1 Mbps', '100000'),
('P02', '512 Kbps', '75000'),
('P03', '10Mbps', '500000'),
('P04', '5 Mbps', '250000'),
('P05', '2,5', '25000');

-- --------------------------------------------------------

--
-- Table structure for table `t_pelanggan`
--

CREATE TABLE IF NOT EXISTS `t_pelanggan` (
  `id_pelanggan` varchar(25) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `email` varchar(25) NOT NULL,
  `id_paket` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pelanggan`
--

INSERT INTO `t_pelanggan` (`id_pelanggan`, `nama`, `alamat`, `no_hp`, `email`, `id_paket`) VALUES
('NS006', 'Zulham', 'Kisaran Kota', '0813809090', 'zulham@gmail.com', 'P02'),
('SN01', 'Iwan', 'Air Batu', '0852', 'iwan@emailku.com', 'P01'),
('SN02', 'Afika Aliyah', 'Batu Bara', '0812', 'afika@email.com', 'P01'),
('SN03', 'User', 'kisaran', '082', 'email@email.com', 'P01'),
('SN04', 'Coba', 'Tanjung Balai', '0812345', 'coba@emai.com', 'P02'),
('SN90', 'ZUKIM', 'Jl.Madong Lubis', '9090', 'dg@gmail.com', 'P01');

-- --------------------------------------------------------

--
-- Table structure for table `t_setting`
--

CREATE TABLE IF NOT EXISTS `t_setting` (
`id` int(1) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `pemilik` varchar(50) NOT NULL,
  `logo` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_setting`
--

INSERT INTO `t_setting` (`id`, `nama`, `alamat`, `pemilik`, `logo`) VALUES
(1, 'PT TELKOM INDONESIA', 'JL. Perintis Kemerdekaan, KM. 203, Bangun, Pulau Rakyat, Kabupaten Asahan, Sumatera Utara 21273', 'PT.TELKOM INDONESIA', 'logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `t_transaksi`
--

CREATE TABLE IF NOT EXISTS `t_transaksi` (
  `id_transaksi` varchar(30) NOT NULL,
  `id_pelanggan` varchar(50) NOT NULL,
  `nominal` int(7) NOT NULL,
  `bukti` varchar(50) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `tgl_validasi` date NOT NULL,
  `status` enum('pending','lunas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_transaksi`
--

INSERT INTO `t_transaksi` (`id_transaksi`, `id_pelanggan`, `nominal`, `bukti`, `tgl_bayar`, `tgl_validasi`, `status`) VALUES
('am80', 'admin', 7000, '', '2020-01-15', '2020-01-17', 'lunas'),
('INV001', 'SN02', 100000, '', '2019-11-20', '2019-11-26', 'lunas'),
('INV004', 'SN02', 50000, '', '2019-11-20', '2019-11-26', 'lunas'),
('INV005', 'SN03', 75000, '', '2019-11-20', '0000-00-00', 'pending'),
('INV006', 'SN03', 50000, '', '2019-11-20', '0000-00-00', 'pending'),
('INV007', 'SN03', 50000, '', '2019-11-20', '2019-11-26', 'lunas'),
('INV008', 'SN03', 50000, '', '2019-11-20', '2019-11-14', 'lunas'),
('INV011', 'SN03', 75, '', '2019-11-20', '0000-00-00', 'pending'),
('INV012', 'SN03', 75, '', '2019-11-13', '0000-00-00', 'pending'),
('INV013', 'SN03', 75000, '', '2019-11-13', '0000-00-00', 'pending'),
('ivb', 'Admin001', 500000, '', '2019-11-04', '2020-01-22', 'lunas'),
('ns009', 'P001', 400000, '', '2019-11-04', '0000-00-00', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE IF NOT EXISTS `t_user` (
  `username` varchar(25) NOT NULL,
  `paswd` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `level` int(1) NOT NULL,
  `ket` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`username`, `paswd`, `email`, `nama`, `level`, `ket`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'drstein045@gmail.com', 'Ahmad AMIN', 1, 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_login`
--
ALTER TABLE `t_login`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_paket`
--
ALTER TABLE `t_paket`
 ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `t_pelanggan`
--
ALTER TABLE `t_pelanggan`
 ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `t_setting`
--
ALTER TABLE `t_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_transaksi`
--
ALTER TABLE `t_transaksi`
 ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
 ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_login`
--
ALTER TABLE `t_login`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `t_setting`
--
ALTER TABLE `t_setting`
MODIFY `id` int(1) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
