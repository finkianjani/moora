<?php
include "../administrator/koneksi.php";

  $count_kriteria = mysql_num_rows(mysql_query("select * from kriteria"));
?>
<aside class="right-side">
    <!-- Content Header (Page header) -->
<section class="content-header">
  <h1>
      Data
      <small>Perangkingan Promosi Jabatan Pegawai</small>
  </h1>
  <ol class="breadcrumb">
      <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
      <li><a href="">Tables</a></li>
      <li class="active">Data Perangkingan</li>
  </ol>
</section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">

                <div class="box box-danger box-solid">
                    <div class="box-header with-border">
                      <h3 class="box-title"> Alternatif Promosi</h3>
                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div><!-- /.box-tools -->
                    </div>

                      <div class="box-body table-responsive">
                      <table class="table table-bordered table-striped">
                          <thead>
                            <?php
                            $query = "select * from kriteria";
                            $execute = mysql_query($query);
                            ?>
                              <tr>
                                  <th>No</th>
                                  <th>Nama Alternatif</th>
                                 <?php while($row = mysql_fetch_array($execute)) {?>
                                      <td><?php echo $row['NAMA_KRITERIA']; ?></td>
                                <?php
                                      }?>
                              </tr>
                          </thead>
                          <tbody>
                            <?php
                                $query = "select * from alternatif";
                                $execute = mysql_query($query);
                                $krtr = mysql_num_rows(mysql_query("describe alternatif"));
                                $no = 1;
                                $jumlah_ik = 0;
                                $jumlah_pk = 0;
                                $jumlah_tj = 0;
                                $jumlah_ly = 0;
                                $jumlah_kj = 0;
                                while($row = mysql_fetch_array($execute)) {
                                  ?>
                                  <tr>
                                    <td><?php echo $no++ ;?></td>
                                    <td><?php echo $row[1] ;?></td>
                                    

                                    <?php
                                    for($i = 4; $i< $krtr; $i++) {

                                      ?>

                                    <td><?php echo $row[$i]; ?></td>

                                    <?php
                                    $kr[$i] += pow($row[$i],2);
                                    

                                    $jumlah[$i] = sqrt($kr[$i]);
                                    }

                                    ?>
                                  </tr>

                                  <?php
                                  
                                }
                                 

                                echo "<tr>
                                  <td colspan='2'> Pengakaran </td>
                                  ";
                                  

                                  for($i = 4; $i< $krtr; $i++) {

                                      ?>

                                    <td><?php echo $jumlah[$i]; ?></td>

                                    <?php
                                    }
                              
                                  
                                  echo "
                                </tr>";
                                ?>
                          </tbody>
                        </table>
                      </div>
                </div>

                <div class="box box-danger box-solid">
                    <div class="box-header with-border">
                      <h3 class="box-title">Perhitungan Moora</h3>
                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div><!-- /.box-tools -->
                    </div>
                    <div class="box-body table-responsive">
                          <table id="example1" class="table table-bordered table-striped">
                          <thead>
                          <?php
                            $query = "select * from kriteria";
                            $execute = mysql_query($query);
                            ?>
                              <tr>
                                  <th>No</th>
                                  <th>Nama Alternatif</th>
                                 <?php while($row = mysql_fetch_array($execute)) {?>
                                      <td><?php echo $row['NAMA_KRITERIA']; ?></td>
                                <?php
                                      }?>
                                  <th>Y=max-min</th>
                                  </tr>
                          </thead>
                          <tbody>
                            <?php
                                $query_kriteria = "select * from kriteria";
                                $execute_kriteria = mysql_query($query_kriteria);
                                $simpan = mysql_fetch_array(mysql_query("SELECT * FROM kriteria ORDER BY ID_KRITERIA ASC"));
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

                                $y = 0;

                                for($i = 0; $i < $count_kriteria; $i++) {
                                  if($krit[$i] == $simpan){
                                    $krit[$i] = ($krit[$i]*-1);
                                  }

                                }
                                while($row = mysql_fetch_array($execute)) {
                                  
                                   
                                      for($i = 4; $i< $krtr; $i++) {

                                         $rk[$i] = ($row[$i]/$jumlah[$i]);
                                         $rf[$i] = substr($rk[$i], 0,4);

                                          $k = $i - 4;

                                          $rx = $rk[$i] * $krit[$k];

                                          $xt = $krtr - 1;
                                
                                          

                                          if($i == 4) {
                                            $y = 0;
                                          }
                                          else {
                                          
                                          }

                                          

                                            $y += $rx;

                                          $k++;

                                    }






                                    


                                  $resulty = substr($y, 0,4);


                                  echo "<tr>
                                    <td>".$no++."</td>
                                    <td>".$row[1]."</td>";

                                    for($i = 4; $i< $krtr; $i++) {

                                        
                                         ?>
                                         <td><?php echo $rf[$i]; ?></td>
                                         <?php

                                    }
                                    ?>

                                    <td><?php echo $resulty; ?></td>
                                  </tr>

                                  <?php
                                }
                                ?>

                                </tbody>
                            </table>
                    </div>
                </div>


                <div class="box box-danger box-solid">
                    <div class="box-header with-border">
                      <h3 class="box-title">Rangking</h3>
                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div><!-- /.box-tools -->
                    </div>
                    <div class="box-body table-responsive">
                      <table id="example2" class="table table-bordered table-striped">
                          <thead>
                          <tr>
                                  <th>Rank</th>
                                  <th>Nama Alternatif</th>
                                  <th>Total Hasil</th>
                          </tr>
                          </thead>
                        <tbody>
                            <?php
                                $query_kriteria = "select * from kriteria";
                                $execute_kriteria = mysql_query($query_kriteria);
                                $simpan = mysql_fetch_array(mysql_query("SELECT * FROM kriteria ORDER BY ID_KRITERIA ASC"));
                                while ($rows_kriteria = mysql_fetch_array($execute_kriteria)) {
                                  # code...
                                  if($simpan > $rows_kriteria[2]){
                                    $simpan = $rows_kriteria[2];
                                    $kriteria = $rows_kriteria[0];
                                  }
                                  $krit[] = $rows_kriteria[2];
                                }

