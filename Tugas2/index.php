<?php
$host = "localhost";
$user = "root";
$pass = "";               
$db   = "db_inventaris";

$koneksi = mysqli_connect($host, $user, $pass, $db);
if (!$koneksi) {
    die("Koneksi gagal: " . mysqli_connect_error());
}

$id       = 0;
$kode     = "";
$nama     = "";
$kategori = "";
$stok     = "";
$harga    = "";
$op       = "";           
$error    = "";         
$sukses   = "";           

if (isset($_GET['op'])) {
    $op = $_GET['op'];
}

if ($op == "delete" && isset($_GET['id'])) {
    $id = $_GET['id'];
    $hapus = mysqli_query($koneksi, "DELETE FROM barang WHERE id = '$id'");
    if ($hapus) {
        $sukses = "Data berhasil dihapus.";
    } else {
        $error = "Data gagal dihapus.";
    }
    $op = "";
    $id = 0;
}

if ($op == "edit" && isset($_GET['id'])) {
    $id = $_GET['id'];
    $hasil = mysqli_query($koneksi, "SELECT * FROM barang WHERE id = '$id'");
    $data  = mysqli_fetch_array($hasil);   

    if ($data) {
        $kode     = $data['kode_barang'];
        $nama     = $data['nama_barang'];
        $kategori = $data['kategori'];
        $stok     = $data['stok'];
        $harga    = $data['harga_satuan'];
    } else {
        $error = "Data tidak ditemukan.";
        $op = "";
        $id = 0;
    }
}

if (isset($_POST['simpan'])) {
    $op       = $_POST['op'];
    $id       = $_POST['id'];
    $kode     = $_POST['kode_barang'];
    $nama     = $_POST['nama_barang'];
    $kategori = $_POST['kategori'];
    $stok     = $_POST['stok'];
    $harga    = $_POST['harga_satuan'];

    if ($kode == "" || $nama == "" || $kategori == "" || $stok == "" || $harga == "") {
        $error = "Semua kolom wajib diisi!";

    } elseif (!ctype_digit($stok) || !ctype_digit($harga)) {
        $error = "Stok dan Harga Satuan harus berupa angka bulat (tanpa huruf, spasi, atau tanda minus)!";

    } else {
        if ($op == "edit") {
            $sql = "UPDATE barang SET kode_barang = '$kode', nama_barang = '$nama',
                    kategori = '$kategori', stok = $stok, harga_satuan = $harga
                    WHERE id = '$id'";
            $pesan = "Data berhasil diperbarui.";
        } else {
            $sql = "INSERT INTO barang (kode_barang, nama_barang, kategori, stok, harga_satuan)
                    VALUES ('$kode', '$nama', '$kategori', $stok, $harga)";
            $pesan = "Data berhasil ditambahkan.";
        }

        $simpan = mysqli_query($koneksi, $sql);
        if ($simpan) {
            $sukses = $pesan;
            $id = 0;
            $kode = "";
            $nama = "";
            $kategori = "";
            $stok = "";
            $harga = "";
            $op = "";
        } else {
            $error = "Data gagal disimpan.";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Inventaris Barang</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
    <h3 class="mb-3">Sistem Inventaris Barang</h3>

    <?php if ($error != "") { ?>
        <div class="alert alert-danger"><?php echo $error; ?></div>
    <?php } ?>
    <?php if ($sukses != "") { ?>
        <div class="alert alert-success"><?php echo $sukses; ?></div>
    <?php } ?>

    <div class="card mb-4">
        <div class="card-header">
            <?php if ($op == "edit") { echo "Edit Barang"; } else { echo "Tambah Barang"; } ?>
        </div>
        <div class="card-body">
            <form action="index.php" method="POST">
                <input type="hidden" name="op" value="<?php echo $op; ?>">
                <input type="hidden" name="id" value="<?php echo $id; ?>">

                <div class="mb-2">
                    <label class="form-label">Kode Barang</label>
                    <input type="text" name="kode_barang" class="form-control" value="<?php echo $kode; ?>">
                </div>
                <div class="mb-2">
                    <label class="form-label">Nama Barang</label>
                    <input type="text" name="nama_barang" class="form-control" value="<?php echo $nama; ?>">
                </div>
                <div class="mb-2">
                    <label class="form-label">Kategori</label>
                    <input type="text" name="kategori" class="form-control" value="<?php echo $kategori; ?>">
                </div>
                <div class="mb-2">
                    <label class="form-label">Stok</label>
                    <input type="text" name="stok" class="form-control" value="<?php echo $stok; ?>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Harga Satuan (Rp)</label>
                    <input type="text" name="harga_satuan" class="form-control" value="<?php echo $harga; ?>">
                </div>

                <button type="submit" name="simpan" class="btn btn-primary">Simpan</button>
            </form>
        </div>
    </div>

    <div class="card">
        <div class="card-header">Data Barang</div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Kode Barang</th>
                        <th>Nama Barang</th>
                        <th>Kategori</th>
                        <th>Stok</th>
                        <th>Harga Satuan</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                <?php
                $urut  = 1;
                $hasil = mysqli_query($koneksi, "SELECT * FROM barang ORDER BY id ASC");

                while ($r = mysqli_fetch_array($hasil)) {
                ?>
                    <tr>
                        <td><?php echo $urut++; ?></td>
                        <td><?php echo $r['kode_barang']; ?></td>
                        <td><?php echo $r['nama_barang']; ?></td>
                        <td><?php echo $r['kategori']; ?></td>
                        <td><?php echo $r['stok']; ?></td>
                        <td>Rp <?php echo $r['harga_satuan']; ?></td>
                        <td>
                            <a href="index.php?op=edit&id=<?php echo $r['id']; ?>" class="btn btn-warning btn-sm">Edit</a>
                            <a href="index.php?op=delete&id=<?php echo $r['id']; ?>" class="btn btn-danger btn-sm"
                               onclick="return confirm('Yakin ingin menghapus data ini?')">Delete</a>
                        </td>
                    </tr>
                <?php
                }
                ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
