<?php
    require_once('connect.php');

    $email = $_GET['email'];

    $query = "SELECT * FROM user WHERE email = '". $email ."'";
    $result = mysqli_query($conn, $query);
    $ret = 1;
    $rows = mysqli_num_rows($result);

    if ( $rows >= 1 ) {
        $ret = 0;
    }

    echo $ret;
?>