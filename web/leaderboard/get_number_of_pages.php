<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
header('Content-Type: application/json; charset=utf-8');
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $players_per_page = $_SESSION["players_per_page"];
    //echo json_encode($players_per_page);
    $stmt = $GLOBALS["conn"]->prepare("SELECT CEIL(COUNT(username) / ?) AS number_of_pages FROM players;");
    $stmt->bind_param("i", $players_per_page);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    echo json_encode($result[0]["number_of_pages"]);
}
