<?php 
// mengaktifkan session pada php
session_start();

// menghubungkan php dengan koneksi database
include 'koneksi.php';

// menangkap data yang dikirim dari form login
$username = $_POST['username'];
$password = $_POST['password'];


// menyeleksi data user dengan username dan password yang sesuai
$login = mysqli_query($koneksi,"select * from user where username='$username' and password='$password'");
// menghitung jumlah data yang ditemukan
$cek = mysqli_num_rows($login);

// cek apakah username dan password di temukan pada database
if($cek > 0){

	$data = mysqli_fetch_assoc($login);

	// cek jika user login sebagai petugas
	if($data['level']=="petugas"){

		// buat session login dan username
		$_SESSION['username'] = $username;
		$_SESSION['level'] = "petugas";
		// alihkan ke halaman dashboard petugas
		header("location:halaman_petugas.php");

	// cek jika user login sebagai pengawas
	}else if($data['level']=="pengawas"){
		// buat session login dan username
		$_SESSION['username'] = $username;
		$_SESSION['level'] = "pengawas";
		// alihkan ke halaman dashboard pengawas
		header("location:halaman_pengawas.php");

	// cek jika user login sebagai anggota
	}else if($data['level']=="anggota"){
		// buat session login dan username
		$_SESSION['username'] = $username;
		$_SESSION['level'] = "anggota";
		// alihkan ke halaman dashboard anggota
		header("location:halaman_anggota.php");

	}else{

		// alihkan ke halaman login kembali
		header("location:index.php?pesan=gagal");
	}

	
}else{
	header("location:index.php?pesan=gagal");
}



?>