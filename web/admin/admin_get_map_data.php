<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $query = "SELECT maps.id, maps.name, maps.description, music_packs.name AS music_pack FROM maps INNER JOIN music_packs ON maps.music_pack_id = music_packs.id;";
    $stmt = $conn->prepare($query);
    $stmt->execute();
    if ($stmt->errno) {
        echo $stmt->error;
    }
    $result = $stmt->get_result();
    $maps = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $maps[] = $row;
        }
    }
    echo json_encode($maps);
}