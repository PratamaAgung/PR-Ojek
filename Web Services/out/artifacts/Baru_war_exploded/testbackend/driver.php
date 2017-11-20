<?php
    require_once("connect.php");

    if(isset($_GET['search'])) {
        $search = $_GET['search'];
        $id_active= $_GET['id_active'];
        $destination = $_GET['destination'];
        $pick = $_GET['pick'];      
        // echo $search;    
        echo setPreferDriver($search,$id_active,$destination,$pick);

    } 
    if (isset($_GET['cari'])) {
        $cari = $_GET['cari'];
        $id_active= $_GET['id_active'];
        $destination = $_GET['destination'];
        $pick = $_GET['pick'];
        // echo $cari . $id_active . $destination . $pick;
        echo  setOtherDriver($cari,$id_active,$destination,$pick);
    }
     if (isset($_GET['get_info'])) {
        $cari = $_GET['get_info'];
        echo getInfoDriver($cari);
    }
    // else {
    //     echo -1;
    // }

    function getInfoDriver($id_driver) {
        global $conn;
        
        $query = "SELECT * FROM `user` WHERE id_user = ".$id_driver;
        $result = mysqli_query($conn, $query);

        $row = mysqli_fetch_array($result); 

        $info = "
        <div class='main-content'>
            <div class='gambar-bulat'>
                <img class='user-profpic' src=".$row["image_address"]." alt=".$row["username"]." ></img>
            </div>
        </div>
        <p><span class='username-profile'>@".$row["username"]."</span></p>
        <p>".$row["name"]."</p>
        <fieldset class='rating' id='rate'>    
            <input type='radio' id='star5' name='rating' value='5' /><label for='star5' title=''>5 stars</label>
            <input type='radio' id='star4' name='rating' value='4'/><label for='star4' title=''>4 stars</label>
            <input type='radio' id='star3' name='rating' value='3' /><label for='star3' title=''>3 stars</label>
            <input type='radio' id='star2' name='rating' value='2' /><label for='star2' title=''>2 stars</label>
            <input type='radio' id='star1' name='rating' value='1' /><label for='star1' title=''>1 star</label>
        </fieldset>";

        return $info;
    }

    function setOtherDriver($search,$id_active,$destination,$pick) {
        global $conn;
        
        if($search != ""){
            $query = "(SELECT DISTINCT user.id_user, user.username, user.name, user.image_address FROM `user`,`preffered_location` WHERE (user.id_user = preffered_location.id_user) AND (user.name NOT LIKE '%".$search."%' AND user.username NOT LIKE '%".$search."%') AND (preffered_location.location = '".$destination."' OR preffered_location.location = '".$pick."'))";
        }else {
            $query = "(SELECT DISTINCT user.id_user, user.username, user.name, user.image_address FROM `user`,`preffered_location` WHERE (user.id_user = preffered_location.id_user) AND (preffered_location.location = '".$destination."' OR preffered_location.location = '".$pick."'))";
        }
        $result = mysqli_query($conn, $query);
        // var_dump($result);
        $num_row = mysqli_num_rows($result);

        if ($num_row >= 1) {
            global $other_driver;

            while($driver = mysqli_fetch_array($result)){ 
                if(getIsDriver($driver["id_user"]) && $driver["id_user"] != $id_active) {  
                    
                    $other_driver = $other_driver.
                    "<div class='head-title driver-list' id='".$driver["id_user"]."'>
                        <div class='gambar-kotak'>
                            <img class='square-picture' src='".$driver["image_address"]."' alt='".$driver["username"]."'>
                        </div>
                        <div class='detail-select-driver content-font-sanchez'>                   
                            <p>".$driver["name"]."</p>
                            <p><span class='font-rating'>&#9734 ".calculateRating($driver["id_user"])."</span> (".calculateVotes($driver["id_user"])." votes)</p>
                            <div class='green-button posisi-bawah posisi-kanan' onclick='increase(); iChoose(".$driver["id_user"].");'>I Choose You!</div>
                        </div>
                    </div>";
                }
            }
            if($other_driver == ""){
                return -1;
            }else{
                return $other_driver;            
            }        

            } else {
                return -1;
            }
    }

    function setPreferDriver($search,$id_active,$destination,$pick) {
        global $conn;
        
        $query = "(SELECT DISTINCT user.id_user, user.username, user.name, user.image_address FROM `user`,`preffered_location` WHERE (user.id_user = preffered_location.id_user) AND (user.name LIKE '%".$search."%' OR user.username LIKE '%".$search."%') AND (preffered_location.location = '".$pick."' OR preffered_location.location = '".$destination."'))";
        $result = mysqli_query($conn, $query);
        // var_dump($result);
        $num_row = mysqli_num_rows($result);
        // return $num_row;

        if ($num_row >= 1) {
            global $other_driver;

            while($driver = mysqli_fetch_array($result)){
                if(getIsDriver($driver["id_user"]) && $driver["id_user"] != $id_active) {
                
                    $other_driver = $other_driver.
                    "<div class='head-title driver-list' id='".$driver["id_user"]."'>
                        <div class='gambar-kotak'>
                            <img class='square-picture' src='".$driver["image_address"]."' alt='".$driver["username"]."'>
                        </div>
                        <div class='detail-select-driver content-font-sanchez'>                   
                            <p>".$driver["name"]."</p>
                            <p><span class='font-rating'>&#9734 ".calculateRating($driver["id_user"])."</span> (".calculateVotes($driver["id_user"])." votes)</p>
                            <div class='green-button posisi-bawah posisi-kanan' onclick='increase(); iChoose(".$driver["id_user"].");'>I Choose You!</div>
                        </div>
                    </div>";
                }
            }
            if($other_driver == ""){
                return -1;
            }else{
                return $other_driver;            
            }
        } else {
            return -1;
        }
    }

    function getIsDriver($id_active) {
        global $conn;
  
        $query = "SELECT `driver` FROM `user` WHERE `id_user` = ". $id_active;
        $result = mysqli_query($conn, $query);
  
    //   var_dump($result);
        $now = mysqli_fetch_array($result);
  //      var_dump($now);
  
        return $now["driver"];
    }
  
    function calculateRating($id_active) {
      global $conn;
  
      $query = "SELECT avg(`rating`) FROM (SELECT * FROM `order` WHERE `id_drv` = ". $id_active .") as c";
      $result = mysqli_query($conn, $query);
      
      if(!mysqli_query($conn, $query)) {
          echo "Error : " . $query . "  " . mysqli_error($conn);
      }
  
      // var_dump($result);
      $now = mysqli_fetch_array($result);
      $ret = substr($now["avg(`rating`)"], 0,3);
      // var_dump($now);
      return $ret;
    }
  
    function calculateVotes($id_active) {
      global $conn;
      
      $query = "SELECT count(*) FROM (SELECT * FROM `order` WHERE `id_drv` = ". $id_active .") as c";
      $result = mysqli_query($conn, $query);
          
      if(!mysqli_query($conn, $query)) {
         echo "Error : " . $query . "  " . mysqli_error($conn);
      }
      
      // var_dump($result);
      $now = mysqli_fetch_array($result);
      // var_dump($now);
      return $now["count(*)"];
    }

?>