<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
header('Content-Type: application/json; charset=utf-8');
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $players_per_page = $GLOBALS["players_per_page"];
    $query = "SELECT players.username, players.points, players.winrate, players.all_games_played, players.kills, players.deaths FROM players INNER JOIN player_login ON players.username = player_login.username ORDER BY players.points DESC LIMIT $players_per_page";
    if (isset($_GET["p"])) {
        $page = $_GET["p"];
        $offset = $page * $players_per_page;
        $query = $query." OFFSET $offset";
    }
    $query = $query.";";
    $stmt = $conn->prepare($query);
    $stmt->execute();
    if ($stmt->errno) {
        echo $stmt->error;
    }
    $result = $stmt->get_result();
    $players = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $players[] = $row;

        }
    }
    echo json_encode($players);
}