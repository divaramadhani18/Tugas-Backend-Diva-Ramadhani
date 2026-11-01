console.log('SOAL 6');

const produk = [
  { nama: 'Pensil', harga: 2000, stok: 10 },
  { nama: 'Buku', harga: 8000, stok: 0 },
  { nama: 'Penghapus', harga: 1500, stok: 5 },
];

// a) Menampilkan array berisi nama produk yang stoknya lebih dari 0
const namaStokAda = produk.filter(p => p.stok > 0).map(p => p.nama);
console.log('a) Produk dengan stok > 0:', namaStokAda);

// b) Mencari produk yang bernama 'Penghapus'.
const penghapus = produk.find(p => p.nama === 'Penghapus');
console.log('b) Hasil pencarian Penghapus:', penghapus);

// c)  Mencetak setiap produk dengan format Pensil - Rp2000.
console.log('c) Daftar produk:');
produk.forEach(p => console.log(p.nama + ' - Rp' + p.harga));
