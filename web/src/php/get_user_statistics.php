<?php
include_once("../config.php");
include_once("../utils.php");
if (isset($_GET['username'])) {
    $username = $_GET['username'];
    $stmt = $conn->prepare("SELECT points, winrate, all_games_played, kills, deaths, name FROM players INNER JOIN music_packs ON players.music_pack_id = music_packs.id WHERE username=?;");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    echo json_encode($result);
}else{
    echo "HIBA";
}