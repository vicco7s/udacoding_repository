
<?php

include 'koneksi.php';

$judul = $_POST['judul'];
$isi = $_POST['isi'];

$connect->query("INSERT INTO tb_note (judul,isi) VALUES ('".$judul."','".$isi."')");

?>