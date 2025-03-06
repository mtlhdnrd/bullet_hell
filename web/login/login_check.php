<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
// Define variables and initialize with empty values
$username = $password = $confirm_password = "";
if (isset($_GET['username']) && isset($_GET['password']) && count($_GET) == 2) {
    $username = $_GET['username'];
    $result = $conn->prepare("SELECT password FROM player_login WHERE `username` = ?;");
    $result->bind_param('s', $username);
    $result->execute();
    $result->bind_result($queried_pw);
    $result->fetch();
    if ($queried_pw === $_GET['password']) {
        $_SESSION['username'] = $username;
        http_response_code(200);

    } else {
        echo $queried_pw."<br>";
        echo $_GET["password"]."<br>";
        http_response_code(401);
    }
    //echo json_encode($return);
} else {
    print_r($_GET);
}