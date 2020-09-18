<?php

    include 'koneksi.php';

    $id = $_POST['id'];
    $judul = $_POST['judul'];
    $isi = $_POST['isi'];

    $connect->query("UPDATE tb_note SET judul='$judul', isi='$isi' WHERE id='$id.'");


?>