const daftarBuku = [
  { judul: 'Laskar Pelangi', harga: 85000, stok: 5, kategori: 'Novel' },
  { judul: 'Filosofi Teras', harga: 98000, stok: 0, kategori: 'Self-Help' },
  { judul: 'Atomic Habits', harga: 120000, stok: 3, kategori: 'Self-Help' },
  { judul: 'Bumi Manusia', harga: 105000, stok: 2, kategori: 'Novel' },
];

// d) Buat sebuah fungsi prosesPembayaran(judulBuku) yang mengembalikan Promise.
// e) Di dalam fungsi tersebut, gunakan setTimeout selama 1,5 detik untuk mensimulasikan proses pembayaran
const prosesPembayaran = (judulBuku) => new Promise((resolve, reject) => {
  setTimeout(() => {
    const buku = daftarBuku.find(b => b.judul === judulBuku);
    if (buku && buku.stok > 0) {
      resolve('Pembayaran berhasil untuk buku: ' + buku.judul);
    } else {
      reject('Gagal: Buku tidak tersedia atau stok habis!');
    }
  }, 1500);
});

// f) Buat async function bernama transaksiToko() dan panggil fungsi prosesPembayaran menggunakan await di dalam blok try...catch untuk menguji kondisi berhasil (misal: memproses 'Atomic Habits') dan kondisi gagal (misal: memproses 'Filosofi Teras').
async function transaksiToko() {
  try {
    console.log('Memproses Atomic Habits...');
    const hasil = await prosesPembayaran('Atomic Habits');
    console.log(hasil);
  } catch (e) {
    console.log(e);
  }
  try {
    console.log('Memproses Filosofi Teras...');
    const hasil = await prosesPembayaran('Filosofi Teras');
    console.log(hasil);
  } catch (e) {
    console.log(e);
  }
}

async function soal8() {
  console.log('SOAL 8');

  // a) Buat kode untuk menyaring (filter) dan menampilkan array yang berisi hanya judul buku yang stoknya tersedia (stok > 0).
  const judulTersedia = daftarBuku.filter(b => b.stok > 0).map(b => b.judul);
  console.log('a) Judul buku tersedia:', judulTersedia);

  // b)  Hitung total harga keseluruhan buku yang ada di toko (gunakan method reduce).
  const totalHarga = daftarBuku.reduce((total, b) => total + b.harga, 0);
  console.log('b) Total harga semua buku: Rp' + totalHarga);

  // c) Format dan cetak daftar buku ke konsol dengan format tampilan: Laskar Pelangi - Rp85000 (Stok: 5)
  console.log('c) Daftar buku:');
  daftarBuku.forEach(b => console.log(b.judul + ' - Rp' + b.harga + ' (Stok: ' + b.stok + ')'));

  // d-f) transaksi pembayaran
  console.log('d-f) Transaksi:');
  await transaksiToko();
}

window.antrean = (window.antrean || Promise.resolve()).then(soal8);

