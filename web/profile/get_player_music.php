<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if (isset($_GET['username'])) {
    $username = $_GET['username'];
    $stmt = $conn->prepare("SELECT music_packs.name, CASE WHEN players.music_pack_id = music_packs.id THEN TRUE ELSE FALSE END AS active FROM player_login INNER JOIN players ON player_login.username = players.username INNER JOIN player_music_inventory ON player_login.username = player_music_inventory.player_id INNER JOIN music_packs ON music_packs.id = player_music_inventory.music_pack_id WHERE player_login.username = ?;"
);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    http_response_code(200);
    header("Content-Type: application/json");
    echo json_encode($result);
} else {
    http_response_code(400);
    echo "USERNAME NOT SET";
}
