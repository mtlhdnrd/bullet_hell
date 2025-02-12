<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    $requestBody = file_get_contents('php://input');
    parse_str($requestBody, $params);
    $id = $params['id'];
    $query = "DELETE FROM player_skins WHERE id = ?;";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    if ($stmt->errno) {
        echo $stmt->error;
    }
    http_response_code(200);
}