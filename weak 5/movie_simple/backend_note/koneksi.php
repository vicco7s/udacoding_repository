<?php

    $connect = new mysqli("localhost","root","","db_film");

    if($connect){
    
    }else{
        echo "Connection Failed";
        exit();
    }

?>