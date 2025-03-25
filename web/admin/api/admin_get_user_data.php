<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $players_per_page = $_SESSION["players_per_page"];
    $query = "SELECT players.username, players.points, players.all_wins / players.all_games_played * 100 AS winrate, players.all_games_played, players.kills, players.deaths FROM players INNER JOIN player_login ON players.username = player_login.username ORDER BY ";
    $sort_criterion = $_GET["sort_criterion"] ?? "";
    $sort_asc = true;
    if(($_GET["sort_asc"] ?? "true") == "false") {
        $sort_asc = false;
    }
    $possible_criteria = ["username", "points", "winrate", "all_games_played", "kills", "deaths"];
    if(!in_array($sort_criterion, $possible_criteria)) {
        $sort_criterion = $possible_criteria[0];
    }
    $query .= $sort_criterion;
    if($sort_asc) {
        $query .= " ASC";
    } else {
        $query .= " DESC";
    }
    $query .= " LIMIT $players_per_page";
    if (isset($_GET["p"])) {
        $page = intval($_GET["p"]);
        if(!is_integer($page) || $page < 1) {
            $page = 1;
        }
        $offset = ($page - 1) * $players_per_page;
        $query .= " OFFSET $offset";
    }
    $query .= ";";
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