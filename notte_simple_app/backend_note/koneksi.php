<?php

    $connect = new mysqli("localhost","root","","db_note");

    if($connect){
    
    }else{
        echo "Connection Failed";
        exit();
    }

?>