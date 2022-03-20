-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Mar 2022 pada 02.24
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barangg`
--

CREATE TABLE `barangg` (
  `id` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL,
  `tgl_update` date NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `harga` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barangg`
--

INSERT INTO `barangg` (`id`, `nama`, `stok`, `tgl_update`, `supplier`, `harga`) VALUES
(1, 'Deterjen Bubuk', 18, '2022-01-20', 'Erwin', 8000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detil_transaksi`
--

CREATE TABLE `detil_transaksi` (
  `id` int(10) NOT NULL,
  `id_paket` int(10) NOT NULL,
  `id_transaksi` int(10) NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detil_transaksi`
--

INSERT INTO `detil_transaksi` (`id`, `id_paket`, `id_transaksi`, `qty`) VALUES
(1, 1, 0, 11),
(2, 2, 0, 12),
(3, 1, 0, 12),
(4, 5, 0, 10),
(5, 1, 0, 12),
(6, 2, 0, 11),
(7, 1, 0, 12),
(8, 2, 0, 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(10) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `harga` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `jenis`, `harga`) VALUES
(1, 'Paket 1', 10000),
(2, 'Paket 2', 5000),
(5, 'paket 3', 4500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `konsumen`
--

CREATE TABLE `konsumen` (
  `id` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `konsumen`
--

INSERT INTO `konsumen` (`id`, `nama`, `alamat`, `telp`) VALUES
(3, 'mujek ', 'sawojajar', '082145672813'),
(4, 'ezanando irawan', 'jl.raya pakis no3421', '082145672813'),
(5, 'ezan', 'sawojajar', '082145672813'),
(6, 'risky teguh', 'jl.raya pakis no3423', '082145672813'),
(7, 'risky ', 'jl.raya pakis no3421', '083943900821');

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `id` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`id`, `nama`, `alamat`, `telp`) VALUES
(4, 'zafran laundry 4', 'blimbing malang ', '089576052718');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemakaian`
--

CREATE TABLE `pemakaian` (
  `id` int(10) NOT NULL,
  `tgl_pakai` date NOT NULL,
  `barang` varchar(100) NOT NULL,
  `jumlah` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pemakaian`
--

INSERT INTO `pemakaian` (`id`, `tgl_pakai`, `barang`, `jumlah`) VALUES
(1, '2016-02-23', 'Deterjen Bubuk', 10),
(2, '2022-01-20', 'Deterjen Bubuk', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `no` int(10) NOT NULL,
  `tgl` date NOT NULL,
  `totali` int(100) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `barang` varchar(100) NOT NULL,
  `totalh` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`no`, `tgl`, `totali`, `supplier`, `barang`, `totalh`) VALUES
(1, '2016-02-23', 10, 'Erwin', 'Deterjen Bubuk', 80000),
(2, '2016-02-23', 2, 'Erwin', 'Deterjen Bubuk', 16000),
(3, '2022-01-20', 9, 'Erwin', 'Deterjen Bubuk', 72000),
(4, '2022-01-20', 12, 'Erwin', 'Deterjen Bubuk', 96000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('Administrator','Karyawan','ouwner') NOT NULL,
  `nik` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(20) NOT NULL,
  `gender` enum('Laki laki','Perempuan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `username`, `password`, `level`, `nik`, `alamat`, `telp`, `gender`) VALUES
(1, 'Khalid Insan Tauhid', 'khalid', '4b98fb5647589473b739ce856356b193', 'Administrator', '123456789', 'Sumedang', '085221445987', 'Laki laki'),
(9, 'ezanando irawan', 'ezan41', '687b6d778e6b24d0658e31b4154a19a8', 'Karyawan', '0987654321', 'jl.raya pakis no3421', '089212356756', 'Laki laki'),
(10, 'ezan', 'nopal', '202cb962ac59075b964b07152d234b70', 'ouwner', '0987654321', 'pakis', '083943900821', 'Laki laki');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id`, `nama`, `alamat`, `telp`) VALUES
(1, 'Erwin', 'Jl. Water Park No.18', '08178171123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(5) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `tarif` int(100) NOT NULL,
  `diskon` int(100) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `tgl_ambil` date NOT NULL,
  `berat` int(10) NOT NULL,
  `pengguna` varchar(100) NOT NULL,
  `konsumen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `jenis`, `tarif`, `diskon`, `tgl_transaksi`, `tgl_ambil`, `berat`, `pengguna`, `konsumen`) VALUES
(1, 'Paket 1', 100000, 0, '2016-02-23', '2016-03-01', 10, 'khalid', 'Irwansyah'),
(2, 'Paket 2', 50000, 0, '2016-02-23', '2016-03-01', 10, 'khalid', 'Irwansyah'),
(3, 'Paket 1', 180000, 0, '2016-02-23', '2016-03-01', 20, 'khalid', 'Irwansyah'),
(4, 'Paket 2', 90000, 0, '2016-02-23', '2016-03-01', 20, 'khalid', 'Irwansyah'),
(5, 'Paket 1', 180000, 0, '2022-01-20', '2022-02-01', 20, 'ahmad', 'ezan'),
(6, 'paket 3', 121500, 0, '2022-01-20', '2022-02-01', 30, 'ahmad', 'ezan'),
(7, 'Paket 2', 202500, 0, '2022-01-21', '2022-02-11', 45, 'ezan40', 'Irwansyah'),
(8, 'Paket 2', 130500, 0, '2022-01-27', '2022-01-27', 29, 'khalid', 'risky teguh'),
(9, '1', 0, 0, '2022-01-31', '2022-01-31', 11, 'khalid', 'mujek '),
(10, '1', 0, 0, '2022-01-31', '2022-02-04', 11, '', 'mujek '),
(11, '1', 99000, 0, '2022-01-31', '2022-02-04', 11, '', 'mujek '),
(12, '1', 99000, 0, '2022-01-31', '2022-02-04', 11, '', 'mujek '),
(13, '1', 99000, 0, '2022-01-31', '2022-02-04', 11, 'khalid', 'mujek '),
(14, '1', 99000, 0, '2022-01-31', '2022-02-04', 11, 'khalid', 'mujek '),
(15, 'Array', 0, 0, '2022-03-02', '2022-03-06', 0, 'khalid', ''),
(16, 'Array', 0, 0, '2022-03-02', '2022-03-06', 0, 'khalid', ''),
(17, 'Array', 0, 0, '2022-03-02', '2022-03-06', 0, 'khalid', ''),
(18, 'Array', 0, 0, '2022-03-02', '2022-03-06', 0, 'khalid', 'mujek '),
(19, 'Array', 0, 0, '2022-03-02', '2022-03-06', 0, 'khalid', 'mujek '),
(20, 'Array', 0, 0, '2022-03-02', '2022-03-06', 0, 'khalid', 'mujek '),
(21, 'paket', 0, 0, '2022-03-02', '2022-03-06', 0, 'khalid', 'mujek '),
(22, 'paket', 0, 0, '2022-03-02', '2022-03-06', 0, 'khalid', 'mujek '),
(23, 'paket', 0, 0, '2022-03-02', '2022-03-02', 0, 'khalid', 'mujek '),
(24, 'paket', 0, 0, '2022-03-02', '2022-03-08', 0, 'khalid', 'mujek '),
(25, 'paket', 0, 0, '2022-03-02', '2022-03-08', 0, 'khalid', 'mujek ');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barangg`
--
ALTER TABLE `barangg`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `detil_transaksi`
--
ALTER TABLE `detil_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `konsumen`
--
ALTER TABLE `konsumen`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pemakaian`
--
ALTER TABLE `pemakaian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barangg`
--
ALTER TABLE `barangg`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `detil_transaksi`
--
ALTER TABLE `detil_transaksi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id_jenis` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `konsumen`
--
ALTER TABLE `konsumen`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pemakaian`
--
ALTER TABLE `pemakaian`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `no` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
