<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $query = "SELECT w.id, w.name, w.file_name, w.damage, w.fire_rate, w.semi_auto, r.rarity, w.projectile_speed, w.mag, w.description, w.devinfo FROM weapons w LEFT JOIN rarities r ON w.rarity_id = r.id;";
    $stmt = $conn->prepare($query);
    $stmt->execute();
    if ($stmt->errno) {
        echo $stmt->error;
    }
    $result = $stmt->get_result();
    $weapons = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $weapons[] = $row;

        }
    }
    echo json_encode($weapons);
}