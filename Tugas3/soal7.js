// a) Buat function tunggu(ms) yang mengembalikan Promise dan selesai setelah ms milidetik (pakai setTimeout).
const tunggu = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

// b) Buat async function yang mencetak Mulai, menunggu 1 detik, mencetak Langkah 1, menunggu 1 detik lagi, lalu mencetak Selesai. Panggil function itu.
async function jalankan() {
  console.log('Mulai');
  await tunggu(1000);
  console.log('Langkah 1');
  await tunggu(1000);
  console.log('Selesai');
}

// c) Bonus: buat function cekStok(jumlah) yang mengembalikan Promise: berhasil (resolve) kalau jumlah > 0, gagal (reject) kalau tidak. Panggil dengan await di dalam try/catch.
const cekStok = (jumlah) => new Promise((resolve, reject) => {
  if (jumlah > 0) {
    resolve('Stok tersedia: ' + jumlah);
  } else {
    reject('Stok habis');
  }
});

// Panggil cekStok
async function ujiCekStok() {
  try {
    console.log(await cekStok(5));   
    console.log(await cekStok(0));   
  } catch (e) {
    console.log('Error:', e);
  }
}

async function soal7() {
  console.log('SOAL 7');
  await jalankan();
  console.log('Bonus: cekStok');
  await ujiCekStok();
}

window.antrean = (window.antrean || Promise.resolve()).then(soal7);
