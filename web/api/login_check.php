<?php
include_once("../config.php");
include_once("../utils.php");
// Define variables and initialize with empty values
$username = $password = $confirm_password = "";
$username_err = $password_err = $confirm_password_err = "";
if (isset($_GET['username']) && isset($_GET['password']) && count($_GET) == 2) {
    $username = $_GET['username'];
    $result = $conn->prepare( "SELECT password FROM player_login WHERE `username` = \"". mysqli_real_escape_string($conn,  $username) . "\"");
    $result->execute();
    $result->bind_result($queried_pw);
    $result->fetch();
    if ($queried_pw === $_GET['password']) {
        $_SESSION['username'] = $username;
        http_response_code(200);

    } else {
        http_response_code(401);

    }
    //echo json_encode($return);
} else {
    print_r($_GET);
}
