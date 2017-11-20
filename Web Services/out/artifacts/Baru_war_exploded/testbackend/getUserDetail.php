<?php
/**
 * Created by PhpStorm.
 * User: irfan_mim
 * Date: 06/10/2017
 * Time: 17:56
 */

    require_once('connect.php');

    $id_user = $_GET['id_user'];

    $query = "SELECT * FROM user WHERE id_user=".$id_user;
    $result = mysqli_query($conn, $query);
    $ret = array();

    /* Menampilkan hasil dari Query */
    if (mysqli_num_rows($result) > 0) {
        while($row = mysqli_fetch_assoc($result)) {
            $users = array();
            $users["id_user"] = $row['id_user'];
            $users["name"] = $row['name'];
            $users["username"] = $row['username'];
            $users["password"] = $row['password'];
            $users["email"] = $row['email'];
            $users["phone_number"] = $row['phone_number'];
            $users["driver"] = $row['driver'];
            $users["image_address"] = $row['image_address'];
            array_push($ret, $users);
        }
    }

    echo json_encode($users);

?>