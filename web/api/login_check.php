<?php
include_once("../config.php");
include_once("../utils.php");
header("Content-Type: application/json");
// Define variables and initialize with empty values
$username = $password = $confirm_password = "";
$username_err = $password_err = $confirm_password_err = "";
if (isset($_GET['username']) && isset($_GET['password']) && count($_GET) == 2) {
    $username = $_GET['username'];
    $result = $conn->prepare( "SELECT password FROM player_login WHERE `username` = \"". mysqli_real_escape_string($conn,  $username) . "\"");
    $result->execute();
    $result->bind_result($count);
    $result->fetch();
    $return = array();
    if ($count > 0) {
        $return[$username] = 1;
    } else {
        $return[$username] = 0;
    }
    //print_r($return);
    echo json_encode($return);
} else {
    print_r($_GET);
}
