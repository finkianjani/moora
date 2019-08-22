<?php

include("koneksi.php");

if(isset($_POST['submit'])){

    $id = $_POST['id'];
    $type = $_POST['type'];
    if ($type == 'setujui') {
        $status = 'disetujui';
    } else {
        $status = 'ditolak';
    }

    $sql = "UPDATE tb_pengajuan SET status_pengajuan='$status' WHERE id=$id";
    $query = mysqli_query($koneksi, $sql);
    if( $query ) {
        header('Location: halaman_pengawas.php');
    } else {
        header('Location: halaman_pengawas.php');
    }
} else {
    die("Akses dilarang...");
}

?>