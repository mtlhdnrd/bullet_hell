<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
// Define variables and initialize with empty values
if (!empty($_POST) && $_SERVER["REQUEST_METHOD"] === 'POST') {
    $username = htmlspecialchars($_POST['username']);
    $password = htmlspecialchars($_POST['password']);
    if(username_exists($username)) {
        http_response_code(400);
        die("username already exists");
    }
    $conn->begin_transaction();
    $result = true;
    $query = "INSERT INTO `players` (username,points,all_wins,all_games_played,kills,deaths,music_pack_id,active_skin_id) VALUES (?,0,0,0,0,0,NULL,(SELECT `id` FROM `player_skins` WHERE `name` = 'knight'));";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $username);
    $result = $result && $stmt->execute();

    $stmt = $conn->prepare("INSERT INTO `player_login` (username, password) VALUES(?,?);");
    $stmt->bind_param("ss", $username, $password);
    $result = $result && $stmt->execute();

    if ($result) {
        $conn->commit();
        echo "success";
        http_response_code(201);
        $_SESSION['username'] = $username;
    } else {
        $conn->rollback();
        echo "failed";
        http_response_code(500);
    }
} else {
    http_response_code(400);
}