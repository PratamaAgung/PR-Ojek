<?php
    require_once('connect.php');

    $username = $_GET['username'];

    $query = "SELECT * FROM user WHERE username = '". $username ."'";
    $result = mysqli_query($conn, $query);
    $ret = 1;
    $rows = mysqli_num_rows($result);

    if ( $rows >= 1 ) {
        $ret = 0;
    }

    echo $ret;
?>