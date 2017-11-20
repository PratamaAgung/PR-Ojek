<?php
    require_once('connect.php');

    $full_name = $_POST['full_name'];
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $phone_number = $_POST['phone_number'];
    $driver_status = $_POST['statusdriver'];
    
    $query = "INSERT INTO user (name, username, password, email, phone_number, driver)
                VALUES ";

    $query .= "('$full_name', '$username', '$password', '$email', '$phone_number', '$driver_status')";

    if (mysqli_query($conn, $query)) {
        $query1 = "SELECT id_user, driver FROM user WHERE username = '". $username ."'" ;
        $result1 = mysqli_query($conn, $query1);
        $row1 = mysqli_fetch_assoc($result1);

        $ret = array();
        $ret['id_user'] = $row1['id_user'];
        $ret['driver'] = $row1['driver'];

        echo json_encode($ret);
//            echo "Berhasil membuat user baru!";
    } else {
        echo 0;
//            echo "Error: " . $query . "<br>" . mysqli_error($conn);
    }
?>