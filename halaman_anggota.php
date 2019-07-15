<!DOCTYPE html>
<html lang="en">
<head>
  <title>Halaman Anggota</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

  <?php include("koneksi.php"); ?>
  <?php 
    session_start();

    // cek apakah yang mengakses halaman ini sudah login
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
    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">Koprasi Pinjaman--Anggota</a>
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
      <h2>Daftar Pijaman</h2>
      <hr />      
      <button type="button" class="btn btn-info pull-right" style="margin-bottom: 10px" data-toggle="modal" data-target="#modalTambah">
        <span class="glyphicon glyphicon-plus"></span>
      </button>
      <table class="table table-bordered">
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
            $sqlPinjaman = "SELECT * FROM pinjaman WHERE id_peminjam = '".$anggota['id']."'";
            $queryPinjaman = mysqli_query($koneksi, $sqlPinjaman);
          ?>
          <?php while($listPinjaman = mysqli_fetch_array($queryPinjaman)){ ?>
            <tr class="success">
              <td class="text-center"><?php echo $listPinjaman['tanggal_pengajuan']; ?></td>
              <td class="text-center"><?php echo $listPinjaman['besar_pinjaman']; ?></td>
              <td class="text-center"><?php echo $listPinjaman['keperluan']; ?></td>
              <td class="text-center"><?php echo $listPinjaman['jangka_waktu']; ?></td>
              <td class="text-center">
                <?php echo  ($listPinjaman['status'] != null) ? 
                  $listPinjaman['status'] 
                  :
                  "belum diperiksa"                 
                ?> 
              </td>
              <td class="text-center"> 
                <a 
                  href="javascript:;"
                  data-id="<?php echo $listPinjaman['id'] ?>"
                  data-besar_pinjaman="<?php echo $listPinjaman['besar_pinjaman'] ?>"
                  data-keperluan="<?php echo $listPinjaman['keperluan'] ?>"
                  data-jangka_waktu="<?php echo $listPinjaman['jangka_waktu'] ?>"
                  data-toggle="modal" data-target="#modalEdit"
                  class="btn btn-warning">
                    <span class="glyphicon glyphicon-edit"></span>
                </a> 
                <a 
                  href="javascript:;"
                  data-id="<?php echo $listPinjaman['id'] ?>"
                  data-toggle="modal" data-target="#modalHapus"
                  class="btn btn-danger">
                    <span class="glyphicon glyphicon-trash"></span>
                </a>           
              </td>
            </tr>
          <?php } ?>
        </tbody>
    </table>
    </div>
  </div>

  <!-- Modal Tambah-->
  <div class="modal fade" id="modalTambah" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Form Pengajuan</h4>
        </div>
        <form action="post_pinjaman.php" method="POST">
          <div class="modal-body">
            <div class="form-group">
              <label for="id_pengaju">ID Pengaju</label>
              <input type="text" class="form-control" id="id_pengaju" name="id_pengaju" value="<?php echo $anggota['id']; ?>" >
            </div>
            <div class="form-group">
              <label for="nama">Nama</label>
              <input type="text" class="form-control" id="nama" name="nama" value="<?php echo $anggota['nama']; ?>" >
            </div>
            <div class="form-group">
              <label for="besar_pinjaman">Besar Pinjaman</label>
              <input type="number" class="form-control" id="besar_pinjaman" name="besar_pinjaman" >
            </div>
            <div class="form-group">
              <label for="keperluan">Jangka Waktu</label>
              <select class="form-control" id="keperluan" name="keperluan">
                <option value="Modal Usaha">Modal Usaha</option>
                <option value="Berobat">Berobat</option>
                <option value="Sekolah">Biaya Sekolah</option>
                <option value="Sembako">Kebutuhan Sehari-hari</option>
                <option value="Hajatan">Hajatan</option>
              </select>
            </div>
            <div class="form-group">
              <label for="jangka">Keperluan Untuk</label>
              <select class="form-control" id="jangka" name="jangka">
                <option value="5">5 bulan</option>
                <option value="10">10 bulan</option>
                <option value="20">20 bulan</option>
              </select>
            </div>
        </div>
        <div class="modal-footer">          
          <input type="submit" name="submit" value="Submit" class="btn btn-warning"> 
          <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
        </div>
      </form>
      </div>
      
    </div>
  </div>

  <!-- Modal Edit-->
  <div class="modal fade" id="modalEdit" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Ubah Data Pengajuan</h4>
        </div>
        <form action="edit_pinjaman.php" method="POST">
          <div class="modal-body">
            <div class="form-group">
              <label for="besar_pinjaman">Besar Pinjaman</label>
              <input type="hidden" id="id" name="id"> 
              <input type="number" class="form-control" id="besar_pinjaman" name="besar_pinjaman" >
            </div>
            <div class="form-group">
              <label for="keperluan">Keperluan Untuk</label>
              <select class="form-control" id="keperluan" name="keperluan">
                <option value="Modal Usaha">Modal Usaha</option>
                <option value="Berobat">Berobat</option>
                <option value="Sekolah">Biaya Sekolah</option>
                <option value="Sembako">Kebutuhan Sehari-hari</option>
                <option value="Hajatan">Hajatan</option>
              </select>
            </div>
            <div class="form-group">
              <label for="jangka">Keperluan Untuk</label>
              <select class="form-control" id="jangka" name="jangka">
                <option value="5">5 bulan</option>
                <option value="10">10 bulan</option>
                <option value="20">20 bulan</option>
              </select>
            </div>
        </div>
        <div class="modal-footer">          
          <input type="submit" name="submit" value="Submit" class="btn btn-warning"> 
          <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
        </div>
      </form>
      </div>
      
    </div>
  </div>

  <!-- Modal Hapus-->
  <div id="modalHapus" class="modal fade" role="dialog">
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

$(document).ready(function() {

    // Untuk sunting
    $('#modalEdit').on('show.bs.modal', function (event) {
        var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
        var modal          = $(this)

        // Isi nilai pada field
        modal.find('#id').attr("value",div.data('id'));
        modal.find('#besar_pinjaman').attr("value",div.data('besar_pinjaman'));
        modal.find('#keperluan').attr("value",div.data('keperluan'));
        modal.find('#jangka_waktu').attr("value",div.data('jangka_waktu'));
    });
});
</script>
</html>