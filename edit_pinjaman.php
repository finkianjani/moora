<?php

include("koneksi.php");

// cek apakah tombol daftar sudah diklik atau blum?
if(isset($_POST['submit'])){

    // ambil data dari formulir
    $id = $_POST['id'];
    $besar_pinjaman = $_POST['besar_pinjaman'];
    $keperluan = $_POST['keperluan'];
    $jangka = $_POST['jangka'];

    // buat query
    $sql = "UPDATE pinjaman SET besar_pinjaman='$besar_pinjaman', keperluan='$keperluan',  jangka='$jangka' WHERE id=$id";
    $query = mysqli_query($koneksi, $sql);

    // apakah query simpan berhasil?
    if( $query ) {
        // kalau berhasil alihkan ke halaman index.php dengan status=sukses
        header('Location: halaman_anggota.php?status=sukses');
    } else {
        // kalau gagal alihkan ke halaman indek.php dengan status=gagal
        header('Location: halaman_anggota.php?status=gagal');
    }


} else {
    die("Akses dilarang...");
}

?>