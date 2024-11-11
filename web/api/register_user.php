<?php
include_once("../config.php");
header("Content-Type: application/json");
// Define variables and initialize with empty values
if(isset($_POST['username']) && isset($_POST['password']) && count($_POST) === 2) {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    //make_query($conn, "SELECT COUNT(username) FROM players WHERE `username` = \""
    //    .mysqli_real_escape_string($conn,  $_GET[])."\"");
    $result =
        mysqli_query($conn, "INSERT INTO `players` (username)\"VALUES("
        .mysqli_real_escape_string($conn,  $username)."\");");
    if($result) {
        $result =
        mysqli_query($conn, "INSERT INTO `player_login` (username, passowrd)\"VALUES("
        .mysqli_real_escape_string($conn,  $username).","
        .mysqli_real_escape_string($conn, $password)."\");");
        if($result) {
            echo "true";
        } else {
            echo "false";
        }
    } else {
        echo "false";
    }
} else {
    echo "HIBA!";
}