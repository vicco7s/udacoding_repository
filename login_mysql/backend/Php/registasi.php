<?php
    require "connect.php";
    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        $response = array();
        $username = $_POST['username'];
        $password = md5($_POST['password']);
        $full_name = $_POST['full_name'];
        $gender = $_POST['gender'];
        $alamat = $_POST['alamat'];
        $email = $_POST['email'];
        
        $cek = "SELECT * FROM mahasiswa WHERE username='$username'";
        $result = mysqli_fetch_array(mysqli_query($connect, $cek));
    if (isset($result)) {
        $response['value'] = 2;
        $response['message'] = "Username telah digunakan";
        echo json_encode($response);
    } else {
        $insert = "INSERT INTO mahasiswa VALUE(NULL,
        '$username','$email', '$full_name', '$gender', '$password','$alamat',
    NOW())";

    if (mysqli_query($connect, $insert)) {
        $response['value'] = 1;
        $response['message'] = "Berhasil didaftarkan";
    echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "Gagal didaftarkan";
        echo json_encode($response);
        }
    }
    }
?>