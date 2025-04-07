<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if (isset($_GET['username'])) {
    $username = $_GET['username'];
    $stmt = $conn->prepare("SELECT points, all_wins / all_games_played * 100 AS winrate, all_games_played, kills, deaths, music_packs.name as `music_pack` FROM players LEFT JOIN music_packs ON players.music_pack_id = music_packs.id WHERE username=?;");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    if(count($result) == 1 && $result[0]["winrate"] == NULL) {
        $result[0]["winrate"] = 0;
    }
    header("Content-Type: application/json");
    echo json_encode($result);
} else {
    http_response_code(400);
    echo "USERNAME NOT SET";
}