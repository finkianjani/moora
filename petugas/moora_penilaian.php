<?php
    $sqlAnggota = "SELECT * FROM user WHERE username = '".$_SESSION['username']."'";
    $queryAnggota = mysqli_query($koneksi, $sqlAnggota);
    $anggota = mysqli_fetch_array($queryAnggota);
?> 
<?php
  $sqlPengajuan = "SELECT a.id, a.besar_pinjaman, a.status_keanggotaan, a.status_pinjaman, a.keperluan, a.jangka_waktu, b.saldo_pinjaman, c.jumlah from tb_pengajuan a JOIN tb_pinjaman b on a.id_peminjam = b.id_anggota JOIN tb_simpanan c on a.id_peminjam = c.id_anggota";
  $queryPengajuan = mysqli_query($koneksi, $sqlPengajuan);
  $no = 1;
  
  function getNilai($kriteria,$sub) {
    include("koneksi.php");
    $sql = "SELECT nilai FROM `tb_subkriteria` WHERE kode_kriteria = '".$kriteria."' && subkriteria = '".$sub."'";
    $q = mysqli_query($koneksi, $sql);
    $k = mysqli_fetch_array($q);
    return $k['nilai'];
  }

  function insertNilai(){
    include("koneksi.php");
    global $queryPengajuan;
    $nilai = array();
    foreach ($queryPengajuan as $key => $value) {
      $cek = $value['jumlah'] * 3;
      $k3 = '';
      if($value['besar_pinjaman'] == $cek)
        $k3 = '= 3x simpanan';
      elseif ($value['besar_pinjaman'] < $cek) {
        $k3 = '< 3x simpanan';
      }else{
        $k3 = '> 3x simpanan';
      }
      $a1 = getNilai('K1',$value['status_keanggotaan']);
      $a2 = getNilai('K2',$value['status_pinjaman']);
      $a3 = getNilai('K3',$k3);
      $a4 = getNilai('K4',$value['keperluan']);
      $a5 = getNilai('K5',$value['jangka_waktu']);
      $sql2 = "SELECT id_pengajuan FROM `tb_penilaian` WHERE id_pengajuan = '".$value['id']."'";
      $q = mysqli_query($koneksi, $sql2);
      $k = mysqli_fetch_array($q);
      if (!$k) {         
        $sql = "INSERT INTO tb_penilaian (id_pengajuan, a1, a2, a3, a4, a5) VALUE (".$value['id'].",".$a1.",".$a2.",".$a3.",".$a4.",".$a5.")";
        $query = mysqli_query($koneksi, $sql);
      } 
    }
  }
?>    
<h4>PENILAIAN</h4>
<hr /> 
<div class="row">
  <div class="col-md-10 no-padding">
    <h4>DATA AWAL</h4>    
  </div>
  <div class="col-md-2"> 
    <form method="post">
        <input type="submit" name="test" id="test" value="PROSES" class="btn btn-success btn-block" />
    </form>
    <?php
      if(array_key_exists('test',$_POST)){
         insertNilai();
      }
    ?>    
  </div>
