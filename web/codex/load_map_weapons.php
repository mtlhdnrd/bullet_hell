<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER["REQUEST_METHOD"] === 'GET') {
    $mapId = $_GET['map'];
    $query = "SELECT weapons.id, weapons.name, weapons.file_name FROM weapons RIGHT JOIN map_weapons ON weapons.id = map_weapons.weapon_id LEFT JOIN maps ON map_weapons.map_id = maps.id WHERE map_id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('s', $mapId);
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