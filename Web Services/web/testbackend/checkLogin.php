<?php

    require_once('connect.php');

    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = "SELECT * FROM user WHERE username = '". $username ."' AND password = '". $password ."'";
    $result = mysqli_query($conn, $query);
    $ret = 0;
    $rows = mysqli_num_rows($result);

    if ( $rows >= 1 ) {
        $ret = 1;
    }

    if($ret !== 0) {
        $query1 = "SELECT id_user FROM user WHERE username = '". $username ."'" ;
        $result1 = mysqli_query($conn, $query1);
        $row1 = mysqli_fetch_assoc($result1);

        $id = $row1['id_user'];
        echo $id;
    }
    else {
        echo 0;
    }

?>