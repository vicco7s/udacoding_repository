<?php
    require "connect.php";
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $response = array();
        $username = $_POST['username'];
        $password = md5($_POST['password']);
            $cek = "SELECT * FROM mahasiswa WHERE username='$username' and
            password='$password'";  
            $result = mysqli_fetch_array(mysqli_query($connect, $cek));
    if (isset($result)) {
        $response['value'] = 1;
        $response['message'] = "Login berhasil";
        $response['username'] = $result['username'];
        $response['nama'] = $result['full_name'];
            echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "Login Gagal";
        echo json_encode($response);
        }
    }
?>