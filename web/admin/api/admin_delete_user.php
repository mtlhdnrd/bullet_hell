<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    $requestBody = file_get_contents('php://input');
    parse_str($requestBody, $params);
    $username = $params['username'];
    $query = "DELETE FROM player_login WHERE username=?;";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    if ($stmt->errno) {
        echo $stmt->error;
    }
    $query = "DELETE FROM players WHERE username = ?;";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    if ($stmt->errno) {
        echo $stmt->error;
    }
    http_response_code(200);
}