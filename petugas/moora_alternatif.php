<?php
    $sqlAnggota = "SELECT * FROM user WHERE username = '".$_SESSION['username']."'";
    $queryAnggota = mysqli_query($koneksi, $sqlAnggota);
    $anggota = mysqli_fetch_array($queryAnggota);
?>    
 
<h2>DATA ALTERNATIF</h2>
<hr />   
<table class="table table-bordered">
  <thead>
    <tr>
      <th class="text-center">Alternatif</th>
      <th class="text-center">Nama</th>
      <th class="text-center">K1</th>
      <th class="text-center">K2</th>
      <th class="text-center">K3</th>
      <th class="text-center">K4</th>
      <th class="text-center">K5</th>
    </tr>
  </thead>
  <tbody>
    <?php
      $sqlPengajuan = "SELECT a.besar_pinjaman, a.status_keanggotaan, a.status_pinjaman, a.keperluan, a.jangka_waktu, b.saldo_pinjaman, b.nama_anggota, c.jumlah from tb_pengajuan a JOIN tb_pinjaman b on a.id_peminjam = b.id_anggota JOIN tb_simpanan c on a.id_peminjam = c.id_anggota";
      $queryPengajuan = mysqli_query($koneksi, $sqlPengajuan);
      $no = 1;
    ?>
    <?php while($listPengajuan = mysqli_fetch_array($queryPengajuan)){ ?>
      <tr class="success">
      	<td class="text-center">A<?php echo $no++?></td>
        <td><?php echo $listPengajuan['nama_anggota']; ?></td>
        <td class="text-center"><?php echo $listPengajuan['status_keanggotaan']; ?></td>
        <td class="text-center"><?php echo $listPengajuan['status_pinjaman']; ?></td>
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
        		echo $k3;
    		?>
        </td>
        <td class="text-center"><?php echo $listPengajuan['keperluan']; ?></td>
        <td class="text-center"><?php echo $listPengajuan['jangka_waktu']; ?> bulan</td>
      </tr>
    <?php } ?>
  </tbody>
</table>