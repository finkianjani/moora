<?php
    include("../koneksi.php");

    if( isset($_POST['submit']) ){

        $id = $_POST['id'];

        $sql = "DELETE FROM tb_kriteria WHERE id=$id";
        $query = mysqli_query($koneksi, $sql);

        if( $query ){
            header('Location: ../halaman_petugas.php?page=master_kriteria');
        } else {
            die("gagal menghapus...");
        }
    } else {
        die("akses dilarang...");
    }
?>