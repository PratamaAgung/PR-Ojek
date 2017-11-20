<?php
/**
 * Created by PhpStorm.
 * User: irfan_mim
 * Date: 06/10/2017
 * Time: 19:45
 */

    require_once('connect.php');

    $date = date("Y-m-d");
    // $result = $date->format('Y-m-d');
    // echo $date;
    // echo date("l", mktime(0, 0, 0, 7, 1, 2000));

    $id_psg = $_GET['id_psg'];
    $id_drv = $_GET['id_drv'];
    $pick_location = $_GET['pick_location'];
    $des_location = $_GET['des_location'];
    $rating = $_GET['rating'];
    $comment = $_GET['comment'];

    $query = "INSERT INTO `order` (id_psg, id_drv, pick_location, des_location, rating, comment, tanggal, status_psg, status_driver) VALUES ";
    $query .= "($id_psg, $id_drv, '$pick_location', '$des_location', $rating, '$comment', '$date' , 1 , 1 )";

    if (mysqli_query($conn, $query)) {
                echo 1;
    } else {
                echo 0;
//        echo $query . " : " . mysqli_error($conn);
    }

    mysqli_close($conn);

?>