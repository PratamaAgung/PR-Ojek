<?php
    require_once('connect.php');

    $id_active = $_GET['id_active'];
    $location = $_GET['location'];

    $query = "INSERT INTO preffered_location (id_user, location) VALUES ";
    $query .= "('$id_active', '$location')";



    if (mysqli_query($conn, $query)) {
        echo 1;
    } else {
        echo 0;
    }

    mysqli_close($conn);
?>