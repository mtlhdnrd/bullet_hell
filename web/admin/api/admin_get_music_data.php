<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $query = "SELECT music_packs.id, music_packs.name, music_packs.description FROM music_packs;";
    $stmt = $conn->prepare($query);
    $stmt->execute();
    if ($stmt->errno) {
        echo $stmt->error;
    }
    $result = $stmt->get_result();
    $music = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $music[] = $row;
        }
    }
    echo json_encode($music);
}