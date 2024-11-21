<?php
include_once("../config.php");
// Define variables and initialize with empty values
if (!empty($_POST) && $_SERVER["REQUEST_METHOD"] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $query = "INSERT INTO `players` (username) VALUES (?);";
    $result = $conn->prepare($query);
    $result->bind_param("s", $username);
    $result->execute();
    $result = $conn->prepare( "INSERT INTO `player_login` (username, password) VALUES(?,?);");
    $result->bind_param("ss", $username, $password);
    $result->execute();
    http_response_code(201);
    $_SESSION['username'] = $username;
} else {
    echo "ejnye";
}
