<?php

include("koneksi.php");

if( isset($_POST['submit']) ){

    // ambil id dari query string
    $id = $_POST['id'];

    // buat query hapus
    $sql = "DELETE FROM pinjaman WHERE id=$id";
    $query = mysqli_query($koneksi, $sql);

    // apakah query hapus berhasil?
    if( $query ){
        header('Location: halaman_anggota.php');
    } else {
        die("gagal menghapus...");
    }

} else {
    die("akses dilarang...");
}

?>