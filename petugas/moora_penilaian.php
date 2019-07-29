<?php
    $sqlAnggota = "SELECT * FROM user WHERE username = '".$_SESSION['username']."'";
    $queryAnggota = mysqli_query($koneksi, $sqlAnggota);
    $anggota = mysqli_fetch_array($queryAnggota);
?> 
<?php
  $sqlPengajuan = "SELECT a.besar_pinjaman, a.status_keanggotaan, a.status_pinjaman, a.keperluan, a.jangka_waktu, b.saldo_pinjaman, c.jumlah from tb_pengajuan a JOIN tb_pinjaman b on a.id_peminjam = b.id_anggota JOIN tb_simpanan c on a.id_peminjam = c.id_anggota";
  $queryPengajuan = mysqli_query($koneksi, $sqlPengajuan);
  $no = 1;
  
  function getNilai($kriteria,$sub) {
    include("koneksi.php");
    $sql = "SELECT nilai FROM `tb_subkriteria` WHERE kode_kriteria = '".$kriteria."' && subkriteria = '".$sub."'";
    $q = mysqli_query($koneksi, $sql);
    $k = mysqli_fetch_array($q);
    echo $k['nilai'];
  }
?>   
<!--  
<h2>PENILAIAN</h2>
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
      <th class="text-center">Hasil</th>
    </tr>
  </thead>
  <tbody>
    <?php while($listPengajuan = mysqli_fetch_array($queryPengajuan)){ ?>
      <tr class="success">
      	<td class="text-center">A<?php echo $no++?></td>
        <td class="text-center"><?php getNilai('K1',$listPengajuan['status_keanggotaan']) ?></td>
        <td class="text-center"><?php getNilai('K2',$listPengajuan['status_pinjaman']) ?></td>
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
        		getNilai('K3',$k3);
    		  ?>
        </td>
        <td class="text-center"><?php getNilai('K4',$listPengajuan['keperluan']) ?></td>
        <td class="text-center"><?php getNilai('K5',$listPengajuan['jangka_waktu']) ?></td>
        <td></td>
      </tr>
    <?php } ?>
  </tbody>
</table> -->
<?php 
  $arr = array(
    array(50,10,50,50,20),
    array(50,50,10,30,30),
    array(20,50,10,10,20),
    array(50,50,50,20,30),
    array(20,10,10,40,50)
  );
?>  
<h2>DATA ALTERNATIF</h2>
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
    <?php for ($i=0; $i < 5; $i++) { ?>
      <tr class="success">
        <td class="text-center"><?php echo "A".($i+1) ?></td>
        <?php for ($j=0; $j < 5; $j++) { ?>
          <td class="text-center"><?php echo $arr[$i][$j]; ?></td>
        <?php } ?>
      </tr>
    <?php } ?>
  </tbody>
</table>
<?php     
  for ($u=0; $u < 5; $u++) { 
    $t = 0;
    $z = 0;
    for ($v=0; $v < 5; $v++) { 
      $t = $t+($arr[$v][$u]*$arr[$v][$u]);
    }

    for ($w=0; $w < 5; $w++) { 
      $arr[$w][$u] = $arr[$w][$u]/sqrt($t);
      $arr[$w][$u] = round($arr[$w][$u],2);
    }
  }
?>
<h2>MATRIKS NORMALISASI</h2>
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
    <?php for ($i=0; $i < 5; $i++) { ?>
      <tr class="success">
        <td class="text-center"><?php echo "A".($i+1) ?></td>
        <?php for ($j=0; $j < 5; $j++) { ?>
          <td class="text-center"><?php echo $arr[$i][$j]; ?></td>
        <?php } ?>
      </tr>
    <?php } ?>
  </tbody>
</table>
<div class="row">
  <div class="col-md-6">
    <?php
      $d = array();
      for ($i=0; $i < 5; $i++) { 
        $e = 0;
        for ($j=0; $j < 5; $j++) { 
          if ($j != 2) {
           $e = $e+$arr[$i][$j]; 
          } else{
            $e = $e-$arr[$i][$j];
          }
        }
        $d[$i] = $e;
      }
    ?>
    <h2>NILAI OPTIMASI</h2>
    <hr />    
    <table class="table table-bordered">
      <thead>
        <tr>
          <th class="text-center">Alternatif</th>
          <th class="text-center">Nilai</th>
        </tr>
      </thead>
      <tbody>
        <?php for ($i=0; $i < 5; $i++) { ?>
          <tr class="success">
            <td class="text-center"><?php echo "A".($i+1) ?></td>
            <td class="text-center"><?php echo $d[$i]; ?></td>
          </tr>
        <?php } ?>
      </tbody>
    </table>    
  </div>
  <div class="col-md-6">
    <?php
      rsort($d);
    ?>  
    <h2>RANGKING</h2>
    <hr />    
    <table class="table table-bordered">
      <thead>
        <tr>
          <th class="text-center">Alternatif</th>
          <th class="text-center">Nilai</th>
        </tr>
      </thead>
      <tbody>
        <?php for ($i=0; $i < 5; $i++) { ?>
          <tr class="success">
            <td class="text-center"><?php echo "A".($i+1) ?></td>
            <td class="text-center"><?php echo $d[$i]; ?></td>
          </tr>
        <?php } ?>
      </tbody>
    </table>    
  </div> 
  </div>
</div>  