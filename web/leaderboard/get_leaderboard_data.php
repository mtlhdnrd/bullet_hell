<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
header('Content-Type: application/json; charset=utf-8');
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $players_per_page = $GLOBALS["players_per_page"];
    $query = "SELECT p.username, p.points, p.winrate, p.all_games_played, p.kills, p.deaths, (SELECT COUNT(*) + 1 FROM players WHERE players.points > p.points) AS `rank` FROM players p INNER JOIN player_login ON p.username = player_login.username ORDER BY p.points DESC LIMIT $players_per_page";
    if (isset($_GET["p"])) {
        $page = intval($_GET["p"]);
        if(!is_integer($page) || $page < 1) {
            $page = 1;
        }
        $offset = ($page - 1) * $players_per_page;
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