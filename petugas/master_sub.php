<h2>MASTER SUB</h2>
<hr />      
<button type="button" class="btn btn-info pull-right" style="margin-bottom: 10px" data-toggle="modal" data-target="#modalTambah">
  <span class="glyphicon glyphicon-plus"></span>
</button>
<table class="table table-bordered">
  <thead>
    <tr>
      <th class="text-center">Kode Kriteria</th>
      <th class="text-center">Subkriteria</th>
      <th class="text-center">Nilai</th>
      <th class="text-center">Aksi</th>
    </tr>
  </thead>
  <tbody>
    <?php
      $sqlKriteria = "SELECT * FROM tb_subkriteria";
      $queryKriteria = mysqli_query($koneksi, $sqlKriteria);
    ?>
    <?php while($listKriteria = mysqli_fetch_array($queryKriteria)){ ?>
      <tr class="success">
        <td class="text-center"><?php echo $listKriteria['kode_kriteria']; ?></td>
        <td><?php echo $listKriteria['subkriteria']; ?></td>
        <td class="text-center"><?php echo $listKriteria['nilai']; ?></td>
        <td class="text-center"> 
          <a 
            href="javascript:;"
            data-toggle="modal" data-target="#"
            class="btn btn-warning">
              <span class="glyphicon glyphicon-edit"></span>
          </a> 
          <a 
            href="javascript:;"
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
        <h4 class="modal-title">Tambah Subkriteria</h4>
      </div>
      <form action="petugas/post_subkriteria.php" method="POST">
        <div class="modal-body">
          <div class="form-group">
            <label for="kode_kriteria">Kode Kriteria</label>
            <select class="form-control" id="kode_kriteria" name="kode_kriteria">
              <option value="K1">K1</option>
              <option value="K2">K2</option>
              <option value="K3">K3</option>
              <option value="K4">K4</option>
              <option value="K5">K5</option>
            </select>
          </div>
          <div class="form-group">
            <label for="subkriteria">Subkriteria</label>
            <input type="text" class="form-control" id="subkriteria" name="subkriteria" >
          </div>
          <div class="form-group">
            <label for="nilai">Nilai</label>
            <input type="number" class="form-control" id="nilai" name="nilai" >
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