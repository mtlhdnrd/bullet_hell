<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = htmlspecialchars($_POST['name']);
    $anthem = htmlspecialchars($_POST['anthem']);
    $cover_image = htmlspecialchars($_POST['cover_image']);
    $main_menu_1 = htmlspecialchars($_POST['main_menu_1']);
    $main_menu_2 = htmlspecialchars($_POST['main_menu_2']);
    $description = htmlspecialchars($_POST['description']);
    $query = "INSERT INTO music_packs (name, cover_image, anthem, main_menu_theme1, main_menu_theme2, description) VALUES(?,?,?,?,?,?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ssssss", $name, $cover_image, $anthem, $main_menu_1, $main_menu_2, $description);
    $stmt->execute();
    if ($stmt->errno) {
        echo $stmt->error;
    }
    http_response_code(200);
}