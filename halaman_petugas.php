<!DOCTYPE html>
<html lang="en">
<head>
  <title>Halaman Petugas</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" media="screen" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Arvo|Didact+Gothic&display=swap" rel="stylesheet">
  <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
</head>
<body style="font-family: 'Didact Gothic', sans-serif;">

  <?php include("koneksi.php"); ?>
  <?php 
    session_start();
    if($_SESSION['level']==""){
      header("location:index.php?pesan=gagal");
    }

  ?>

  <?php
      $sqlAnggota = "SELECT * FROM user WHERE username = '".$_SESSION['username']."'";
      $queryAnggota = mysqli_query($koneksi, $sqlAnggota);
      $anggota = mysqli_fetch_array($queryAnggota);
  ?>   
  
  <div class="container">
  <h1 class="text-center">KOPERASI PARA PETANI MEKAR HARAPAN</h1>
    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="halaman_petugas.php?page=home">Petugas</a>
        </div>
        <ul class="nav navbar-nav">
          <li><a href="halaman_petugas.php?page=home">Beranda</a></li>
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Master
            <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="halaman_petugas.php?page=master_petugas">Data Petugas</a></li>
              <li><a href="halaman_petugas.php?page=master_pengaju">Data Pengaju</a></li>
              <li><a href="halaman_petugas.php?page=master_kriteria">Data Kriteria</a></li>
              <li><a href="halaman_petugas.php?page=master_sub">Data Sub</a></li>
            </ul>
          </li>
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">MOORA
            <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="halaman_petugas.php?page=moora_alternatif">Data Alternatif</a></li>
              <li><a href="halaman_petugas.php?page=moora_penilaian">Penilaian</a></li>
              <li><a href="halaman_petugas.php?page=moora_hasil">Hasil</a></li>
            </ul>
          </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span> <?php echo $anggota['nama']; ?></a>
            <ul class="dropdown-menu">
              <li><a href="logout.php">Logout</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>

    <div class="jumbotron"> 
      <?php 
        if(isset($_GET['page'])){
          $page = $_GET['page'];
       
          switch ($page) {
            case 'home':
              include "petugas/home.php";
              break;
            case 'master_petugas':
              include "petugas/master_petugas.php";
              break;
            case 'master_pengaju':
              include "petugas/master_pengaju.php";
              break;
            case 'master_kriteria':
              include "petugas/master_kriteria.php";
              break; 
            case 'master_sub':
              include "petugas/master_sub.php";
              break; 
            case 'moora_alternatif':
              include "petugas/moora_alternatif.php";
              break; 
            case 'moora_penilaian':
              include "petugas/moora_penilaian.php";
              break; 
            case 'moora_hasil':
              include "petugas/moora_hasil.php";
              break; 
            default:
              echo "<center><h3>Maaf. Halaman tidak di temukan !</h3></center>";
              break;
          }
        }else{
          include "petugas/home.php";
        }       
       ?>
    </div>
  </div>

</body>

<script>
    $(document).ready(function(){
        $('#tabel-data').DataTable();
    });
</script>
</html>