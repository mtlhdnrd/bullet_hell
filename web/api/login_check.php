<?php
include_once("../config.php");
header("Content-Type: application/json");
// Define variables and initialize with empty values
$username = $password = $confirm_password = "";
$username_err = $password_err = $confirm_password_err = "";
if(isset($_GET['user']) && isset($_GET['password']) && count($_GET) == 2) {
    $username = $_GET['user'];
    $result =
        mysqli_query($conn, "SELECT password FROM players WHERE `username` = \""
        .mysqli_real_escape_string($conn,  $username)."\"");
    $r = mysqli_fetch_assoc($result);
    $return = array();
    if($r['count'] > 0) {
        $return[$username] = 1;
    } else {
        $return[$username] = 0;
    }
    //print_r($return);
    echo json_encode($return);
} else {
    echo "HIBA!";
}