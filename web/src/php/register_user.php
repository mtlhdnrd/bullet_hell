<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
// Define variables and initialize with empty values
if (!empty($_POST) && $_SERVER["REQUEST_METHOD"] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $query = "INSERT INTO `players` (username,points,winrate,all_games_played, kills, deaths,most_used_music_id,music_pack_id,active_skin_id) VALUES (?,0,0,0,0,0,NULL, NULL, NULL);";
    $result = $conn->prepare($query);
    $result->bind_param("s", $username);
    $result->execute();
    $result = $conn->prepare("INSERT INTO `player_login` (username, password) VALUES(?,?);");
    $result->bind_param("ss", $username, $password);
    $result->execute();
    http_response_code(201);
    $_SESSION['username'] = $username;
} else {
    http_response_code(400);
}