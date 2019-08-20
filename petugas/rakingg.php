<div class="box-body table-responsive">
                          <table id="example1" class="table table-bordered table-striped">
                          <thead>
                          <tr>
                                  <th>No</th>
                                  <th>Nama Alternatif</th>
                                  <th>Inisiatif Kerja</th>
                                  <th>Prestasi Kerja</th>
                                  <th>Tanggung Jawab</th>
                                  <th>Loyalitas</th>
                                  <th>Kejujuran</th>
                                  <th>Y=max-min</th>
                                  </tr>
                          </thead>
                          <tbody>

<?php
 include('../koneksi/administrator.php');
                                $query_kriteria = "select * from kriteria";
                                $execute_kriteria = mysql_query($query_kriteria);
                                $simpan = mysql_fetch_array(mysql_query("SELECT * FROM kriteria"));
                                while ($rows_kriteria = mysql_fetch_array($execute_kriteria)) {
                  
                                  # code...
                                  if($simpan > $rows_kriteria[2]){
                                    $simpan = $rows_kriteria[2];
                                    $kriteria = $rows_kriteria[0];
                                  }
                                  $krit[] = $rows_kriteria[2];
                                }
                                $query = "select * from alternatif";
                                $execute = mysql_query($query);
                                $no = 1;
                                if($krit[0] == $simpan){
                                  $krit[0] = ($krit[0]*-1);
                                } else if($krit[1] == $simpan){
                                  $krit[1] = ($krit[1]*-1);
                                } else if($krit[2] == $simpan){
                                  $krit[2] = ($krit[2]*-1);
                                } else if($krit[3] == $simpan){
                                  $krit[3] = ($krit[3]*-1);
                                } else if($krit[4] == $simpan){
                                  $krit[4] = ($krit[4]*-1);
                                }
                                while($row = mysql_fetch_array($execute)) {
                                  $ik = ($row[4]/$jumlah_ik);
                                  $resultik = substr($ik, 0,4);
                                  $pk = ($row[5]/$jumlah_pk);
                                  $resultpk = substr($pk, 0,4);
                                  $tj = ($row[6]/$jumlah_tj);
                                  $resulttj = substr($tj, 0,4);
                                  $ly = ($row[7]/$jumlah_ly);
                                  $resultly = substr($ly, 0,4);
                                  $kj = ($row[8]/$jumlah_kj);
                                  $resultkj = substr($kj, 0,4);
                                  $y = ($ik*$krit[0])+($pk*$krit[1])+($tj*$krit[2])+($ly*$krit[3])+($kj*$krit[4]);
                                  $resulty = sort($y);
                                  echo "<tr>
                                    <td>".$no++."</td>
                                    <td>".$row[1]."</td>
                                    <td>".$resultik."</td>
                                    <td>".$resultpk."</td>
                                    <td>".$resulttj."</td>
                                    <td>".$resultly."</td>
                                    <td>".$resultkj."</td>
                                    <td>".$resulty."</td>
                                  </tr>";
                                }
                                ?>