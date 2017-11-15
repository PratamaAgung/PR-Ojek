<?php

    require_once('connect.php');

    if(isset($_GET["id_psg"])){

        $idpsg = $_GET["id_psg"];

        $query = "UPDATE `order` SET `status_psg`=0 WHERE `id_order` = " . $idpsg;
        if (mysqli_query($conn, $query)){
            echo 1;
        } else {
            echo 2;
        }

    } 
    // else {
    //     echo 0;
    // }    

    if(isset($_GET["id_driver"])){
        
        $id_driver = $_GET["id_driver"];

        $query = "UPDATE `order` SET `status_driver`=0 WHERE `id_order` = " . $id_driver;
        if (mysqli_query($conn, $query)){
            echo 1;
        } else {
            echo 0;
        }

    } 
    // else {
    //     echo 0;
    // }        

?>