<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = htmlspecialchars($_POST['name']);
    $image = htmlspecialchars($_POST['image']);
    $damage = htmlspecialchars($_POST['damage']);
    $fire_rate = htmlspecialchars($_POST['fire_rate']);
    $semi_auto = htmlspecialchars(isset($_POST['semi_auto']) ? 1 : 0);
    $rarity = htmlspecialchars($_POST['rarity_id']);
    $projectile_speed = htmlspecialchars($_POST['projectile_speed']);
    $mag = htmlspecialchars($_POST['mag']);
    $description = htmlspecialchars($_POST['description']);
    $devinfo = htmlspecialchars($_POST['devinfo']);
    $query = "INSERT INTO weapons (name, file_name, damage, fire_rate, semi_auto, rarity_id, projectile_speed, mag, description, devinfo) VALUES(?,?,?,?,?,?,?,?,?,?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ssidiidiss", $name, $image, $damage, $fire_rate, $semi_auto, $rarity, $projectile_speed, $mag, $description, $devinfo);
    $stmt->execute();
    if ($stmt->errno) {
        echo $stmt->error;
    }
    http_response_code(200);
}