</div>  
<table class="table table-bordered">
  <thead>
    <tr>
      <th class="text-center">Alternatif</th>
      <th class="text-center">K1</th>
      <th class="text-center">K2</th>
      <th class="text-center">K3</th>
      <th class="text-center">K4</th>
      <th class="text-center">K5</th>
    </tr>
  </thead>
  <tbody>
    <?php while($listPengajuan = mysqli_fetch_array($queryPengajuan)){ ?>
      <tr class="success">
      	<td class="text-center">A<?php echo $no++?></td>
        <td class="text-center"><?php echo getNilai('K1',$listPengajuan['status_keanggotaan']) ?></td>
        <td class="text-center"><?php echo getNilai('K2',$listPengajuan['status_pinjaman']) ?></td>
        <td class="text-center">
        	<?php 
        		$cek = $listPengajuan['jumlah'] * 3;
        		$k3 = '';
        		if($listPengajuan['besar_pinjaman'] == $cek)
        			$k3 = '= 3x simpanan';
        		elseif ($listPengajuan['besar_pinjaman'] < $cek) {
        			$k3 = '< 3x simpanan';
        		}else{
        			$k3 = '> 3x simpanan';
        		}
        		echo getNilai('K3',$k3);
    		  ?>
        </td>
        <td class="text-center"><?php echo getNilai('K4',$listPengajuan['keperluan']) ?></td>
        <td class="text-center"><?php echo getNilai('K5',$listPengajuan['jangka_waktu']) ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
<?php
  $sql3 = "SELECT * FROM `tb_penilaian` ";
  $q3 = mysqli_query($koneksi, $sql3);
  $d = array();
  $id_pengajuan = array();
  foreach ($q3 as $key => $value) {
    array_push($d, $value['a1']);
    array_push($d, $value['a2']);
    array_push($d, $value['a3']);
    array_push($d, $value['a4']);
    array_push($d, $value['a5']);
    array_push($id_pengajuan, $value['id_pengajuan']);
  }
  $column = 5;
  $arr = array_chunk($d, $column);
?>
<h4>DATA ALTERNATIF</h4>
<hr />    
<table class="table table-bordered">
  <thead>
    <tr>
      <th class="text-center">Alternatif</th>
      <th class="text-center">K1</th>
      <th class="text-center">K2</th>
      <th class="text-center">K3</th>
      <th class="text-center">K4</th>
      <th class="text-center">K5</th>
    </tr>
  </thead>
  <tbody>
      <?php if($arr) { for ($i=0; $i < count($arr); $i++) { ?>
        <tr class="success">
          <td class="text-center"><?php echo "A".($i) ?></td>
          <?php for ($j=0; $j < 5; $j++) { ?>
            <td class="text-center"><?php echo $arr[$i][$j]; ?></td>
          <?php } ?>
        </tr>
      <?php }}?>
  </tbody>
</table>
<?php     
  if($arr) {
    for ($u=0; $u < 5; $u++) { 
      $t = 0;
      $z = 0;
      for ($v=0; $v < 5; $v++) { 
        $t = $t+($arr[$v][$u]*$arr[$v][$u]);
      }

      for ($w=0; $w < count($arr); $w++) { 
        $arr[$w][$u] = $arr[$w][$u]/sqrt($t);
        $arr[$w][$u] = round($arr[$w][$u],2);
      }
    }
  }
?>
<h4>MATRIKS NORMALISASI</h4>
<hr />    
<table class="table table-bordered">
  <thead>
    <tr>
      <th class="text-center">Alternatif</th>
      <th class="text-center">K1</th>
      <th class="text-center">K2</th>
      <th class="text-center">K3</th>
      <th class="text-center">K4</th>
      <th class="text-center">K5</th>
    </tr>
  </thead>
  <tbody>
    <?php if($arr) { for ($i=0; $i < count($arr); $i++) { ?>
      <tr class="success">
        <td class="text-center"><?php echo "A".($i) ?></td>
        <?php for ($j=0; $j < 5; $j++) { ?>
          <td class="text-center"><?php echo $arr[$i][$j]; ?></td>
        <?php } ?>
      </tr>
    <?php }} ?>
  </tbody>
</table>
<div class="row">
  <div class="col-md-6">
    <?php
      if($arr) {
        $d = array();
        $f = array();
        $g = array();
        for ($i=0; $i < count($arr); $i++) { 
          $e = 0;
          for ($j=0; $j < 5; $j++) { 
            if ($j != 2 || $j != 4) {
              $e = $e+$arr[$i][$j]; 
            } else{
              $e = $e-$arr[$i][$j];
            }
          }
          $d["A".$i] = $e;
          $f["A".$i] = $e;
          $g[$id_pengajuan[$i]] = $e;
        }
      }
    ?>
    <h4>NILAI OPTIMASI</h4>
    <hr />    
    <table class="table table-bordered">
      <thead>
        <tr>
          <th class="text-center">Alternatif</th>
          <th class="text-center">Nilai</th>
        </tr>
      </thead>
      <tbody>
        <?php if($arr) { foreach($d as $x => $x_value) { ?>
          <tr class="success">
            <td class="text-center"><?php echo $x ?></td>
            <td class="text-center"><?php echo $x_value; ?></td>
          </tr>
        <?php }} ?>
      </tbody>
    </table>    
  </div>
  <div class="col-md-6">
    <?php
      rsort($d);
    ?>  
    <h4>RANGKING</h4>
    <hr />    
    <table class="table table-bordered">
      <thead>
        <tr>
          <th class="text-center">Alternatif</th>
          <th class="text-center">Nilai</th>
        </tr>
      </thead>
      <tbody>
        <?php if($arr) { foreach($d as $x => $x_value) { 
          $key = array_search ($x_value, $f); ?>
          <tr class="success">
            <td class="text-center"><?php echo $key ?></td>
            <td class="text-center"><?php echo $x_value; ?></td>
          </tr>
        <?php }} ?>
      </tbody>
    </table>    
  </div>
  <?php 
    if($arr) { 
      foreach($d as $x => $x_value) {
        $key = array_search($x_value, $g);
        $sql4 = "UPDATE tb_penilaian SET rank=".($x+1)." WHERE id_pengajuan=".$key;
        $query4 = mysqli_query($koneksi, $sql4);
      }
    } 
  ?>
</div>