<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
header('Content-Type: application/json; charset=utf-8');
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $players_per_page = $_SESSION["players_per_page"];
    $query = " SELECT ROW_NUMBER() OVER (ORDER BY p.points DESC, p.all_wins / p.all_games_played DESC) AS `rank`, p.username, p.points, p.all_wins / p.all_games_played * 100 AS winrate, p.all_games_played, p.kills, p.deaths FROM players AS p INNER JOIN player_login ON p.username = player_login.username ORDER BY p.points DESC, winrate DESC LIMIT $players_per_page";
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
