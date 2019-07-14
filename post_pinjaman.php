<?php

include("koneksi.php");

// cek apakah tombol daftar sudah diklik atau blum?
if(isset($_POST['submit'])){

    // ambil data dari formulir
    $id_pengaju = $_POST['id_pengaju'];
    $besar_pinjaman = $_POST['besar_pinjaman'];
    $keperluan = $_POST['keperluan'];
    $jangka = $_POST['jangka'];
    $tanggal = date("Y/m/d");

    // buat query
    $sql = "INSERT INTO pinjaman (id_peminjam, besar_pinjaman, keperluan, jangka_waktu, tanggal_pengajuan) VALUE ('$id_pengaju', '$besar_pinjaman', '$keperluan', '$jangka', '$tanggal')";
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