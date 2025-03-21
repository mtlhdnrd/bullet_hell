<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
// Define variables and initialize with empty values
$username = $password = $confirm_password = "";
if (isset($_GET['username']) && isset($_GET['password']) && count($_GET) == 2) {
    $username = $_GET['username'];
    $password = $_GET['password'];
    $result = $conn->prepare("SELECT password, players.points FROM player_login INNER JOIN players ON player_login.username = players.username WHERE player_login.username = ?;");
    $result->bind_param('s', $username);
    $result->execute();
    $result->bind_result($queried_pw, $points); // Bind both password and points
    $result->fetch();

    if ($queried_pw === $password) { // Compare with the password from the GET request
        $_SESSION['username'] = $username;
        $return = ['username' => $username, 'points' => $points]; // Create the array to encode
        echo json_encode($return);
        http_response_code(200);

    } else {
        http_response_code(401);
    }
} else {
    print_r($_GET);
    http_response_code(400);
}