<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['password']) && count($_GET) == 1) {
        $username = $_SESSION['username'];
        $result = $conn->prepare("SELECT password FROM player_login WHERE `username` = ? AND `is_admin` = 1;");
        $result->bind_param('s', $username);
        $result->execute();
        $result->bind_result($queried_pw);
        $result->fetch();
        if ($queried_pw === $_GET['password']) {
            $_SESSION['admin_login'] = "true";
            http_response_code(200);

        } else {
            http_response_code(401);
        }
        //echo json_encode($return);
    } else {
        http_response_code(response_code: 404);
        print_r($_GET);
    }
}