<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if (!empty($_POST) && $_SERVER["REQUEST_METHOD"] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['newpw'];
    $result = $conn->prepare("UPDATE player_login SET password=? WHERE username=?;");
    $result->bind_param("ss", $password, $username);
    if ($result->execute()) {
        http_response_code(200);
    } else {
        http_response_code(400);
    }

}