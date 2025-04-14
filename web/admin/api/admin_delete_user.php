<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    $requestBody = file_get_contents('php://input');
    parse_str($requestBody, $params);
    $username = $params['username'];
    $conn->begin_transaction();
    $result = true;
    $query = "DELETE FROM player_login WHERE username=?;";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $username);
    $result = $result && $stmt->execute();
    if ($stmt->errno) {
        echo $stmt->error;
    }

    $query = "DELETE FROM players WHERE username = ?;";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $username);
    $result = $result && $stmt->execute();
    if ($stmt->errno) {
        echo $stmt->error;
    }

    if ($result) {
        $conn->commit();
        echo "success";
        http_response_code(200);
        $_SESSION['username'] = $username;
    } else {
        $conn->rollback();
        echo "failed";
        http_response_code(500);
    }
    http_response_code(200);
}