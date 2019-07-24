<?php
    $sqlAnggota = "SELECT * FROM user WHERE username = '".$_SESSION['username']."'";
    $queryAnggota = mysqli_query($koneksi, $sqlAnggota);
    $anggota = mysqli_fetch_array($queryAnggota);
?>    
 
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
</table>