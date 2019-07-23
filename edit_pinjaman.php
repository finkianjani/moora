<?php

include("koneksi.php");

if(isset($_POST['submit'])){

    $id = $_POST['id'];
    $besar_pinjaman = $_POST['besar_pinjaman'];
    $keperluan = $_POST['keperluan'];
    $jangka = $_POST['jangka'];

    $sql = "UPDATE tb_pinjaman SET besar_pinjaman='$besar_pinjaman', keperluan='$keperluan',  jangka='$jangka' WHERE id=$id";
    $query = mysqli_query($koneksi, $sql);

    if( $query ) {
        header('Location: halaman_anggota.php?status=sukses');
    } else {
        header('Location: halaman_anggota.php?status=gagal');
    }


} else {
    die("Akses dilarang...");
}

?>