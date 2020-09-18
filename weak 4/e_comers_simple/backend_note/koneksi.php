<?php

    $connect = new mysqli("localhost","root","","db_ecomers");

    if($connect){
    
    }else{
        echo "Connection Failed";
        exit();
    }

?>