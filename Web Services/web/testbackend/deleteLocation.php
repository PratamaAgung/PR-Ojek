<?php
    require_once('connect.php');

    $id_location = $_GET['id_location'];

    $query = "DELETE FROM preffered_location WHERE id_location=". $id_location;

    if (mysqli_query($conn, $query)) {
        echo 1;
    } else {
        echo 0;
    }

    mysqli_close($conn);
?>