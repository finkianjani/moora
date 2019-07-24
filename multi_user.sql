-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jul 2019 pada 10.16
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.1.30

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
-- Struktur dari tabel `tb_kriteria`
--

CREATE TABLE `tb_kriteria` (
  `id` int(11) NOT NULL,
  `kode` varchar(3) NOT NULL,
  `kriteria` varchar(50) NOT NULL,
  `jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kriteria`
--

INSERT INTO `tb_kriteria` (`id`, `kode`, `kriteria`, `jenis`) VALUES
(1, 'K1', 'Status Keanggotaan', 'Benefit'),
(2, 'K2', 'Status Pinjaman', 'Benefit'),
(3, 'K3', 'Besar Pinjaman', 'Cost'),
(4, 'K4', 'Keperluan', 'Benefit'),
(5, 'K5', 'Jangka Waktu', 'Benefit');

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
  `tanggal_pengajuan` date NOT NULL,
  `status_pengajuan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengajuan`
--

INSERT INTO `tb_pengajuan` (`id`, `id_peminjam`, `besar_pinjaman`, `status_keanggotaan`, `status_pinjaman`, `keperluan`, `jangka_waktu`, `tanggal_pengajuan`, `status_pengajuan`) VALUES
(2, 8, 98000, 'pasif', 'Tidak Ada', 'Sekolah', '10', '2019-07-22', NULL),
(3, 2, 97000, 'aktif', 'Ada', 'Hajatan', '20', '2019-07-22', NULL),
(4, 3, 300000, 'aktif', 'Tidak Ada', 'Sekolah', '5', '2019-07-23', NULL),
(5, 88, 990000, 'aktif', 'Tidak Ada', 'Modal Usaha', '5', '2019-07-24', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pinjaman`
--

CREATE TABLE `tb_pinjaman` (
  `id` int(11) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `saldo_pinjaman` float NOT NULL,
  `sejak tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pinjaman`
--

INSERT INTO `tb_pinjaman` (`id`, `nama_anggota`, `saldo_pinjaman`, `sejak tanggal`) VALUES
(1, 'Ajid', 0, '0000-00-00'),
(2, 'Osin', 600000, '2018-03-12'),
(3, 'Awa/Elis', 0, '0000-00-00'),
(4, 'Idar/Ilim', 0, '0000-00-00'),
(5, 'Uju', 0, '0000-00-00'),
(6, 'Dede Aga', 400000, '2018-11-12'),
(7, 'Emuh', 250000, '2010-09-10'),
(8, 'Umeh/Ama', 0, '0000-00-00'),
(9, 'Anes/Ono', 500000, '2018-12-20'),
(10, 'Ipin Karyana', 600000, '2018-12-20'),
(11, 'Rohman/Taufik', 2500000, '2018-02-05'),
(12, 'iin Ujang', 150000, '2018-10-18'),
(13, 'Daday/Idid Handi', 200000, '2018-12-23'),
(14, 'H.D Tatang S', 500000, '2018-12-20'),
(15, 'Rohana', 2000000, '2018-12-18'),
(16, 'Toyiban', 2500000, '2016-09-10'),
(17, 'Onda', 3200000, '2018-12-16'),
(18, 'Imat', 0, '0000-00-00'),
(19, 'Wanah/Oyib', 0, '0000-00-00'),
(20, 'H.Nana Rubana', 0, '0000-00-00'),
(21, 'Oom/Odi', 10000000, '2018-11-18'),
(22, 'Hj. Iis Syafari', 0, '0000-00-00'),
(23, 'Ayi Komariah', 0, '0000-00-00'),
(24, 'Acah Suhaeti', 0, '0000-00-00'),
(25, 'Aan Aning K', 2250000, '2018-12-23'),
(26, 'sumarna', 1600000, '2018-12-23'),
(27, 'Emin/Nanda\r\n', 4000000, '2015-11-19'),
(28, 'Ias Kurniati\r\n', 2000000, '2018-12-23'),
(29, 'Entin Krisliani\r\n', 0, '0000-00-00'),
(30, 'Ani Mulyani\r\n', 0, '0000-00-00'),
(31, 'Samsudin', 1100000, '2018-11-15'),
(32, 'Cucun cahyati\r\n', 0, '0000-00-00'),
(33, 'Suma Wijaya', 1490000, '2012-07-24'),
(34, 'Amat', 1750000, '2018-12-23'),
(35, 'Ida/Yayat\r\n', 50000, '2014-01-17'),
(36, 'Heni/Udi', 3000000, '2018-11-23'),
(37, 'Isah\r\n', 400000, '2002-10-07'),
(38, 'Ain Oma\r\n', 2600000, '2018-09-12'),
(39, 'Iip Suminar\r\n', 20000, '2018-12-30'),
(40, 'Ikah\r\n', 220000, '2009-11-03'),
(41, 'Jaja Endeng\r\n', 400000, '2014-03-25'),
(42, 'Cucu Samsudin\r\n', 0, '0000-00-00'),
(43, 'Uun Nana\r\n', 150000, '2005-07-03'),
(44, 'Odah\r\n', 580000, '2016-12-12'),
(45, 'Ara Nining\r\n', 4200000, '2018-01-12'),
(46, 'Eceh / Yuyun\r\n', 2000000, '2016-12-22'),
(47, 'Oma Romansyah\r\n', 0, '0000-00-00'),
(48, 'Juhara\r\n', 500000, '2004-04-09'),
(49, 'Lili Uyun\r\n', 6300000, '2018-08-27'),
(50, 'Rohman Rani', 800000, '2011-07-06'),
(51, 'Oyin', 300000, '2015-07-23'),
(52, 'Rani Grani', 0, '0000-00-00'),
(53, 'Mimin Rukmini', 0, '0000-00-00'),
(54, 'Eutik', 450000, '2009-09-17'),
(55, 'Elis', 500000, '2006-06-12'),
(56, 'Cacah', 320000, '2003-07-07'),
(57, 'Oyoh/Suhaya', 460000, '2005-12-12'),
(58, 'Ana', 0, '0000-00-00'),
(59, 'Eem Adang', 1000000, '2016-01-07'),
(60, 'Undang Onon', 800000, '2013-09-28'),
(61, 'Tini ( Buniherang )', 540000, '2005-12-23'),
(62, 'Titi', 700000, '2014-06-13'),
(63, 'Teri', 800000, '2018-12-18'),
(64, 'Eem Emas', 4000000, '2018-12-23'),
(65, 'Nia/Endang', 200000, '2016-12-26'),
(66, 'Wawan Setiawan', 268000, '2008-12-14'),
(67, 'Irmayanti', 0, '0000-00-00'),
(68, 'Sahroma', 0, '0000-00-00'),
(69, 'Asep Turyana S', 0, '0000-00-00'),
(70, 'Ajat/Nia', 1500000, '2018-04-17'),
(71, 'Popon P', 2000000, '2018-12-23'),
(72, 'Yayat Hayat', 0, '0000-00-00'),
(73, 'Yanti Sumirat', 3200000, '2018-12-20'),
(74, 'Erat', 900000, '2017-10-07'),
(75, 'Tatang S', 0, '0000-00-00'),
(76, 'Ujun', 350000, '2017-07-25'),
(77, 'Eti Sumiati', 7000000, '2018-11-29'),
(78, 'Rita Sugiarto', 0, '0000-00-00'),
(79, 'Rohimah', 0, '0000-00-00'),
(80, 'Ayi Cacah', 3500000, '2018-12-14'),
(81, 'Akbar', 0, '0000-00-00'),
(82, 'Asep Suherman', 0, '0000-00-00'),
(83, 'Tini Aep', 250000, '2016-12-27'),
(84, 'Wawan Entat', 900000, '2010-05-05'),
(85, 'Tati Entat', 0, '0000-00-00'),
(86, 'Mukhtar', 0, '0000-00-00'),
(87, 'Ai Yoyoh', 0, '0000-00-00'),
(88, 'Finki Anjani', 2700000, '2018-12-23'),
(89, 'Atik', 1800000, '2013-09-29'),
(90, 'Nani Una', 2400000, '2019-12-16'),
(91, 'Ating S', 0, '0000-00-00'),
(92, 'Sukandi Hadiansyah', 5000000, '2018-12-20'),
(93, 'Renita', 0, '0000-00-00'),
(94, 'Nina Juliana', 3000000, '2018-12-23'),
(95, 'Eros', 1200000, '2018-12-23'),
(96, 'Embeb ( Taryana )', 3000000, '2018-12-23'),
(97, 'Wa Acih', 700000, '2018-12-23'),
(98, 'Atiq Rohimah', 0, '0000-00-00'),
(99, 'Alen Rohana', 0, '0000-00-00'),
(100, 'Finkan S', 2700000, '2018-12-23'),
(101, 'Duri', 0, '0000-00-00'),
(102, 'Iwan Iwok', 10000000, '2018-11-18'),
(103, 'Nani Uju', 600000, '2018-12-23'),
(104, 'Peni', 1400000, '2018-12-23'),
(105, 'Lili Uday', 0, '0000-00-00'),
(106, 'Anisa', 4000000, '2018-12-20'),
(107, 'N.Tantan', 400000, '2018-10-16'),
(108, 'Ayi Atep', 0, '0000-00-00'),
(109, 'Imas Edi', 2700000, '2018-12-23'),
(110, 'Cahya ( Endet )', 2000000, '2018-08-24'),
(111, 'Nina JKT', 2500000, '2018-12-20'),
(112, 'Uju M', 10000000, '2018-12-23'),
(113, 'Rika Amelia', 0, '0000-00-00'),
(114, 'Amarulloh', 0, '0000-00-00'),
(115, 'Yayah Dariah', 4500000, '2018-11-11'),
(116, 'Dani', 2800000, '2018-12-23'),
(117, 'Iyah', 2700000, '2018-12-23'),
(118, 'Ayun', 5000000, '2018-12-23'),
(119, 'Ai Dace', 500000, '2018-07-10'),
(120, 'Eva Hanivah', 0, '0000-00-00'),
(121, 'Euis', 1800000, '2017-02-21'),
(122, 'Yani', 0, '0000-00-00'),
(123, 'Bu Ini', 3000000, '2018-12-23'),
(124, 'Eni', 240000, '2017-06-29'),
(125, 'Bu Tita', 1250000, '2018-12-23'),
(126, 'Neni Juliani', 1500000, '2018-12-23'),
(127, 'Dadan', 4500000, '2018-05-16'),
(128, 'Uyun', 0, '0000-00-00'),
(129, 'Dede Yani', 100000, '0000-00-00'),
(130, 'Acin', 1600000, '2018-12-23'),
(131, 'Oom', 3000000, '2018-12-23'),
(132, 'Budi', 300000, '2018-12-23'),
(133, 'N Rika', 1400000, '2018-12-23'),
(134, 'Ai Nani', 1600000, '2018-12-23'),
(135, 'Santi', 0, '0000-00-00'),
(136, 'Hasan', 4000000, '2018-12-23'),
(137, 'Undang', 1500000, '2018-12-23'),
(138, 'Asep', 1200000, '2018-12-23'),
(139, 'Mugni Agnina', 0, '0000-00-00'),
(140, 'Nia', 0, '0000-00-00'),
(141, 'Atep', 0, '0000-00-00'),
(142, 'Neng Sari Yono', 3000000, '2018-07-17'),
(143, 'Siti Juariyah', 2700000, '2018-12-26'),
(144, 'Tati/Nyai Emi', 4300000, '2016-05-21'),
(145, 'wawat Waryati', 5000000, '2018-12-23'),
(146, 'Abdul Fatah', 0, '0000-00-00'),
(147, 'Yuyun', 6000000, '2018-11-12'),
(148, 'Soniangsih', 3000000, '2018-12-23'),
(149, 'Tuti Herawati', 0, '0000-00-00'),
(150, 'Ipit Pitri', 1400000, '2017-02-21'),
(151, 'Atep Rasid/ Karwati', 2500000, '2015-05-10'),
(152, 'Mastur', 500000, '2018-12-21'),
(153, 'Enung', 2250000, '0000-00-00'),
(154, 'Ai Hamidah', 2400000, '2017-01-12'),
(155, 'Mumuh', 1600000, '2018-12-23'),
(156, 'Dindin', 4500000, '0000-00-00'),
(157, 'Usman', 0, '0000-00-00'),
(158, 'Suhendi', 500000, '2018-12-26'),
(159, 'Wiwin', 1800000, '2018-12-23'),
(160, 'Yayat Cacah', 900000, '2018-02-12'),
(161, 'Titin', 0, '0000-00-00'),
(162, 'Neni Nuraeni', 800000, '2018-11-05'),
(163, 'Neng Anita', 0, '0000-00-00'),
(164, 'Endi Nita', 500000, '2018-12-23'),
(165, 'Ishak', 0, '0000-00-00'),
(166, 'Honijah', 0, '0000-00-00'),
(167, 'Enok', 0, '0000-00-00'),
(168, 'Upit', 1000000, '2018-12-23'),
(169, 'Pani', 0, '0000-00-00'),
(170, 'Yono', 0, '0000-00-00'),
(171, 'Neni N', 2100000, '2018-12-23'),
(172, 'Anita Pratiwi', 0, '0000-00-00'),
(173, 'Emas', 1600000, '2018-12-23'),
(174, 'Ipah Saripah', 2400000, '2018-12-23'),
(175, 'Epa Sapitri', 0, '0000-00-00'),
(176, 'Lina (Ira)', 0, '0000-00-00'),
(177, 'Ojat', 250000, '2007-03-30'),
(178, 'Neng Aep', 325000, '2018-12-23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_simpanan`
--

CREATE TABLE `tb_simpanan` (
  `id` int(11) NOT NULL,
  `jumlah` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_simpanan`
--

INSERT INTO `tb_simpanan` (`id`, `jumlah`) VALUES
(1, 5045000),
(2, 1741000),
(3, 871000),
(4, 1803000),
(5, 284000),
(6, 883000),
(7, 1273000),
(8, 948000),
(9, 598760),
(10, 196000),
(11, 801000),
(12, 1321000),
(13, 2455000),
(14, 1664000),
(15, 1991000),
(16, 326300),
(17, 1114000),
(18, 1712000),
(19, 6136000),
(20, 3107000),
(21, 890000),
(22, 1645000),
(23, 2720000),
(24, 5841000),
(25, 1517000),
(26, 1734000),
(27, 985000),
(28, 3049000),
(29, 3865000),
(30, 1660500),
(31, 690200),
(32, 3207000),
(33, 113000),
(34, 588000),
(35, 660700),
(36, 876000),
(37, 164000),
(38, 322600),
(39, 893000),
(40, 134000),
(41, 176000),
(42, 1778000),
(43, 68400),
(44, 148100),
(45, 1280000),
(46, 747000),
(47, 510000),
(48, 264000),
(49, 716000),
(50, 213700),
(51, 92500),
(52, 23000),
(53, 470000),
(54, 102000),
(55, 114000),
(56, 56000),
(57, 53000),
(58, 64000),
(59, 436000),
(60, 219500),
(61, 61000),
(62, 254000),
(63, 465000),
(64, 2206000),
(65, 26000),
(66, 77000),
(67, 228200),
(68, 2580000),
(69, 3112000),
(70, 505000),
(71, 2872000),
(72, 1105000),
(73, 2175000),
(74, 200000),
(75, 802000),
(76, 568000),
(77, 533600),
(78, 686000),
(79, 1322000),
(80, 2415000),
(81, 1635000),
(82, 884000),
(83, 180000),
(84, 60000),
(85, 215000),
(86, 98000),
(87, 3402000),
(88, 1113000),
(89, 313000),
(90, 1200000),
(91, 340000),
(92, 1345000),
(93, 1840000),
(94, 4203000),
(95, 4967000),
(96, 2265000),
(97, 4902000),
(98, 1505000),
(99, 2900000),
(100, 4627000),
(101, 1673000),
(102, 1949000),
(103, 1472000),
(104, 986000),
(105, 775000),
(106, 3520000),
(107, 962000),
(108, 2618000),
(109, 2735000),
(110, 2885000),
(111, 2908000),
(112, 2373000),
(113, 1034000),
(114, 1309000),
(115, 1704000),
(116, 2562000),
(117, 1790000),
(118, 1203000),
(119, 980000),
(120, 830000),
(121, 716000),
(122, 739000),
(123, 1126000),
(124, 2192000),
(125, 1183000),
(126, 1120000),
(127, 1988000),
(128, 150000),
(129, 551000),
(130, 1292000),
(131, 1346000),
(132, 1421000),
(133, 1962000),
(134, 2790000),
(135, 906000),
(136, 2260000),
(137, 1306000),
(138, 1902000),
(139, 3174000),
(140, 1700000),
(141, 1917000),
(142, 1198000),
(143, 1910000),
(144, 537000),
(145, 1130000),
(146, 1918000),
(147, 4598000),
(148, 1564000),
(149, 3190000),
(150, 970000),
(151, 550000),
(152, 2110000),
(153, 1084000),
(154, 759000),
(155, 1220000),
(156, 1230000),
(157, 570000),
(158, 366000),
(159, 1440000),
(160, 4504000),
(161, 867000),
(162, 1076000),
(163, 2260000),
(164, 990000),
(165, 2025000),
(166, 8320000),
(167, 600000),
(168, 660000),
(169, 624000),
(170, 1400000),
(171, 2678000),
(172, 370000),
(173, 294000),
(174, 286000),
(175, 1300000),
(176, 325000),
(177, 31600),
(178, 1183000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_subkriteria`
--

CREATE TABLE `tb_subkriteria` (
  `id` int(11) NOT NULL,
  `kode_kriteria` varchar(11) NOT NULL,
  `subkriteria` varchar(30) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_subkriteria`
--

INSERT INTO `tb_subkriteria` (`id`, `kode_kriteria`, `subkriteria`, `nilai`) VALUES
(1, 'K1', 'aktif', 50),
(2, 'K1', 'pasif', 10),
(3, 'K2', 'Tidak Ada', 50),
(4, 'K2', 'Ada', 10),
(5, 'K4', 'Modal Usaha', 50),
(6, 'K4', 'Berobat', 40),
(7, 'K4', 'Sekolah', 30),
(8, 'K4', 'Sembako', 20),
(9, 'K4', 'Hajatan', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(15) NOT NULL,
  `status` enum('aktif','pasif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `level`, `status`) VALUES
(1, 'Ajid', 'ajid', 'ketua', 'ketua', 'aktif'),
(2, 'Osin', 'osin', 'osin', 'anggota', 'aktif'),
(3, 'Awa/Elis', 'awa', 'awa', 'anggota', 'pasif'),
(4, 'Idar/Ilim', 'idar', 'anggota', 'anggota', 'aktif'),
(5, 'Uju', 'uju', 'anggota', 'anggota', 'aktif'),
(6, 'Dede Aga', 'dede', 'anggota', 'anggota', 'aktif'),
(7, 'Emuh', 'emuh', 'anggota', 'anggota', 'aktif'),
(8, 'Umeh/Ama', 'umeh', 'anggota', 'anggota', 'aktif'),
(9, 'Anes/Ono', 'anes', 'anggota', 'anggota', 'aktif'),
(10, 'Ipin Karyana', 'ipin', 'anggota', 'anggota', 'aktif'),
(11, 'Rohman/Taufik', 'rohman', 'anggota', 'anggota', 'aktif'),
(12, 'iin Ujang', 'iin', 'anggota', 'anggota', 'aktif'),
(13, 'Daday/Idid handi', 'daday', 'anggota', 'anggota', 'aktif'),
(14, 'H.D Tatang S', 'tatang', 'anggota', 'anggota', 'aktif'),
(15, 'Rohana', 'rohana', 'anggota', 'anggota', 'aktif'),
(16, 'Toyiban', 'toyiban', 'anggota', 'anggota', 'aktif'),
(17, 'Onda', 'onda', 'anggota', 'anggota', 'aktif'),
(18, 'Imat', 'imat', 'anggota', 'anggota', 'aktif'),
(19, 'Wanah/Oyib', 'wanah', 'anggota', 'anggota', 'aktif'),
(20, 'H. Nana Rubana', 'nana', 'pengawas', 'pengawas', 'aktif'),
(21, 'Oom/Odi', 'oom', 'anggota', 'anggota', 'aktif'),
(22, 'Hj. Iis Syafari', 'iis', 'anggota', 'anggota', 'aktif'),
(23, 'Ayi Komariah', 'ayi', 'anggota', 'anggota', 'aktif'),
(24, 'Acah Suhaeti', 'acah', 'anggota', 'anggota', 'aktif'),
(25, 'Aan Aning K', 'aan', 'anggota', 'anggota', 'aktif'),
(26, 'sumarna', 'sumarna', 'anggota', 'anggota', 'aktif'),
(27, 'Emin/Nanda', 'emin', 'anggota', 'anggota', 'aktif'),
(28, 'Ias Kurniati', 'ias', 'anggota', 'anggota', 'aktif'),
(29, 'Entin Krisliani', 'entin', 'anggota', 'anggota', 'aktif'),
(30, 'Ani Mulyani', 'ani', 'anggota', 'anggota', 'aktif'),
(31, 'Samsudin', 'samsusdin', 'anggota', 'anggota', 'aktif'),
(32, 'Cucun Cahyati', 'cucun', 'anggota', 'anggota', 'aktif'),
(33, 'Suma Wiajaya', 'suma', 'anggota', 'anggota', 'aktif'),
(34, 'Amat', 'amat', 'anggota', 'anggota', 'aktif'),
(35, 'Ida/Yayat', 'ida', 'anggota', 'anggota', 'aktif'),
(36, 'Heni/Udi', 'heni', 'anggota', 'anggota', 'aktif'),
(37, 'Isah', 'isah', 'anggota', 'anggota', 'aktif'),
(38, 'Ain Oma', 'ain', 'anggota', 'anggota', 'aktif'),
(39, 'Iip Suminar', 'iip', 'anggota', 'anggota', 'aktif'),
(40, 'Ikah', 'ikah', 'anggota', 'anggota', 'aktif'),
(41, 'Jaja Endeng', 'jaja', 'anggota', 'anggota', 'aktif'),
(42, 'Cucu Samsudin', 'cucu', 'anggota', 'anggota', 'aktif'),
(43, 'Uun Nana', 'uun', 'anggota', 'anggota', 'aktif'),
(44, 'Odah', 'odah', 'anggota', 'anggota', 'aktif'),
(45, 'Ara Nining', 'ara', 'anggota', 'anggota', 'aktif'),
(46, 'Eceh / Yuyun', 'eceh', 'anggota', 'anggota', 'aktif'),
(47, 'Oma Romansyah', 'oma', 'anggota', 'anggota', 'aktif'),
(48, 'Juhara', 'juhara', 'anggota', 'anggota', 'aktif'),
(49, 'Lili Uyun', 'liliuyun', 'anggota', 'anggota', 'aktif'),
(50, 'Rohman Rani', 'rohmanrani', 'anggota', 'anggota', 'aktif'),
(51, 'Oyin', 'oyin', 'anggota', 'anggota', 'aktif'),
(52, 'Rani Grani', 'ranigrani', 'anggota', 'anggota', 'aktif'),
(53, 'Mimin Rukmini', 'miminrukmini', 'anggota', 'anggota', 'aktif'),
(54, 'Eutik', 'eutik', 'anggota', 'anggota', 'aktif'),
(55, 'Elis', 'elis', 'anggota', 'anggota', 'aktif'),
(56, 'Cacah', 'cacah', 'anggota', 'anggota', 'aktif'),
(57, 'Oyoh/Suhaya', 'oyohsuhaya', 'anggota', 'anggota', 'aktif'),
(58, 'Ana', 'ana', 'anggota', 'anggota', 'aktif'),
(59, 'Eem Adang', 'eemadang', 'anggota', 'anggota', 'aktif'),
(60, 'Undang Onon', 'undangonon', 'anggota', 'anggota', 'aktif'),
(61, 'Tini ( Buniherang )', 'tinibuniherang', 'anggota', 'anggota', 'aktif'),
(62, 'Titi', 'titi', 'anggota', 'anggota', 'aktif'),
(63, 'Teri', 'teri', 'anggota', 'anggota', 'aktif'),
(64, 'Eem Emas', 'eememas', 'anggota', 'anggota', 'aktif'),
(65, 'Nia/Endang', 'niaendang', 'anggota', 'anggota', 'aktif'),
(66, 'Wawan Setiawan', 'wawansetiawan', 'anggota', 'anggota', 'aktif'),
(67, 'Irmayanti', 'irmayanti', 'anggota', 'anggota', 'aktif'),
(68, 'Sahroma', 'sahroma', 'anggota', 'anggota', 'aktif'),
(69, 'Asep Turyana S', 'asepturyana', 'anggota', 'anggota', 'aktif'),
(70, 'Ajat/Nia', 'ajatnia', 'anggota', 'anggota', 'aktif'),
(71, 'Popon P', 'popon', 'petugas', 'petugas', 'aktif'),
(72, 'Yayat Hayat', 'yayathayat', 'anggota', 'anggota', 'aktif'),
(73, 'Yanti Sumirat', 'yantisumirat', 'anggota', 'anggota', 'aktif'),
(74, 'Erat', 'erat', 'anggota', 'anggota', 'aktif'),
(75, 'Tatang S', 'tatangs', 'anggota', 'anggota', 'aktif'),
(76, 'Ujun', 'ujun', 'anggota', 'anggota', 'aktif'),
(77, 'Eti Sumiati', 'etisumiati', 'anggota', 'anggota', 'aktif'),
(78, 'Rita Sugiarto', 'ritasugiarto', 'anggota', 'anggota', 'aktif'),
(79, 'Rohimah', 'rohimah', 'anggota', 'anggota', 'aktif'),
(80, 'Ayi Cacah', 'ayicacah', 'anggota', 'anggota', 'aktif'),
(81, 'Akbar', 'akbar', 'anggota', 'anggota', 'aktif'),
(82, 'Asep Suherman', 'asepsuherman', 'anggota', 'anggota', 'aktif'),
(83, 'Tini Aep', 'tiniaep', 'anggota', 'anggota', 'aktif'),
(84, 'Wawan Entat', 'wawanentat', 'anggota', 'anggota', 'aktif'),
(85, 'Tati Entat', 'tatientat', 'anggota', 'anggota', 'aktif'),
(86, 'Mukhtar', 'mukhtar', 'anggota', 'anggota', 'aktif'),
(87, 'Ai Yoyoh ', 'aiyoyoh', 'anggota', 'anggota', 'aktif'),
(88, 'Finki Anjani', 'finkianjani', 'anggota', 'anggota', 'aktif'),
(89, 'Atik', 'atik', 'anggota', 'anggota', 'aktif'),
(90, 'Nani Una', 'naniuna', 'anggota', 'anggota', 'aktif'),
(91, 'Ating S', 'atings', 'anggota', 'anggota', 'aktif'),
(92, 'Sukandi Hadiansyah', 'sukandi', 'anggota', 'anggota', 'aktif'),
(93, 'Renita', 'renita', 'anggota', 'anggota', 'aktif'),
(94, 'Nina Juliana', 'ninajuliana', 'anggota', 'anggota', 'aktif'),
(95, 'Eros', 'eros', 'anggota', 'anggota', 'aktif'),
(96, 'Embeb ( Taryana )', 'embeb', 'anggota', 'anggota', 'aktif'),
(97, 'Wa Acih', 'waacih', 'anggota', 'anggota', 'aktif'),
(98, 'Atiq Rohimah', 'atiqrohimah', 'anggota', 'anggota', 'aktif'),
(99, 'Alen Rohana', 'alenrohana', 'anggota', 'anggota', 'aktif'),
(100, 'Finkan S', 'finkans', 'anggota', 'anggota', 'aktif'),
(101, 'Duri', 'duri', 'anggota', 'anggota', 'aktif'),
(102, 'Iwan Iwok', 'iwaniwok', 'anggota', 'anggota', 'aktif'),
(103, 'Nani Uju', 'naniuju', 'anggota', 'anggota', 'aktif'),
(104, 'Peni', 'peni', 'anggota', 'anggota', 'aktif'),
(105, 'Lili Uday', 'liliuday', 'anggota', 'anggota', 'aktif'),
(106, 'Anisa', 'anisa', 'anggota', 'anggota', 'aktif'),
(107, 'N. Tantan', 'ntantan', 'anggota', 'anggota', 'aktif'),
(108, 'Ayi Atep', 'ayiatep', 'anggota', 'anggota', 'aktif'),
(109, 'Imas Edi', 'imasedi', 'anggota', 'anggota', 'aktif'),
(110, 'Cahya ( Endet )', 'cahyaendet', 'anggota', 'anggota', 'aktif'),
(111, 'Nina JKT', 'ninajkt', 'anggota', 'anggota', 'aktif'),
(112, 'Uju M', 'ujum', 'anggota', 'anggota', 'aktif'),
(113, 'Rika Amelia', 'rikaamelia', 'anggota', 'anggota', 'aktif'),
(114, 'Amarulloh', 'amarulloh', 'anggota', 'anggota', 'aktif'),
(115, 'Yayah Dariah', 'yayahdariah', 'anggota', 'anggota', 'aktif'),
(116, 'Dani', 'dani', 'anggota', 'anggota', 'aktif'),
(117, 'Iyah', 'iyah', 'anggota', 'anggota', 'aktif'),
(118, 'Ayun', 'ayun', 'anggota', 'anggota', 'aktif'),
(119, 'Ai Dace', 'aidace', 'anggota', 'anggota', 'aktif'),
(120, 'Eva Hanivah', 'evahanivah', 'anggota', 'anggota', 'aktif'),
(121, 'Euis', 'euis', 'anggota', 'anggota', 'aktif'),
(122, 'Yani', 'yani', 'anggota', 'anggota', 'aktif'),
(123, 'Bu Ini', 'buini', 'anggota', 'anggota', 'aktif'),
(124, 'Eni', 'eni', 'anggota', 'anggota', 'aktif'),
(125, 'Bu Tita', 'Bu Tita', 'anggota', 'anggota', 'aktif'),
(126, 'Neni Juliani', 'nenijuliani', 'anggota', 'anggota', 'aktif'),
(127, 'Dadan', 'dadan', 'anggota', 'anggota', 'aktif'),
(128, 'Uyun', 'uyun', 'anggota', 'anggota', 'aktif'),
(129, 'Dede Yani', 'dedeyani', 'anggota', 'anggota', 'aktif'),
(130, 'Acin', 'acin', 'anggota', 'anggota', 'aktif'),
(131, 'Oom', 'oom', 'anggota', 'anggota', 'aktif'),
(132, 'Budi', 'budi', 'anggota', 'anggota', 'aktif'),
(133, 'N Rika', 'nrika', 'anggota', 'anggota', 'aktif'),
(134, 'Ai Nani', 'ainani', 'anggota', 'anggota', 'aktif'),
(135, 'Santi', 'santi', 'anggota', 'anggota', 'aktif'),
(136, 'Hasan', 'hasan', 'anggota', 'anggota', 'aktif'),
(137, 'Undang', 'undang', 'anggota', 'anggota', 'aktif'),
(138, 'Asep', 'asep', 'anggota', 'anggota', 'aktif'),
(139, 'Mugni Agnina', 'mugniagnina', 'anggota', 'anggota', 'aktif'),
(140, 'Nia', 'nia', 'anggota', 'anggota', 'aktif'),
(141, 'Atep', 'atep', 'anggota', 'anggota', 'aktif'),
(142, 'Neng Sari Yono', 'nengsari', 'anggota', 'anggota', 'aktif'),
(143, 'Siti Juariyah', 'sitijuariyah', 'anggota', 'anggota', 'aktif'),
(144, 'Tati/Nyai Emi', 'tatinyai', 'anggota', 'anggota', 'aktif'),
(145, 'wawat Waryati', 'wawatwar', 'anggota', 'anggota', 'aktif'),
(146, 'Abdul Fatah', 'abdulfatah', 'anggota', 'anggota', 'aktif'),
(147, 'Yuyun', 'yuyun', 'anggota', 'anggota', 'aktif'),
(148, 'Soniangsih', 'soniangsih', 'anggota', 'anggota', 'aktif'),
(149, 'Tuti Herawati', 'tutiherawati', 'anggota', 'anggota', 'aktif'),
(150, 'Ipit Pitri', 'ipitpitri', 'anggota', 'anggota', 'aktif'),
(151, 'Atep Rasid/Karwati', 'ateprasid', 'anggota', 'anggota', 'aktif'),
(152, 'Mastur', 'mastur', 'anggota', 'anggota', 'aktif'),
(153, 'Enung', 'enung', 'anggota', 'anggota', 'aktif'),
(154, 'Ai Hamidah', 'aihamidah', 'anggota', 'anggota', 'aktif'),
(155, 'Mumuh', 'mumuh', 'anggota', 'anggota', 'aktif'),
(156, 'Dindin', 'dindin', 'anggota', 'anggota', 'aktif'),
(157, 'Usman', 'usman', 'anggota', 'anggota', 'aktif'),
(158, 'Suhendi', 'suhendi', 'anggota', 'anggota', 'aktif'),
(159, 'Wiwin', 'wiwin', 'anggota', 'anggota', 'aktif'),
(160, 'Yayat Cacah', 'yayatcacah', 'anggota', 'anggota', 'aktif'),
(161, 'Titin', 'titin', 'anggota', 'anggota', 'aktif'),
(162, 'Neni Nuraeni', 'neninuraeni', 'anggota', 'anggota', 'aktif'),
(163, 'Neng Anita', 'nenganita', 'anggota', 'anggota', 'aktif'),
(164, 'Endi Nita', 'endinita', 'anggota', 'anggota', 'aktif'),
(165, 'Ishak', 'ishak', 'anggota', 'anggota', 'aktif'),
(166, 'Honijah', 'honijah', 'anggota', 'anggota', 'aktif'),
(167, 'Enok', 'enok', 'anggota', 'anggota', 'aktif'),
(168, 'Upit', 'upit', 'anggota', 'anggota', 'aktif'),
(169, 'Pani', 'pani', 'anggota', 'anggota', 'aktif'),
(170, 'Yono', 'yono', 'anggota', 'anggota', 'aktif'),
(171, 'Neni N', 'nenin', 'anggota', 'anggota', 'aktif'),
(172, 'Anita Pratiwi', 'anitapratiwi', 'anggota', 'anggota', 'aktif'),
(173, 'Emas', 'emas', 'anggota', 'anggota', 'aktif'),
(174, 'Ipah Saripah', 'ipahsaripah', 'anggota', 'anggota', 'aktif'),
(175, 'Epa Sapitri', 'epasapitri', 'anggota', 'anggota', 'aktif'),
(176, 'Lina (Ira)', 'linaira', 'anggota', 'anggota', 'aktif'),
(177, 'Ojat', 'ojat', 'anggota', 'anggota', 'aktif'),
(178, 'Neng Aep', 'Nengaep', 'anggota', 'anggota', 'aktif');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_pengajuan`
--
ALTER TABLE `tb_pengajuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_pinjaman`
--
ALTER TABLE `tb_pinjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_simpanan`
--
ALTER TABLE `tb_simpanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_subkriteria`
--
ALTER TABLE `tb_subkriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_pengajuan`
--
ALTER TABLE `tb_pengajuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_pinjaman`
--
ALTER TABLE `tb_pinjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT untuk tabel `tb_simpanan`
--
ALTER TABLE `tb_simpanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT untuk tabel `tb_subkriteria`
--
ALTER TABLE `tb_subkriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
