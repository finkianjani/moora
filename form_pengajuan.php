    <html>
    <head>
        <title>Download Script Form Input Data | PHP MySQL Tutorial</title>
        <style type="text/css" media="screen">
            table {font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 11px;}
            input {font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 11px;height: 20px;}
        </style>
    </head>
    <body>
    <div style="border:0; padding:10px; width:760px; height:auto;">
    <form action="action-input-data.php" method="POST" name="form-input-data">
        <table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr height="46">
                    <td width="10%"> </td>
                    <td width="25%"> </td>
                    <td width="65%"><font color="orange" size="2">Form Pengajuan Pinjaman</font></td>
            </tr>
            <tr height="46">
                <td> </td>
                <td>ID Pengaju</td>
                <td><input type="text" name="id_pengaju" size="35" maxlength="6" /></td>
            </tr>
            <tr height="46">
                <td> </td>
                <td>Nama</td>
                <td><input type="text" name="nama" value= $_GET['nama'] size="35" maxlength="30" /></td>
            </tr> 
             <tr height="46">
                <td> </td>
                <td>Besar Pinjaman</td>
                <td><input type="text" name="besar_pinjaman" value=Rp. size="35" maxlength="30" /></td>
            </tr>
            <tr height="46">
                <td> </td>
                <td>Keperluan Untuk</td>
                <td><select name="keperluan">
                        <option value="-">- Pilih Keperluan -
                        <option value="Modal Usaha">Modal Usaha
                        <option value="Berobat">Berobat
                        <option value="Sekolah">Biaya Sekolah
                        <option value="Sembako">Kebutuhan Sehari-hari
                        <option value="Hajatan">Hajatan
                    </select></td>
            </tr>
            <tr height="46">
                <td> </td>
                <td>Jangka Waktu</td>
                <td><select name="keperluan">
                        <option value="-">- Pilih Jangka Waktu -
                        <option value="5"> 5 bulan
                        <option value="10"> 10 bulan
                        <option value="20"> 20 bulan
                    </select></td>
            </tr>
            
            <tr height="46">
                <td> </td>
                <td> </td>
                <td><input type="submit" name="Submit" value="Submit">   
                    <input type="reset" name="reset" value="Cancel"></td>
            </tr>
        </table>
    </form>
    </div>
    </body>
    </html>
