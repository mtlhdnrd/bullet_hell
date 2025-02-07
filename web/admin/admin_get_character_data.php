<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $query = "SELECT player_skins.id, player_skins.name, player_skins.description FROM player_skins;";
    $stmt = $conn->prepare($query);
    $stmt->execute();
    if ($stmt->errno) {
        echo $stmt->error;
    }
    $result = $stmt->get_result();
    $characters = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $characters[] = $row;
        }
    }
    echo json_encode($characters);
}