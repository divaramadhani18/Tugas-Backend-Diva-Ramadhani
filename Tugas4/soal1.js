// SOAL 1: SERVER EXPRESS DENGAN 3 ENDPOINT 

const express = require('express');
const app = express();
app.use(express.json());  

// a) GET /kali/:a/:b 
app.get('/kali/:a/:b', (req, res) => {
  const a = Number(req.params.a);
  const b = Number(req.params.b);

  if (isNaN(a) || isNaN(b)) {
    return res.status(400).json({ pesan: 'a dan b harus berupa angka' });
  }

  res.json({ a, b, hasil: a * b });
});

// b) GET /sapa?nama
app.get('/sapa', (req, res) => {
  const { nama } = req.query;

  res.json({ pesan: 'Halo, ' + nama + '!' });
});

// c) POST /hitung-rata 
app.post('/hitung-rata', (req, res) => {
  const { nilai } = req.body || {};

  if (!Array.isArray(nilai) || nilai.length === 0) {
    return res.status(400).json({ pesan: 'nilai harus berupa array dan tidak boleh kosong' });
  }

  const rata = nilai.reduce((total, n) => total + n, 0) / nilai.length;
  res.json({ rata });
});

app.listen(3000, () => console.log('Server soal 1 jalan di http://localhost:3000'));
