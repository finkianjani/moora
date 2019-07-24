<?php

include("../koneksi.php");

if(isset($_POST['submit'])){

    $kode_kriteria = $_POST['kode_kriteria'];
    $subkriteria = $_POST['subkriteria'];
    $nilai = $_POST['nilai'];

    $sql = "INSERT INTO tb_subkriteria (kode_kriteria, subkriteria, nilai) VALUE ('$kode_kriteria', '$subkriteria', '$nilai')";
    $query = mysqli_query($koneksi, $sql);
    if( $query ) {
        header('Location: ../halaman_petugas.php?page=master_sub');
    } else {
        header('Location: ../halaman_petugas.php?page=master_sub');
    }
} else {
    die("Akses dilarang...");
}

?>