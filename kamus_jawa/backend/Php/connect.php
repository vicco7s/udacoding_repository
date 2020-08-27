<?php
$connect = new mysqli("localhost","root", "", "db_kamus");
if ($connect) {
// echo "database connected";
} else {
// echo "database error";
}
?>