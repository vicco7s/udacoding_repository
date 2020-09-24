<?php 
include 'koneksi.php';
$var=$_SERVER['REQUEST_METHOD'];
if($var=='GET'){
    $res=Array();
    $res['tb_movie']=Array();
        $q="SELECT * FROM `tb_movie` ORDER BY year DESC";
        if($result=$connect->query($q)){
            $res['result']=1;
            
            while($data=$result->fetch_assoc()){
                $split=explode(',',$data['genre']);
                
                $data['genre']=$split;
                array_push($res['tb_movie'],$data); 
            }
            echo json_encode($res);
        }else{
            $res['result']=0;
            echo json_encode($res);
        } 
}
?>