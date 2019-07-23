<?php

include("../koneksi.php");

if(isset($_POST['submit'])){

    $id = $_POST['id'];
    $kode = $_POST['kode'];
    $kriteria = $_POST['kriteria'];
    $jenis = $_POST['jenis'];

    $sql = "UPDATE tb_kriteria SET kode='$kode', kriteria='$kriteria',  jenis='$jenis' WHERE id=$id";
    $query = mysqli_query($koneksi, $sql);
    if( $query ) {
        header('Location: ../halaman_petugas.php?page=master_kriteria');
    } else {
        header('Location: ../halaman_petugas.php?page=master_kriteria');
    }
} else {
    die("Akses dilarang...");
}

?>