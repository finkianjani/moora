<h2>MASTER PETUGAS</h2>
<hr />      
<button type="button" class="btn btn-info pull-right" style="margin-bottom: 10px" data-toggle="modal" data-target="#modalTambah">
  <span class="glyphicon glyphicon-plus"></span>
</button>
<table class="table table-bordered" id="tabel-data">
  <thead>
    <tr>
      <th class="text-center">Nama</th>
      <th class="text-center">Username</th>
      <th class="text-center">Status</th>
      <th class="text-center">Aksi</th>
    </tr>
  </thead>
  <tbody>
    <?php
      $sql = "SELECT * FROM user WHERE level = 'petugas'";
      $query = mysqli_query($koneksi, $sql);
    ?>
    <?php while($list = mysqli_fetch_array($query)){ ?>
      <tr class="success">
        <td><?php echo $list['nama']; ?></td>
        <td><?php echo $list['username']; ?></td>
        <td class="text-center"><?php echo $list['status']; ?></td>
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