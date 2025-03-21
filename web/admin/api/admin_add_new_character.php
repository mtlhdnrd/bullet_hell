<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = htmlspecialchars($_POST['name']);
    $display_image = htmlspecialchars($_POST['display_image']);
    $background_image = htmlspecialchars($_POST['background_image']);
    $description = htmlspecialchars($_POST['description']);
    $query = "INSERT INTO player_skins (name, display_image, background_image, description) VALUES(?, ?, ?, ?);";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ssss", $name, $display_image, $background_image, $description);
    $stmt->execute();
    if ($stmt->errno) {
        echo $stmt->error;
    }
    http_response_code(200);
}