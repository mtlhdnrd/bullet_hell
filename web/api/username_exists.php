<?php
include_once("../config.php");
header("Content-Type: application/json");
// Define variables and initialize with empty values
$username = $password = $confirm_password = "";
$username_err = $password_err = $confirm_password_err = "";
if(isset($_GET['user']) && count($_GET) == 1) {
    $username = $_GET['user'];
    //make_query($conn, "SELECT COUNT(username) FROM players WHERE `username` = \""
    //    .mysqli_real_escape_string($conn,  $_GET[])."\"");
    $result =
        mysqli_query($conn, "SELECT COUNT(username) as `count` FROM players WHERE `username` = \""
        .mysqli_real_escape_string($conn,  $username)."\"");
    $r = mysqli_fetch_assoc($result);
    $return = array();
    if($r['count'] > 0) {
        $return[$username] = 1;
    } else {
        $return[$username] = 0;
    }
    echo json_encode($return);
    
} else {
    echo "HIBA!";
}