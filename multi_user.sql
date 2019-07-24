-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jul 2019 pada 02.01
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
(4, 3, 300000, 'aktif', 'Tidak Ada', 'Sekolah', '5', '2019-07-23', NULL);

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
(1, 'Ajid', 0, '0000-00-00'),
(2, 'Osin', 600000, '2018-03-12'),
(3, 'Idar', 0, '0000-00-00'),
(4, 'Uju', 0, '0000-00-00'),
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

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_simpanan`
--

CREATE TABLE `tb_simpanan` (
  `id_anggota` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `simpanan_pokok` float NOT NULL,
  `simpanan_wajib` float NOT NULL,
  `simpanan_sukarela` float NOT NULL,
  `jumlah` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_simpanan`
--

INSERT INTO `tb_simpanan` (`id_anggota`, `nama`, `simpanan_pokok`, `simpanan_wajib`, `simpanan_sukarela`, `jumlah`) VALUES
(1, 'Ajid', 5000, 1689000, 3351000, 5045000),
(2, 'Osin', 5000, 862000, 874000, 1741000),
(3, 'Idar/Ilim', 5000, 999000, 799000, 1893000),
(4, 'Uju', 5000, 279000, 0, 284000),
(5, 'Dede Aga', 5000, 668000, 210000, 883000),
(6, 'Emuh', 5000, 495000, 773000, 1273000),
(7, 'Ojat', 0, 0, 0, 871000),
(8, 'Awa', 0, 0, 0, 948000),
(9, 'Umeh', 0, 0, 0, 598760),
(10, 'Anes', 0, 0, 0, 196000),
(11, 'Ipin', 0, 0, 0, 801000),
(12, 'rohman', 0, 0, 0, 0),
(13, 'iin', 0, 0, 0, 0),
(14, 'Daday', 0, 0, 0, 0),
(15, 'H.D Tatang S', 0, 0, 0, 0),
(16, 'rohana', 0, 0, 0, 0),
(17, 'Toyiban', 0, 0, 0, 0),
(18, 'onda', 0, 0, 0, 0),
(19, 'imat', 0, 0, 0, 0),
(20, 'Wanah', 0, 0, 0, 0),
(21, 'H.Nana Rubana', 0, 0, 0, 0),
(22, 'Oom', 0, 0, 0, 0),
(23, 'Hj. Iis Syafari', 0, 0, 0, 0),
(24, 'Ayi Komariah', 0, 0, 0, 0),
(25, 'Acah Suhaeti', 0, 0, 0, 0),
(26, 'Aan Aning K', 0, 0, 0, 0),
(27, 'sumarna', 0, 0, 0, 0),
(28, 'Emin/Nanda', 0, 0, 0, 0),
(29, 'Ias Kurniati', 0, 0, 0, 0),
(30, 'Entin Krisliani', 0, 0, 0, 0),
(31, 'Ani Mulyani', 0, 0, 0, 0),
(32, 'Samsudin', 0, 0, 0, 0),
(33, 'Cucun Cahyati', 0, 0, 0, 0),
(34, 'Suma Wijaya', 0, 0, 0, 0),
(35, 'Amat', 0, 0, 0, 0),
(36, 'Ida/Yayat', 0, 0, 0, 0),
(37, 'Heni/Udi', 0, 0, 0, 0),
(38, 'Isah', 0, 0, 0, 0),
(39, 'Ain Oma', 0, 0, 0, 0),
(40, 'Iip Suminar', 0, 0, 0, 0),
(41, 'Ikah', 0, 0, 0, 0),
(42, 'Jaja Endang', 0, 0, 0, 0),
(43, 'Cucu Samsudin', 0, 0, 0, 0),
(44, 'Uun Nana', 0, 0, 0, 0),
(45, 'Odah', 0, 0, 0, 0),
(46, 'Ara Nining', 0, 0, 0, 0),
(47, 'Eceh / Yuyun', 0, 0, 0, 0),
(48, 'Oma Romansyah', 0, 0, 0, 0),
(49, 'Juhara', 0, 0, 0, 0),
(50, 'Lili Uyun', 0, 0, 0, 0),
(51, 'Rohman Rani', 0, 0, 0, 0),
(52, 'Oyin', 0, 0, 0, 0),
(53, 'Rani Grani', 0, 0, 0, 0),
(54, 'Mimin Rukmini', 0, 0, 0, 0),
(55, 'Eutik', 0, 0, 0, 0),
(56, 'Elis', 0, 0, 0, 0),
(57, 'Cacah', 0, 0, 0, 0),
(58, 'Oyoh/ Suhaya', 0, 0, 0, 0),
(59, 'Ana', 0, 0, 0, 0),
(60, 'Eem Adang', 0, 0, 0, 0),
(61, 'Undang Onon', 0, 0, 0, 0),
(62, 'Tini (Buniherang)', 0, 0, 0, 0),
(63, 'Titi', 0, 0, 0, 0),
(64, 'Teri', 0, 0, 0, 0),
(65, 'Eem Emas', 0, 0, 0, 0),
(66, 'Nia/Endang', 0, 0, 0, 0),
(67, 'Wawan Setiawan', 0, 0, 0, 0),
(68, 'Irmayanti', 0, 0, 0, 0),
(69, 'Sahroma', 0, 0, 0, 0),
(70, 'Asep Turyana', 0, 0, 0, 0),
(71, 'Ajat/Nia', 0, 0, 0, 0),
(72, 'Popon P', 0, 0, 0, 0),
(73, 'Yayat Hayat', 0, 0, 0, 0),
(74, 'Yanti Sumirat', 0, 0, 0, 0),
(75, 'Erat', 0, 0, 0, 0),
(76, 'Tatang S', 0, 0, 0, 0),
(77, 'Ujun', 0, 0, 0, 0),
(78, 'Eti Sumiati', 0, 0, 0, 0),
(79, 'Rita Sugiarto', 0, 0, 0, 0),
(80, 'Rohimah', 0, 0, 0, 0),
(81, 'Ayi Cacah', 0, 0, 0, 0),
(82, 'Akbar', 0, 0, 0, 0),
(83, 'Asep Suherman', 0, 0, 0, 0),
(84, 'Tini Aep', 0, 0, 0, 0),
(85, 'Wawan Entat', 0, 0, 0, 0),
(86, 'Tati Entat', 0, 0, 0, 0),
(87, 'Mukhtar', 0, 0, 0, 0),
(88, 'Ai Yoyoh', 0, 0, 0, 0),
(89, 'Finki Anjani', 0, 0, 0, 0),
(90, 'Atik', 0, 0, 0, 0),
(91, 'Nani Una', 0, 0, 0, 0),
(92, 'Ating S', 0, 0, 0, 0),
(93, 'Sukandi Hadiansyah', 0, 0, 0, 0),
(94, 'Renita', 0, 0, 0, 0),
(95, 'Nina Juliana', 0, 0, 0, 0),
(96, 'Eros', 0, 0, 0, 0),
(97, 'Embeb ( Taryana )', 0, 0, 0, 0),
(98, 'Wa Acih', 0, 0, 0, 0),
(99, 'Atiq Rohimah', 0, 0, 0, 0),
(100, 'Alen Rohana', 0, 0, 0, 0),
(101, 'Finkan S', 0, 0, 0, 0),
(102, 'Duri', 0, 0, 0, 0),
(103, 'Iwan Iwok', 0, 0, 0, 0),
(104, 'Nani Uju', 0, 0, 0, 0),
(105, 'Peni', 0, 0, 0, 0),
(106, 'Lili Uday', 0, 0, 0, 0),
(107, 'Anisa', 0, 0, 0, 0),
(108, 'N. Tantan', 0, 0, 0, 0),
(109, 'Ayi Atep', 0, 0, 0, 0),
(110, 'Imas Edi', 0, 0, 0, 0),
(111, 'Cahya ( Endet )', 0, 0, 0, 0),
(112, 'Nina JKT', 0, 0, 0, 0),
(113, 'Uju M', 0, 0, 0, 0),
(114, 'Rika Amelia', 0, 0, 0, 0),
(115, 'Amarulloh', 0, 0, 0, 0),
(116, 'Yayah Dariah', 0, 0, 0, 0),
(117, 'Dani', 0, 0, 0, 0),
(118, 'Iyah', 0, 0, 0, 0),
(119, 'Ayun', 0, 0, 0, 0),
(120, 'Ai Dace', 0, 0, 0, 0),
(121, 'Eva Hanivah', 0, 0, 0, 0),
(122, 'Euis', 0, 0, 0, 0),
(123, 'Yani', 0, 0, 0, 0),
(124, 'Bu Ini', 0, 0, 0, 0),
(125, 'Eni', 0, 0, 0, 0),
(126, 'Bu Tita', 0, 0, 0, 0),
(127, 'Neng Aep', 0, 0, 0, 0),
(128, 'Neni Juliani', 0, 0, 0, 0),
(129, 'Dadan', 0, 0, 0, 0),
(130, 'Uyun', 0, 0, 0, 0),
(131, 'Dede Yani', 0, 0, 0, 0),
(132, 'Acin', 0, 0, 0, 0),
(133, 'Oom', 0, 0, 0, 0),
(134, 'Budi', 0, 0, 0, 0),
(135, 'N Rika', 0, 0, 0, 0),
(136, 'Ai Nani', 0, 0, 0, 0),
(137, 'Santi', 0, 0, 0, 0),
(138, 'Hasan', 0, 0, 0, 0),
(139, 'Undang', 0, 0, 0, 0),
(140, 'Asep', 0, 0, 0, 0),
(141, 'Mugni Agnina', 0, 0, 0, 0),
(142, 'Nia', 0, 0, 0, 0),
(143, 'Atep', 0, 0, 0, 0),
(144, 'Neng sari Yono', 0, 0, 0, 0),
(145, 'Siti Juariyah', 0, 0, 0, 0),
(146, 'Tati/Nyai Emi', 0, 0, 0, 0),
(147, 'Wawat Waryati', 0, 0, 0, 0),
(148, 'Abdul Fatah', 0, 0, 0, 0),
(149, 'Yuyun', 0, 0, 0, 0),
(150, 'Soniangsih', 0, 0, 0, 0),
(151, 'Tuti Herawati', 0, 0, 0, 0),
(152, 'Ipit Pitri', 0, 0, 0, 0),
(153, 'Atep Rasid/Kaerwati\r\n', 0, 0, 0, 0),
(154, 'Mastur', 0, 0, 0, 0),
(155, 'Enung', 0, 0, 0, 0),
(156, 'Ai Hamidah', 0, 0, 0, 0),
(157, 'Mumuh', 0, 0, 0, 0),
(158, 'Dindin', 0, 0, 0, 0),
(159, 'Usman', 0, 0, 0, 0),
(160, 'Suhendi', 0, 0, 0, 0),
(161, 'Wiwin', 0, 0, 0, 0),
(162, 'Yayat Cacah', 0, 0, 0, 0),
(163, 'Titin', 0, 0, 0, 0),
(164, 'Neni Nuraeni', 0, 0, 0, 0),
(165, 'Neng Anita', 0, 0, 0, 0),
(166, 'Endi Nita', 0, 0, 0, 0),
(167, 'Ishak', 0, 0, 0, 0),
(168, 'Honijah', 0, 0, 0, 0),
(169, 'Enok', 0, 0, 0, 0),
(170, 'Upit', 0, 0, 0, 0),
(171, 'Pani', 0, 0, 0, 0),
(172, 'Yono', 0, 0, 0, 0),
(173, 'Neni N', 0, 0, 0, 0),
(174, 'Anita Pratiwi', 0, 0, 0, 0),
(175, 'Emas', 0, 0, 0, 0),
(176, 'Ipah Saripah', 0, 0, 0, 0),
(177, 'Epa Sapitri', 0, 0, 0, 0),
(178, 'Lina (Ira)', 0, 0, 0, 0);

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
(1, 'finki anjani', 'finki', '9697', 'petugas', 'aktif'),
(2, 'Osin', 'osin', 'osin', 'anggota', 'aktif'),
(3, 'Finkan Sukma', 'finkan', '1803', 'anggota', 'aktif'),
(5, 'fatimah ulwiyatul badriyah', 'fatimah', '3107', 'pengawas', 'aktif'),
(8, 'Awa', 'awa', 'awa', 'anggota', 'pasif'),
(9, 'Ajid', 'ajid', 'anggota', 'anggota', 'aktif'),
(10, 'Idar', 'idar', 'anggota', 'anggota', 'aktif'),
(11, 'Uju', 'uju', 'anggota', 'anggota', 'aktif'),
(12, 'Dede Aga', 'dede', 'anggota', 'anggota', 'aktif'),
(13, 'Emuh', 'emuh', 'anggota', 'anggota', 'aktif'),
(14, 'Umeh', 'umeh', 'anggota', 'anggota', 'aktif'),
(15, 'Anes', 'anes', 'anggota', 'anggota', 'aktif'),
(16, 'Ipin', 'ipin', 'anggota', 'anggota', 'aktif'),
(17, 'Rohman', 'rohman', 'anggota', 'anggota', 'aktif'),
(18, 'iin', 'iin', 'anggota', 'anggota', 'aktif'),
(19, 'Daday', 'daday', 'anggota', 'anggota', 'aktif'),
(20, 'H.D Tatang S', 'tatang', 'anggota', 'anggota', 'aktif'),
(21, 'rohana', 'rohana', 'anggota', 'anggota', 'aktif'),
(22, 'Toyiban', 'toyiban', 'anggota', 'anggota', 'aktif'),
(23, 'onda', 'onda', 'anggota', 'anggota', 'aktif'),
(24, 'imat', 'imat', 'anggota', 'anggota', 'aktif'),
(25, 'Wanah', 'wanah', 'anggota', 'anggota', 'aktif'),
(26, 'H. Nana Rubana', 'nana', 'anggota', 'anggota', 'aktif'),
(27, 'Oom', 'oom', 'anggota', 'anggota', 'aktif'),
(28, 'Hj. Iis Syafari', 'iis', 'anggota', 'anggota', 'aktif'),
(29, 'Ayi Komariah', 'ayi', 'anggota', 'anggota', 'aktif'),
(30, 'Acah Suhaeti', 'acah', 'anggota', 'anggota', 'aktif'),
(31, 'Aan Aning K', 'aan', 'anggota', 'anggota', 'aktif'),
(32, 'sumarna', 'sumarna', 'anggota', 'anggota', 'aktif'),
(33, 'Emin/Nanda', 'emin', 'anggota', 'anggota', 'aktif'),
(34, 'Ias Kurniati', 'ias', 'anggota', 'anggota', 'aktif'),
(35, 'Entin Krisliani', 'entin', 'anggota', 'anggota', 'aktif'),
(36, 'Ani Mulyani', 'ani', 'anggota', 'anggota', 'aktif'),
(37, 'Samsudin', 'samsusdin', 'anggota', 'anggota', 'aktif'),
(38, 'Cucun Cahyati', 'cucun', 'anggota', 'anggota', 'aktif'),
(39, 'Suma Wiajaya', 'suma', 'anggota', 'anggota', 'aktif'),
(40, 'Amat', 'amat', 'anggota', 'anggota', 'aktif'),
(41, 'Ida/Yayat', 'ida', 'anggota', 'anggota', 'aktif'),
(42, 'Heni/Udi', 'heni', 'anggota', 'anggota', 'aktif'),
(43, 'Isah', 'isah', 'anggota', 'anggota', 'aktif'),
(44, 'Ain Oma', 'ain', 'anggota', 'anggota', 'aktif'),
(45, 'Iip Suminar', 'iip', 'anggota', 'anggota', 'aktif'),
(46, 'Ikah', 'ikah', 'anggota', 'anggota', 'aktif'),
(47, 'Jaja Endeng', 'jaja', 'anggota', 'anggota', 'aktif'),
(48, 'Cucu Samsudin', 'cucu', 'anggota', 'anggota', 'aktif'),
(49, 'Uun Nana', 'uun', 'anggota', 'anggota', 'aktif'),
(50, 'Odah', 'odah', 'anggota', 'anggota', 'aktif'),
(51, 'Ara Nining', 'ara', 'anggota', 'anggota', 'aktif'),
(52, 'Eceh / Yuyun', 'eceh', 'anggota', 'anggota', 'aktif'),
(53, 'Oma Romansyah', 'oma', 'anggota', 'anggota', 'aktif'),
(54, 'Juhara', 'juhara', 'anggota', 'anggota', 'aktif'),
(55, 'Lili Uyun', 'liliuyun', 'anggota', 'anggota', 'aktif'),
(56, 'Rohman Rani', 'rohmanrani', 'anggota', 'anggota', 'aktif'),
(57, 'Oyin', 'oyin', 'anggota', 'anggota', 'aktif'),
(58, 'Rani Grani', 'ranigrani', 'anggota', 'anggota', 'aktif'),
(59, 'Mimin Rukmini', 'miminrukmini', 'anggota', 'anggota', 'aktif'),
(60, 'Eutik', 'eutik', 'anggota', 'anggota', 'aktif'),
(61, 'Elis', 'elis', 'anggota', 'anggota', 'aktif'),
(62, 'Cacah', 'cacah', 'anggota', 'anggota', 'aktif'),
(63, 'Oyoh/Suhaya', 'oyohsuhaya', 'anggota', 'anggota', 'aktif'),
(64, 'Ana', 'ana', 'anggota', 'anggota', 'aktif'),
(65, 'Eem Adang', 'eemadang', 'anggota', 'anggota', 'aktif'),
(66, 'Undang Onon', 'undangonon', 'anggota', 'anggota', 'aktif'),
(67, 'Tini ( Buniherang )', 'tinibuniherang', 'anggota', 'anggota', 'aktif'),
(68, 'Titi', 'titi', 'anggota', 'anggota', 'aktif'),
(69, 'Teri', 'teri', 'anggota', 'anggota', 'aktif'),
(70, 'Eem Emas', 'eememas', 'anggota', 'anggota', 'aktif'),
(71, 'Nia/Endang', 'niaendang', 'anggota', 'anggota', 'aktif'),
(72, 'Wawan Setiawan', 'wawansetiawan', 'anggota', 'anggota', 'aktif'),
(73, 'Irmayanti', 'irmayanti', 'anggota', 'anggota', 'aktif'),
(74, 'Sahroma', 'sahroma', 'anggota', 'anggota', 'aktif'),
(75, 'Asep Turyana S', 'asepturyana', 'anggota', 'anggota', 'aktif'),
(76, 'Ajat/Nia', 'ajatnia', 'anggota', 'anggota', 'aktif'),
(77, 'Popon P', 'popon', 'anggota', 'anggota', 'aktif'),
(78, 'Yayat Hayat', 'yayathayat', 'anggota', 'anggota', 'aktif'),
(79, 'Yanti Sumirat', 'yantisumirat', 'anggota', 'anggota', 'aktif'),
(80, 'Erat', 'erat', 'anggota', 'anggota', 'aktif'),
(81, 'Tatang S', 'tatangs', 'anggota', 'anggota', 'aktif'),
(82, 'Ujun', 'ujun', 'anggota', 'anggota', 'aktif'),
(83, 'Eti Sumiati', 'etisumiati', 'anggota', 'anggota', 'aktif'),
(84, 'Rita Sugiarto', 'ritasugiarto', 'anggota', 'anggota', 'aktif'),
(85, 'Rohimah', 'rohimah', 'anggota', 'anggota', 'aktif'),
(86, 'Ayi Cacah', 'ayicacah', 'anggota', 'anggota', 'aktif'),
(87, 'Akbar', 'akbar', 'anggota', 'anggota', 'aktif'),
(88, 'Asep Suherman', 'asepsuherman', 'anggota', 'anggota', 'aktif'),
(89, 'Tini Aep', 'tiniaep', 'anggota', 'anggota', 'aktif'),
(90, 'Wawan Entat', 'wawanentat', 'anggota', 'anggota', 'aktif'),
(91, 'Tati Entat', 'tatientat', 'anggota', 'anggota', 'aktif'),
(92, 'Rita Suiarto', 'ritasugiarto', 'anggota', 'anggota', 'aktif'),
(93, 'Mukhtar', 'mukhtar', 'anggota', 'anggota', 'aktif'),
(94, 'Ai Yoyoh ', 'aiyoyoh', 'anggota', 'anggota', 'aktif'),
(95, 'Finki Anjani', 'finkianjani', 'anggota', 'anggota', 'aktif'),
(96, 'Atik', 'atik', 'anggota', 'anggota', 'aktif'),
(97, 'Nani Una', 'naniuna', 'anggota', 'anggota', 'aktif'),
(98, 'Ating S', 'atings', 'anggota', 'anggota', 'aktif'),
(99, 'Sukandi Hadiansyah', 'sukandi', 'anggota', 'anggota', 'aktif'),
(100, 'Renita', 'renita', 'anggota', 'anggota', 'aktif'),
(101, 'Nina Juliana', 'ninajuliana', 'anggota', 'anggota', 'aktif'),
(102, 'Eros', 'eros', 'anggota', 'anggota', 'aktif'),
(103, 'Embeb ( Taryana )', 'embeb', 'anggota', 'anggota', 'aktif'),
(104, 'Wa Acih', 'waacih', 'anggota', 'anggota', 'aktif'),
(105, 'Atiq Rohimah', 'atiqrohimah', 'anggota', 'anggota', 'aktif'),
(106, 'Alen Rohana', 'alenrohana', 'anggota', 'anggota', 'aktif'),
(107, 'Finkan S', 'finkans', 'anggota', 'anggota', 'aktif'),
(108, 'Duri', 'duri', 'anggota', 'anggota', 'aktif'),
(109, 'Iwqan Iwok', 'iwaniwok', 'anggota', 'anggota', 'aktif'),
(110, 'Nani Uju', 'naniuju', 'anggota', 'anggota', 'aktif'),
(111, 'Peni', 'peni', 'anggota', 'anggota', 'aktif'),
(112, 'Lili Uday', 'liliuday', 'anggota', 'anggota', 'aktif'),
(113, 'Anisa', 'anisa', 'anggota', 'anggota', 'aktif'),
(114, 'N. Tantan', 'ntantan', 'anggota', 'anggota', 'aktif'),
(115, 'Ayi Atep', 'ayiatep', 'anggota', 'anggota', 'aktif'),
(116, 'Imas Edi', 'imasedi', 'anggota', 'anggota', 'aktif'),
(117, 'Cahya ( Endet )', 'cahyaendet', 'anggota', 'anggota', 'aktif'),
(118, 'Nina JKT', 'ninajkt', 'anggota', 'anggota', 'aktif'),
(119, 'Uju M', 'ujum', 'anggota', 'anggota', 'aktif'),
(120, 'Rika Amelia', 'rikaamelia', 'anggota', 'anggota', 'aktif'),
(121, 'Amarulloh', 'amarulloh', 'anggota', 'anggota', 'aktif'),
(122, 'Yayah Dariah', 'yayahdariah', 'anggota', 'anggota', 'aktif'),
(123, 'Dani', 'dani', 'anggota', 'anggota', 'aktif'),
(124, 'Iyah', 'iyah', 'anggota', 'anggota', 'aktif'),
(125, 'Ayun', 'ayun', 'anggota', 'anggota', 'aktif'),
(126, 'Ai Dace', 'aidace', 'anggota', 'anggota', 'aktif'),
(127, 'Eva Hanivah', 'evahanivah', 'anggota', 'anggota', 'aktif'),
(128, 'Euis', 'euis', 'anggota', 'anggota', 'aktif'),
(129, 'Yani', 'yani', 'anggota', 'anggota', 'aktif'),
(130, 'Bu Ini', 'buini', 'anggota', 'anggota', 'aktif'),
(131, 'Eni', 'eni', 'anggota', 'anggota', 'aktif'),
(132, 'Bu Tita', 'Neng Aep', 'anggota', 'anggota', 'aktif'),
(133, 'Neni Juliani', 'nenijuliani', 'anggota', 'anggota', 'aktif'),
(134, 'Dadan', 'dadan', 'anggota', 'anggota', 'aktif'),
(135, 'Uyun', 'uyun', 'anggota', 'anggota', 'aktif'),
(136, 'Dede Yani', 'dedeyani', 'anggota', 'anggota', 'aktif'),
(137, 'Acin', 'acin', 'anggota', 'anggota', 'aktif'),
(138, 'Oom', 'oom', 'anggota', 'anggota', 'aktif'),
(139, 'Budi', 'budi', 'anggota', 'anggota', 'aktif'),
(140, 'N Rika', 'nrika', 'anggota', 'anggota', 'aktif'),
(141, 'Ai Nani', 'ainani', 'anggota', 'anggota', 'aktif'),
(142, 'Santi', 'santi', 'anggota', 'anggota', 'aktif'),
(143, 'Hasan', 'hasan', 'anggota', 'anggota', 'aktif'),
(144, 'Undang', 'undang', 'anggota', 'anggota', 'aktif'),
(145, 'Asep', 'asep', 'anggota', 'anggota', 'aktif'),
(146, 'Mugni Agnina', 'mugniagnina', 'anggota', 'anggota', 'aktif'),
(147, 'Nia', 'nia', 'anggota', 'anggota', 'aktif'),
(148, 'Atep', 'atep', 'anggota', 'anggota', 'aktif'),
(149, 'Neng Sari Yono', 'nengsari', 'anggota', 'anggota', 'aktif'),
(150, 'Siti Juariyah', 'sitijuariyah', 'anggota', 'anggota', 'aktif'),
(151, 'Tati/Nyai Emi', 'tatinyai', 'anggota', 'anggota', 'aktif'),
(152, 'wawat Waryati', 'wawatwar', 'anggota', 'anggota', 'aktif'),
(153, 'Abdul Fatah', 'abdulfatah', 'anggota', 'anggota', 'aktif'),
(154, 'Yuyun', 'yuyun', 'anggota', 'anggota', 'aktif'),
(155, 'Soniangsih', 'soniangsih', 'anggota', 'anggota', 'aktif'),
(156, 'Tuti Herawati', 'tutiherawati', 'anggota', 'anggota', 'aktif'),
(157, 'Ipit Pitri', 'ipitpitri', 'anggota', 'anggota', 'aktif'),
(158, 'Atep Rasid/Kaerwati', 'ateprasid', 'anggota', 'anggota', 'aktif'),
(159, 'Mastur', 'mastur', 'anggota', 'anggota', 'aktif'),
(160, 'Enung', 'enung', 'anggota', 'anggota', 'aktif'),
(161, 'Ai Hamidah', 'aihamidah', 'anggota', 'anggota', 'aktif'),
(162, 'Mumuh', 'mumuh', 'anggota', 'anggota', 'aktif'),
(163, 'Dindin', 'dindin', 'anggota', 'anggota', 'aktif'),
(164, 'Usman', 'usman', 'anggota', 'anggota', 'aktif'),
(165, 'Suhendi', 'suhendi', 'anggota', 'anggota', 'aktif'),
(166, 'Wiwin', 'wiwin', 'anggota', 'anggota', 'aktif'),
(167, 'Yayat Cacah', 'yayatcacah', 'anggota', 'anggota', 'aktif'),
(168, 'Titin', 'titin', 'anggota', 'anggota', 'aktif'),
(169, 'Neni Nuraeni', 'neninuraeni', 'anggota', 'anggota', 'aktif'),
(170, 'Neng Anita', 'nenganita', 'anggota', 'anggota', 'aktif'),
(171, 'Endi Nita', 'endinita', 'anggota', 'anggota', 'aktif'),
(172, 'Ishak', 'ishak', 'anggota', 'anggota', 'aktif'),
(173, 'Honijah', 'honijah', 'anggota', 'anggota', 'aktif'),
(174, 'Enok', 'enok', 'anggota', 'anggota', 'aktif'),
(175, 'Upit', 'upit', 'anggota', 'anggota', 'aktif'),
(176, 'Pani', 'pani', 'anggota', 'anggota', 'aktif'),
(177, 'Yono', 'yono', 'anggota', 'anggota', 'aktif'),
(178, 'Neni N', 'nenin', 'anggota', 'anggota', 'aktif'),
(179, 'Anita Pratiwi', 'anitapratiwi', 'anggota', 'anggota', 'aktif'),
(180, 'Emas', 'emas', 'anggota', 'anggota', 'aktif'),
(181, 'Ipah Saripah', 'ipahsaripah', 'anggota', 'anggota', 'aktif'),
(182, 'Epa Sapitri', 'epasapitri', 'anggota', 'anggota', 'aktif'),
(183, 'Lina (Ira)', 'linaira', 'anggota', 'anggota', 'aktif');

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
  ADD PRIMARY KEY (`id_anggota`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_pinjaman`
--
ALTER TABLE `tb_pinjaman`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT untuk tabel `tb_subkriteria`
--
ALTER TABLE `tb_subkriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
