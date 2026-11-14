-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 14 Nov 2026 pada 08.12
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klinik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_resep`
--

CREATE TABLE `detail_resep` (
  `id_kunjungan` int NOT NULL,
  `id_obat` int NOT NULL,
  `jumlah` int NOT NULL,
  `harga_satuan` int NOT NULL,
  `aturan_pakai` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `detail_resep`
--

INSERT INTO `detail_resep` (`id_kunjungan`, `id_obat`, `jumlah`, `harga_satuan`, `aturan_pakai`) VALUES
(1, 1, 10, 3000, '3 x 1 sesudah makan'),
(1, 4, 5, 2000, '1 x 1 pagi hari'),
(2, 3, 6, 4000, '3 x 1 sesudah makan'),
(3, 2, 6, 5000, '3 x 1 sesudah makan'),
(4, 1, 6, 3000, '3 x 1 bila demam'),
(5, 3, 10, 4000, '2 x 1 sesudah makan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `id_spesialisasi` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `id_spesialisasi`) VALUES
(1, 'dr. Rina Amelia', 1),
(2, 'drg. Hendra Putra', 2),
(3, 'dr. Sari Wulandari, Sp.A', 3),
(4, 'dr. Budi Santoso, Sp.PD', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kunjungan`
--

CREATE TABLE `kunjungan` (
  `id_kunjungan` int NOT NULL,
  `id_pasien` int NOT NULL,
  `id_dokter` int NOT NULL,
  `tanggal_kunjungan` date NOT NULL,
  `keluhan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `kunjungan`
--

INSERT INTO `kunjungan` (`id_kunjungan`, `id_pasien`, `id_dokter`, `tanggal_kunjungan`, `keluhan`) VALUES
(1, 1, 1, '2026-11-02', 'Demam dan batuk'),
(2, 2, 2, '2026-11-02', 'Sakit gigi geraham'),
(3, 3, 3, '2026-11-03', 'Demam dan flu'),
(4, 1, 1, '2026-11-05', 'Mual dan Muntah'),
(5, 4, 1, '2026-11-06', 'Nyeri otot dan pegal');

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id_obat` int NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `harga_obat` int NOT NULL,
  `stok_obat` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`id_obat`, `nama_obat`, `harga_obat`, `stok_obat`) VALUES
(1, 'Paracetamol 500 mg', 3000, 100),
(2, 'Amoxicillin 500 mg', 5000, 60),
(3, 'Ibuprofen 400 mg', 4000, 25),
(4, 'Vitamin C 500 mg', 2000, 80);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int NOT NULL,
  `no_rekam_medis` varchar(10) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `no_rekam_medis`, `nama_pasien`, `tanggal_lahir`, `jenis_kelamin`) VALUES
(1, 'RM001', 'Ani Rahma', '2001-05-14', 'Perempuan'),
(2, 'RM002', 'Budi Hartono', '1995-09-30', 'Laki-laki'),
(3, 'RM003', 'Citra Dewi', '2018-03-21', 'Perempuan'),
(4, 'RM004', 'Dedi Saputra', '1988-12-02', 'Laki-laki');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_pasien`
--

CREATE TABLE `profil_pasien` (
  `id_pasien` int NOT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `profil_pasien`
--

INSERT INTO `profil_pasien` (`id_pasien`, `alamat`, `no_hp`) VALUES
(1, 'Jl. Sudirman No. 12, Padang', '081234567801'),
(2, 'Jl. Veteran No. 5, Bukittinggi', '081234567802'),
(3, 'Jl. Pemuda No. 8, Padang', '081234567803');

-- --------------------------------------------------------

--
-- Struktur dari tabel `spesialisasi`
--

CREATE TABLE `spesialisasi` (
  `id_spesialisasi` int NOT NULL,
  `nama_spesialisasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `spesialisasi`
--

INSERT INTO `spesialisasi` (`id_spesialisasi`, `nama_spesialisasi`) VALUES
(1, 'Umum'),
(2, 'Gigi'),
(3, 'Anak'),
(4, 'Penyakit Dalam');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_resep`
--
ALTER TABLE `detail_resep`
  ADD PRIMARY KEY (`id_kunjungan`,`id_obat`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `id_spesialisasi` (`id_spesialisasi`);

--
-- Indeks untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD PRIMARY KEY (`id_kunjungan`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`),
  ADD UNIQUE KEY `no_rekam_medis` (`no_rekam_medis`);

--
-- Indeks untuk tabel `profil_pasien`
--
ALTER TABLE `profil_pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indeks untuk tabel `spesialisasi`
--
ALTER TABLE `spesialisasi`
  ADD PRIMARY KEY (`id_spesialisasi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  MODIFY `id_kunjungan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id_obat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `spesialisasi`
--
ALTER TABLE `spesialisasi`
  MODIFY `id_spesialisasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_resep`
--
ALTER TABLE `detail_resep`
  ADD CONSTRAINT `detail_resep_ibfk_1` FOREIGN KEY (`id_kunjungan`) REFERENCES `kunjungan` (`id_kunjungan`),
  ADD CONSTRAINT `detail_resep_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`);

--
-- Ketidakleluasaan untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_spesialisasi`) REFERENCES `spesialisasi` (`id_spesialisasi`);

--
-- Ketidakleluasaan untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD CONSTRAINT `kunjungan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `kunjungan_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Ketidakleluasaan untuk tabel `profil_pasien`
--
ALTER TABLE `profil_pasien`
  ADD CONSTRAINT `profil_pasien_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
