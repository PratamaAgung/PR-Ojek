<?php
    require_once('connect.php');

    $new_location = $_GET['new_location'];
    $id_location = $_GET['id_location'];

    $query = "UPDATE preffered_location SET location='". $new_location ."' WHERE id_location=". $id_location;

    if (mysqli_query($conn, $query)) {
        echo 1;
    } else {
        echo 0;
    }

    mysqli_close($conn);
?>