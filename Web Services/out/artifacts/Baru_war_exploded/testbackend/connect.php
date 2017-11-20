<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "projek";

    // Create
    $conn = mysqli_connect($servername, $username, $password, $dbname);

    // Check
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
?>