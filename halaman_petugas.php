<!DOCTYPE html>
<html>
<head>
	<title>Halaman petugas</title>
</head>
<body>
	<?php 
	session_start();

	// cek apakah yang mengakses halaman ini sudah login
	if($_SESSION['level']==""){
		header("location:index.php?pesan=gagal");
	}

	?>
	<h1>Halaman Petugas</h1>

	
<style type="text/css">
	html,body{
		padding: 0;
		margin:0;
		font-family: sans-serif;
	}
 
	.menu-petugas{
		background-color: #84b586;
	}
 
	.menu-petugas ul {
		list-style-type: none;
		margin: 0;
		padding: 0;
		overflow: hidden;
	}
 
	.menu-petugas > ul > li {
		float: left;
	}
 
	
	.menu-petugas li a {
		display: inline-block;
		color: white;
		text-align: center;
		padding: 14px 16px;
		text-decoration: none;
	}
 
	.menu-petugas li a:hover{
		background-color: #147d2e;
	}
 
	li.dropdown {
		display: inline-block;
	}
 
	.dropdown:hover .isi-dropdown {
		display: block;
	}
 
	.isi-dropdown a:hover {
		color: #fff !important;
	}
 
	.isi-dropdown {
		position: absolute;
		display: none;
		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		z-index: 1;
		background-color: #f9f9f9;
	}
 
	.isi-dropdown a {
		color: #3c3c3c !important;
	}
 
	.isi-dropdown a:hover {
		color: #232323 !important;
		background: #f3f3f3 !important;
	}
</style>
 
 
<header class="header">
	<div class="menu-petugas">
 
		<ul>
			<li><a href="#">Beranda</a></li>
			<li class="dropdown"><a href="#">Data Master</a>
				<ul class="isi-dropdown">
					<li><a href="#">Data User</a></li>
					<li><a href="#">Data Kriteria</a></li>
					<li><a href="#">Data Pengaju Pinjaman</a></li>
					</ul>
			</li>
			<li class="dropdown"><a href="#">Analisis Moora</a>
				<ul class="isi-dropdown">
					<li><a href="#">Sub Menu 1</a></li>
					<li><a href="#">Sub Menu 2</a></li>
					</ul>
			</li>
			<li><a href="logout.php">Log Out</a></li>
		</ul>
 
	</div>
	<p>Halo <b><?php echo $_SESSION['username']; ?></b> Anda telah login sebagai <b><?php echo $_SESSION['level']; ?></b>.</p>
	
</header>
 
<br/>
	
</body>
</html>