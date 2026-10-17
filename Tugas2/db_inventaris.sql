CREATE TABLE `barang` (
  `id` int NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `stok` int NOT NULL,
  `harga_satuan` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `kategori`, `stok`, `harga_satuan`) VALUES
(1, 'BRG001', 'Kemeja Flanel ', 'Pakaian', 25, 150000),
(2, 'BRG002', 'Rok Span Rajut', 'Pakaian', 18, 185000),
(3, 'BRG003', 'Tas Selempang ', 'Aksesoris', 12, 95000),
(5, 'BRG004', 'Sepatu Sneakers Putih', 'Sepatu', 9, 275000),
(6, 'BRG005', 'Celana Jeans ', 'Pakaian', 50, 350000);

ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_barang` (`kode_barang`);

ALTER TABLE `barang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;
