<!DOCTYPE html>
<html lang="en">
<head>
  <title>Halaman Pengawas</title>
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
          <a class="navbar-brand" href="#">Pengawas</a>
        </div>
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
      <h2>Daftar Pengajuan</h2>
      <hr />    
      <table class="table table-bordered" id="table-data">
        <thead>
          <tr>
            <th class="text-center">Tanggal</th>
            <th class="text-center">Besar</th>
            <th class="text-center">Keperluan</th>        
            <th class="text-center">Jangka</th>                   
            <th class="text-center">Status</th>      
            <th class="text-center">Action</th>
          </tr>
        </thead>
        <tbody>
          <?php
            $sqlPinjaman = "SELECT * FROM tb_pengajuan";
            $queryPinjaman = mysqli_query($koneksi, $sqlPinjaman);
          ?>
          <?php while($listPinjaman = mysqli_fetch_array($queryPinjaman)){ ?>
            <tr class="success">
              <td class="text-center"><?php echo $listPinjaman['tanggal_pengajuan']; ?></td>
              <td class="text-center"><?php echo $listPinjaman['besar_pinjaman']; ?></td>
              <td class="text-center"><?php echo $listPinjaman['keperluan']; ?></td>
              <td class="text-center"><?php echo $listPinjaman['jangka_waktu']; ?> bulan</td>
              <td class="text-center">
                <?php echo  ($listPinjaman['status_pengajuan'] != null) ? 
                  $listPinjaman['status_pengajuan'] 
                  :
                  "belum diperiksa"                 
                ?> 
              </td>
              <td class="text-center"> 
                <a 
                  href="javascript:;"
                  class="btn btn-default">
                    SETUJUI
                </a> 
                <a 
                  href="javascript:;"
                  class="btn btn-default">
                    TOLAK
                </a>           
              </td>
            </tr>
          <?php } ?>
        </tbody>
    </table>
    </div>
  </div>

  <!-- Modal Hapus-->
  <div id="modalKonfirmasi" class="modal fade" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Alert</h4>
        </div>
        <form action="hapus_pinjaman.php" method="POST">
          <div class="modal-body">
            <p>Apakah anda yakin ingin menghapus data pinjaman ini?</p>
            <input type="hidden" id="id" name="id"> 
          </div>
          <div class="modal-footer">
          <input type="submit" name="submit" value="Ya" class="btn btn-danger"> 
          <button type="button" class="btn btn-warning" data-dismiss="modal">Tidak</button>
          </div>
        </form>
      </div>

    </div>
  </div>

</body>

<!--Untuk Hapus Data-->
<script>
$(document).ready(function() {

    // Untuk sunting
    $('#modalHapus').on('show.bs.modal', function (event) {
        var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
        var modal          = $(this)

        // Isi nilai pada field
        modal.find('#id').attr("value",div.data('id'));
    });
});

</script>
<script>
    $(document).ready(function(){
        $('#tabel-data').DataTable();
    });
</script>
</html>