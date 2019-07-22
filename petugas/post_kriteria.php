<?php

include("koneksi.php");

// cek apakah tombol daftar sudah diklik atau blum?
if(isset($_POST['submit'])){

    // ambil data dari formulir
    $kode = $_POST['kode'];
    $kriteria = $_POST['kriteria'];
    $jenis = $_POST['jenis'];

    // buat query
    $sql = "INSERT INTO tb_kriteria (kode, kriteria, jenis) VALUE ('$kode', '$kriteria', '$jenis')";
    $query = mysqli_query($koneksi, $sql);

    // apakah query simpan berhasil?
    if( $query ) {
        // kalau berhasil alihkan ke halaman index.php dengan status=sukses
        header('Location: halaman_petugas.php?page=master_kriteria?status=sukses');
    } else {
        // kalau gagal alihkan ke halaman indek.php dengan status=gagal
        header('Location: halaman_petugas.php?page=master_kriteria?status=gagal');
    }


} else {
    die("Akses dilarang...");
}

?>