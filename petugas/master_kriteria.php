<?php
    $sqlAnggota = "SELECT * FROM user WHERE username = '".$_SESSION['username']."'";
    $queryAnggota = mysqli_query($koneksi, $sqlAnggota);
    $anggota = mysqli_fetch_array($queryAnggota);
?>    
 
<h2>MASTER KRITERIA</h2>
<hr />      
<button type="button" class="btn btn-info pull-right" style="margin-bottom: 10px" data-toggle="modal" data-target="#modalTambah">
  <span class="glyphicon glyphicon-plus"></span>
</button>
<table class="table table-bordered" id="tabel-data">
  <thead>
    <tr>
      <th class="text-center">Kode</th>
      <th class="text-center">Kriteria</th>
      <th class="text-center">Jenis</th>
      <th class="text-center">Aksi</th>
    </tr>
  </thead>
  <tbody>
    <?php
      $sqlKriteria = "SELECT * FROM tb_kriteria";
      $queryKriteria = mysqli_query($koneksi, $sqlKriteria);
    ?>
    <?php while($listKriteria = mysqli_fetch_array($queryKriteria)){ ?>
      <tr class="success">
        <td class="text-center"><?php echo $listKriteria['kode']; ?></td>
        <td><?php echo $listKriteria['kriteria']; ?></td>
        <td class="text-center"><?php echo $listKriteria['jenis']; ?></td>
        <td class="text-center"> 
          <a 
            href="javascript:;"
            data-id="<?php echo $listKriteria['id'] ?>"
            data-kode="<?php echo $listKriteria['kode'] ?>"
            data-kriteria="<?php echo $listKriteria['kriteria'] ?>"
            data-jenis="<?php echo $listKriteria['jenis'] ?>"
            data-toggle="modal" data-target="#modalEdit"
            class="btn btn-warning">
              <span class="glyphicon glyphicon-edit"></span>
          </a> 
          <a 
            href="javascript:;"
            data-id="<?php echo $listKriteria['id'] ?>"
            data-toggle="modal" data-target="#modalHapus"
            class="btn btn-danger">
              <span class="glyphicon glyphicon-trash"></span>
          </a>           
        </td>
      </tr>
    <?php } ?>
  </tbody>
</table>

<!-- Modal Tambah-->
<div class="modal fade" id="modalTambah" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Tambah Kriteria</h4>
      </div>
      <form action="petugas/post_kriteria.php" method="POST">
        <div class="modal-body">
          <div class="form-group">
            <label for="kode">Kode</label>
            <input type="text" class="form-control" id="kode" name="kode" >
          </div>
          <div class="form-group">
            <label for="kriteria">Kriteria</label>
            <input type="text" class="form-control" id="kriteria" name="kriteria" >
          </div>
          <div class="form-group">
            <label for="jenis">Jenis</label>
            <select class="form-control" id="jenis" name="jenis">
              <option value="Cost">Cost</option>
              <option value="Benefit">Benefit</option>
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
        <h4 class="modal-title">Edit Kriteria</h4>
      </div>
      <form action="petugas/edit_kriteria.php" method="POST">
        <div class="modal-body">
          <div class="form-group">
            <label for="kode">Kode</label>
            <input type="text" id="id" name="id"> 
            <input type="text" class="form-control" id="kode" name="kode" >
          </div>
          <div class="form-group">
            <label for="kriteria">Kriteria</label>
            <input type="text" class="form-control" id="kriteria" name="kriteria" >
          </div>
          <div class="form-group">
            <label for="jenis">Jenis</label>
            <select class="form-control" id="jenis" name="jenis">
              <option value="Cost">Cost</option>
              <option value="Benefit">Benefit</option>
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
        <h4 class="modal-title">Hapus Kriteria</h4>
      </div>
      <form action="petugas/hapus_kriteria.php" method="POST">
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
        modal.find('#kode').attr("value",div.data('kode'));
        modal.find('#kriteria').attr("value",div.data('kriteria'));
        modal.find('#jenis').attr("value",div.data('jenis'));
    });
});
</script>