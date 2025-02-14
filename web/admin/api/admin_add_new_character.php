<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = htmlspecialchars($_POST['name']);
    $file = htmlspecialchars($_POST['file']);
    $description = htmlspecialchars($_POST['description']);
    $query = "INSERT INTO player_skins (name, file_name, description) VALUES(?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("sss", $name, $file, $description);
    $stmt->execute();
    if ($stmt->errno) {
        echo $stmt->error;
    }
    http_response_code(200);
}