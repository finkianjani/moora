<?php
    $sqlAnggota = "SELECT * FROM user WHERE username = '".$_SESSION['username']."'";
    $queryAnggota = mysqli_query($koneksi, $sqlAnggota);
    $anggota = mysqli_fetch_array($queryAnggota);
?>    
 
<h2>MASTER KRITERIA</h2>
<hr />      
<button type="button" class="btn btn-info pull-right" style="margin-bottom: 10px" data-toggle="modal" data-target="#">
  <span class="glyphicon glyphicon-plus"></span>
</button>
<table class="table table-bordered">
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
            data-besar_pinjaman="<?php echo $listKriteria['kriteria'] ?>"
            data-keperluan="<?php echo $listKriteria['jenis'] ?>"
            data-toggle="modal" data-target="#"
            class="btn btn-warning">
              <span class="glyphicon glyphicon-edit"></span>
          </a> 
          <a 
            href="javascript:;"
            data-id="<?php echo $listKriteria['id'] ?>"
            data-toggle="modal" data-target="#"
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
        <h4 class="modal-title">Form Pengajuan</h4>
      </div>
      <form action="petugas/post_kriteria.php" method="POST">
        <div class="modal-body">
          <div class="form-group">
            <label for="id_pengaju">Kode</label>
            <input type="text" class="form-control" id="kode" name="kode" >
          </div>
          <div class="form-group">
            <label for="nama">Kriteria</label>
            <input type="text" class="form-control" id="kriteria" name="kriteria" >
          </div>
          <div class="form-group">
            <label for="keperluan">Jenis</label>
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