//ranking
                                $query = "select * from alternatif";
                                $execute = mysql_query($query);
                                $no = 1;
                                 for($i = 0; $i < $count_kriteria; $i++) {
                                  if($krit[$i] == $simpan){
                                    $krit[$i] = ($krit[$i]*-1);
                                  }

                                }
                                $rank = array();
                                $alasan = array();
                                $x_alasan = array();
                                $rg = array();
                                $xs = array();

                                $za = mysql_query("desc alternatif");
                                $x_no = 0;
                                $gx = array();
                                while($sf = mysql_fetch_assoc($za)) {
                                  if($x_no >= 4) {
                                  $gx += array($x_no => $sf['Field']);
                               }
                                  $x_no ++;
                                }

                                

                                while($row = mysql_fetch_array($execute)) {

                    

                                   for($i = 4; $i< $krtr; $i++) {
                                         $rk[$i] = ($row[$i]/$jumlah[$i]);
                                         $rkl[$gx[$i]] = substr($rk[$i], 0,4);





                                          $k = $i - 4;

                                          $rx = $rk[$i] * $krit[$k];

                                          $xt = $krtr - 1;
                                          

                                          

                                          if($i == 4) {
                                            $y = $rx;
                                          }
                                          else {
                                            $y += $rx;
                                          }

                                        $k++;

                            
}


                        $xsf = max($rkl);





                     //   var_dump($rf);

                        

                



                            $queryz = "select * from kriteria";
                            $executez = mysql_query($queryz);
                            while($rowz = mysql_fetch_array($executez)) {
                              $xs += array($row[1] => $xsf
                                );
                             
                                      }

                                $xss[$row[1]] += $xsf;
                                   



                                  
                                  $result= substr($y, 0,4);
                                 $rank[$row[1]] += $result;

                                 $z = array();


                                                                             foreach ($rkl as $key => $val)
                        {
                            if ($val == $xsf) {
                              $zs = $key;
                              $xz = $val;
                            }

                        }

                        $alasan[$row[1]] = $zs;
                        $x_alasan[$row[1]] = $xz;
                                  
                                }

                             //   var_dump($xs['Rifki alfaridzi']);
                                 

                                arsort($rank);
                                $ranking = 1;
                                foreach($rank as $key => $val) {

                                  echo "<tr>
                                    <td>".$ranking."</td>
                                    <td>".$key."</td>
                                     <td>".$val."</td>
                                        </tr>";
                                  $ranking++;
                                }

                                $reset = array_keys($rank);

                                
                                

                                




                                




                                ?>



                        </tbody>
                      </table>

                      <?php

                      foreach($alasan as $key => $val) {
                                  if($key == $reset[0]) {
                                    echo "<center><h4 style='font-weight: 300'>".$key ." mendapat rank 1 karena bobot <span style='font-weight: 700'> ". ucfirst(str_replace('_',' ', $val)). ' </span> yang tinggi </h4></center>';

                                     foreach($x_alasan as $keyz => $valz) {
                                      if($keyz == $reset[0]) {
                                      echo "<center><h4 style='font-weight: 300'>Jumlah bobot  ". ucfirst(str_replace('_',' ', $val)). " nya sebesar <span style='font-weight: 700'>".$valz.'</span></h4></center>';
                                      }
                                    }

                                  }
                                }


                               



                      ?>

                    </div>
                </div>

            </div>
        </div>
  </section>
</aside>
