-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2019 at 02:50 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;




--
-- Database: `multi_user`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengajuan`
--

CREATE TABLE `tb_pengajuan` (
  `id` int(11) NOT NULL,
  `id_peminjam` int(11) NOT NULL,
  `besar_pinjaman` int(11) NOT NULL,
  `status_keanggotaan` enum('aktif','pasif') NOT NULL,
  `status_pinjaman` enum('Tidak Ada','Ada') NOT NULL,
  `keperluan` enum('Modal Usaha','Berobat','Sekolah','Kebutuhan Sehari-hari','Hajatan') NOT NULL,
  `jangka_waktu` enum('5','10','20') NOT NULL,
  `tanggal_pengajuan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengajuan`
--

INSERT INTO `tb_pengajuan` (`id`, `id_peminjam`, `besar_pinjaman`, `status_keanggotaan`, `status_pinjaman`, `keperluan`, `jangka_waktu`, `tanggal_pengajuan`) VALUES
(3, 3, 87000, 'aktif', 'Tidak Ada', 'Hajatan', '5', '2019-07-14');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


--
-- Database: `multi_user`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pinjaman`
--

CREATE TABLE `tb_pinjaman` (
  `id_anggota` int(11) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `saldo_pinjaman` float NOT NULL,
  `sejak tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pinjaman`
--

INSERT INTO `tb_pinjaman` (`id_anggota`, `nama_anggota`, `saldo_pinjaman`, `sejak tanggal`) VALUES
(1, 'ajid', 0, '0000-00-00'),
(2, 'Osin', 600000, '2018-03-12'),
(3, 'idar', 0, '0000-00-00'),
(4, 'uju', 0, '0000-00-00'),
(5, 'Dede Aga', 0, '0000-00-00'),
(6, 'emuh', 400000, '2018-11-12'),
(7, 'Ojat', 250000, '2010-09-10'),
(8, 'Awa', 0, '0000-00-00'),
(9, 'Umeh', 500000, '2018-12-20'),
(10, 'Anes', 600000, '2018-12-20'),
(11, 'Ipin', 0, '0000-00-00'),
(12, 'rohman', 2500000, '2018-02-05'),
(13, 'iin', 150000, '2018-10-18'),
(14, 'Daday', 200000, '2018-12-23'),
(15, 'H.D Tatang S', 500000, '2018-12-20'),
(16, 'rohana', 2000000, '2018-12-18'),
(17, 'Toyiban', 2500000, '2016-09-10'),
(18, 'onda', 3200000, '2018-12-16'),
(19, 'imat', 0, '0000-00-00'),
(20, 'Wanah', 0, '0000-00-00'),
(21, 'H.Nana Rubana', 0, '0000-00-00'),
(22, 'Oom', 10000000, '2018-11-18'),
(23, 'Hj. Iis Syafari', 0, '0000-00-00'),
(24, 'Ayi Komariah', 0, '0000-00-00'),
(25, 'Acah Suhaeti', 0, '0000-00-00'),
(26, 'Aan Aning K', 2250000, '2018-12-23'),
(27, 'sumarna', 1600000, '2018-12-23'),
(28, 'Emin/Nanda\r\n', 4000000, '2015-11-19'),
(29, 'Ias Kurniati\r\n', 2000000, '2018-12-23'),
(30, 'Entin Krisliani\r\n', 0, '0000-00-00'),
(31, 'Ani Mulyani\r\n', 0, '0000-00-00'),
(32, 'Samsudin', 1100000, '2018-11-15'),
(33, 'Cucun cahyati\r\n', 0, '0000-00-00'),
(34, 'Suma Wijaya', 1490000, '2012-07-24'),
(35, 'Amat', 1750000, '2018-12-23'),
(36, 'Ida/Yayat\r\n', 50000, '2014-01-17'),
(37, 'Heni/Udi', 3000000, '2018-11-23'),
(38, 'Isah\r\n', 400000, '2002-10-07'),
(39, 'Ain Oma\r\n', 2600000, '2018-09-12'),
(40, 'Iip Suminar\r\n', 20000, '2018-12-30'),
(41, 'Ikah\r\n', 220000, '2009-11-03'),
(42, 'Jaja Endeng\r\n', 400000, '2014-03-25'),
(43, 'Cucu Samsudin\r\n', 0, '0000-00-00'),
(44, 'Uun Nana\r\n', 150000, '2005-07-03'),
(45, 'Odah\r\n', 580000, '2016-12-12'),
(46, 'Ara Nining\r\n', 4200000, '2018-01-12'),
(47, 'Eceh / Yuyun\r\n', 2000000, '2016-12-22'),
(48, 'Oma Romansyah\r\n', 0, '0000-00-00'),
(49, 'Juhara\r\n', 500000, '2004-04-09'),
(50, 'Lili Uyun\r\n', 6300000, '2018-08-27'),
(51, 'Rohman Rani', 800000, '2011-07-06'),
(52, 'Oyin', 300000, '2015-07-23'),
(53, 'Rani Grani', 0, '0000-00-00'),
(54, 'Mimin Rukmini', 0, '0000-00-00'),
(55, 'Eutik', 450000, '2009-09-17'),
(56, 'Elis', 500000, '2006-06-12'),
(57, 'Cacah', 320000, '2003-07-07'),
(58, 'Oyoh/Suhaya', 460000, '2005-12-12'),
(59, 'Ana', 0, '0000-00-00'),
(60, 'Eem Adang', 1000000, '2016-01-07'),
(61, 'Undang Onon', 800000, '2013-09-28'),
(62, 'Tini ( Buniherang )', 540000, '2005-12-23'),
(63, 'Titi', 700000, '2014-06-13'),
(64, 'Teri', 800000, '2018-12-18'),
(65, 'Eem Emas', 4000000, '2018-12-23'),
(66, 'Nia/Endang', 200000, '2016-12-26'),
(67, 'Wawan Setiawan', 268000, '2008-12-14'),
(68, 'Irmayanti', 0, '0000-00-00'),
(69, 'Sahroma', 0, '0000-00-00'),
(70, 'Asep Turyana S', 0, '0000-00-00'),
(71, 'Ajat/Nia', 1500000, '2018-04-17'),
(72, 'Popon P', 2000000, '2018-12-23'),
(73, 'Yayat Hayat', 0, '0000-00-00'),
(74, 'Yanti Sumirat', 3200000, '2018-12-20'),
(75, 'Erat', 900000, '2017-10-07'),
(76, 'Tatang S', 0, '0000-00-00'),
(77, 'Ujun', 350000, '2017-07-25'),
(78, 'Eti Sumiati', 7000000, '2018-11-29'),
(79, 'Rita Sugiarto', 0, '0000-00-00'),
(80, 'Rohimah', 0, '0000-00-00'),
(81, 'Ayi Cacah', 3500000, '2018-12-14'),
(82, 'Akbar', 0, '0000-00-00'),
(83, 'Asep Suherman', 0, '0000-00-00'),
(84, 'Tini Aep', 250000, '2016-12-27'),
(85, 'Wawan Entat', 900000, '2010-05-05'),
(86, 'Tati Entat', 0, '0000-00-00'),
(87, 'Mukhtar', 0, '0000-00-00'),
(88, 'Ai Yoyoh', 0, '0000-00-00'),
(89, 'Finki Anjani', 2700000, '2018-12-23'),
(90, 'Atik', 1800000, '2013-09-29'),
(91, 'Nani Una', 2400000, '2019-12-16'),
(92, 'Ating S', 0, '0000-00-00'),
(93, 'Sukandi Hadiansyah', 5000000, '2018-12-20'),
(94, 'Renita', 0, '0000-00-00'),
(95, 'Nina Juliana', 3000000, '2018-12-23'),
(96, 'Eros', 1200000, '2018-12-23'),
(97, 'Embeb ( Taryana )', 3000000, '2018-12-23'),
(98, 'Wa Acih', 700000, '2018-12-23'),
(99, 'Atiq Rohimah', 0, '0000-00-00'),
(100, 'Alen Rohana', 0, '0000-00-00'),
(101, 'Finkan S', 2700000, '2018-12-23'),
(102, 'Duri', 0, '0000-00-00'),
(103, 'Iwan Iwok', 10000000, '2018-11-18'),
(104, 'Nani Uju', 600000, '2018-12-23'),
(105, 'Peni', 1400000, '2018-12-23'),
(106, 'Lili Uday', 0, '0000-00-00'),
(107, 'Anisa', 4000000, '2018-12-20'),
(108, 'N.Tantan', 400000, '2018-10-16'),
(109, 'Ayi Atep', 0, '0000-00-00'),
(110, 'Imas Edi', 2700000, '2018-12-23'),
(111, 'Cahya ( Endet )', 2000000, '2018-08-24'),
(112, 'Nina JKT', 2500000, '2018-12-20'),
(113, 'Uju M', 10000000, '2018-12-23'),
(114, 'Rika Amelia', 0, '0000-00-00'),
(115, 'Amarulloh', 0, '0000-00-00'),
(116, 'Yayah Dariah', 4500000, '2018-11-11'),
(117, 'Dani', 2800000, '2018-12-23'),
(118, 'Iyah', 2700000, '2018-12-23'),
(119, 'Ayun', 5000000, '2018-12-23'),
(120, 'Ai Dace', 500000, '2018-07-10'),
(121, 'Eva Hanivah', 0, '0000-00-00'),
(122, 'Euis', 1800000, '2017-02-21'),
(123, 'Yani', 0, '0000-00-00'),
(124, 'Bu Ini', 3000000, '2018-12-23'),
(125, 'Eni', 240000, '2017-06-29'),
(126, 'Bu Tita', 1250000, '2018-12-23'),
(127, 'Neng Aep', 3250000, '2018-12-23'),
(128, 'Neni Juliani', 1500000, '2018-12-23'),
(129, 'Dadan', 4500000, '2018-05-16'),
(130, 'Uyun', 0, '0000-00-00'),
(131, 'Dede Yani', 100000, '0000-00-00'),
(132, 'Acin', 1600000, '2018-12-23'),
(133, 'Oom', 3000000, '2018-12-23'),
(134, 'Budi', 300000, '2018-12-23'),
(135, 'N Rika', 1400000, '2018-12-23'),
(136, 'Ai Nani', 1600000, '2018-12-23'),
(137, 'Santi', 0, '0000-00-00'),
(138, 'Hasan', 4000000, '2018-12-23'),
(139, 'Undang', 1500000, '2018-12-23'),
(140, 'Asep', 1200000, '2018-12-23'),
(141, 'Mugni Agnina', 0, '0000-00-00'),
(142, 'Nia', 0, '0000-00-00'),
(143, 'Atep', 0, '0000-00-00'),
(144, 'Neng Sari Yono', 3000000, '2018-07-17'),
(145, 'Siti Juariyah', 2700000, '2018-12-26'),
(146, 'Tati/Nyai Emi', 4300000, '2016-05-21'),
(147, 'wawat Waryati', 5000000, '2018-12-23'),
(148, 'Abdul Fatah', 0, '0000-00-00'),
(149, 'Yuyun', 6000000, '2018-11-12'),
(150, 'Soniangsih', 3000000, '2018-12-23'),
(151, 'Tuti Herawati', 0, '0000-00-00'),
(152, 'Ipit Pitri', 1400000, '2017-02-21'),
(153, 'Atep Rasid/ Kaerwati', 2500000, '2015-05-10'),
(154, 'Mastur', 500000, '2018-12-21'),
(155, 'Enung', 2250000, '0000-00-00'),
(156, 'Ai Hamidah', 2400000, '2017-01-12'),
(157, 'Mumuh', 1600000, '2018-12-23'),
(158, 'Dindin', 4500000, '0000-00-00'),
(159, 'Usman', 0, '0000-00-00'),
(160, 'Suhendi', 500000, '2018-12-26'),
(161, 'Wiwin', 1800000, '2018-12-23'),
(162, 'Yayat Cacah', 900000, '2018-02-12'),
(163, 'Titin', 0, '0000-00-00'),
(164, 'Neni Nuraeni', 800000, '2018-11-05'),
(165, 'Neng Anita', 0, '0000-00-00'),
(166, 'Endi Nita', 500000, '2018-12-23'),
(167, 'Ishak', 0, '0000-00-00'),
(168, 'Honijah', 0, '0000-00-00'),
(169, 'Enok', 0, '0000-00-00'),
(170, 'Upit', 1000000, '2018-12-23'),
(171, 'Pani', 0, '0000-00-00'),
(172, 'Yono', 0, '0000-00-00'),
(173, 'Neni N', 2100000, '2018-12-23'),
(174, 'Anita Pratiwi', 0, '0000-00-00'),
(175, 'Emas', 1600000, '2018-12-23'),
(176, 'Ipah Saripah', 2400000, '2018-12-23'),
(177, 'Epa Sapitri', 0, '0000-00-00'),
(178, 'Lina (Ira)', 0, '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_pinjaman`
--
ALTER TABLE `tb_pinjaman`
  ADD PRIMARY KEY (`id_anggota`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_pinjaman`
--
ALTER TABLE `tb_pinjaman`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;
COMMIT;


--
-- Database: `multi_user`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_simpanan`
--

CREATE TABLE `tb_simpanan` (
  `nama` varchar(50) NOT NULL,
  `simpanan_pokok` float NOT NULL,
  `simpanan_wajib` float NOT NULL,
  `simpanan_sukarela` float NOT NULL,
  `jumlah` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_simpanan`
--

INSERT INTO `tb_simpanan` (`nama`, `simpanan_pokok`, `simpanan_wajib`, `simpanan_sukarela`, `jumlah`) VALUES
('Ajid', 5000, 1689000, 3351000, 5045000),
('Osin', 5000, 862000, 874000, 1741000),
('Idar/Ilim', 5000, 999000, 799000, 1893000),
('Uju', 5000, 279000, 0, 284000),
('Dede Aga', 5000, 668000, 210000, 883000),
('Emuh', 5000, 495000, 773000, 1273000);
COMMIT;



--
-- Database: `multi_user`
--

-- --------------------------------------------------------

--
-- Table structure for table `pinjaman`
--

CREATE TABLE `pinjaman` (
  `id` int(11) NOT NULL,
  `id_peminjam` int(11) NOT NULL,
  `besar_pinjaman` int(11) NOT NULL,
  `keperluan` varchar(50) NOT NULL,
  `jangka_waktu` varchar(50) NOT NULL,
  `tanggal_pengajuan` date NOT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjaman`
--

INSERT INTO `pinjaman` (`id`, `id_peminjam`, `besar_pinjaman`, `keperluan`, `jangka_waktu`, `tanggal_pengajuan`, `status`) VALUES
(4, 3, 80000, 'Modal Usaha', '5', '2019-07-15', NULL);

-- --------------------------------------------------------



--
-- Table structure for table `tb_kriteria`
--

CREATE TABLE `tb_kriteria` (
  `id` int(11) NOT NULL,
  `kriteria` varchar(50) NOT NULL,
  `jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kriteria`
--

INSERT INTO `tb_kriteria` (`id`, `kriteria`, `jenis`) VALUES
(1, 'Status Keanggotaan', 'Benefit'),
(2, 'Status Pinjaman', 'Benefit'),
(3, 'Besar Pinjaman', 'Cost'),
(4, 'Keperluan', 'Benefit'),
(5, 'Jangka Waktu', 'Benefit');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `level`) VALUES
(1, 'finki anjani', 'finki', '9697', 'petugas'),
(2, 'fatimah ulwiyatul badriyah', 'fatimah', '3107', 'pengawas'),
(3, 'Finkan Sukma', 'finkan', '1803', 'anggota');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_anggota`
--
ALTER TABLE `tb_anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pinjaman`
--
ALTER TABLE `pinjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_anggota`
--
ALTER TABLE `tb_anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
