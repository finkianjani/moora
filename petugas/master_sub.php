<h2>MASTER SUB</h2>
<hr />      
<button type="button" class="btn btn-info pull-right" style="margin-bottom: 10px" data-toggle="modal" data-target="#">
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