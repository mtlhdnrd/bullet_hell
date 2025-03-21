<?php
session_start();
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
function is_logged_in() {
    return isset($_SESSION['username']);
}
function is_admin_logged_in() {
    return isset($_SESSION['admin_login']) && $_SESSION['admin_login'] == 'true';
}

function logout() {
    unset($_SESSION['username']);
    unset($_SESSION['admin_login']);
    session_destroy();
}

function is_user_admin() {
    if (isset($_SESSION['username'])) {
        $username = $_SESSION['username'];
        $stmt = $GLOBALS["conn"]->prepare("SELECT is_admin FROM player_login WHERE username=?;");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
        return $result[0]["is_admin"];
    }
    return false;
}

function username_exists($username) {
    $stmt = $GLOBALS["conn"]->prepare("SELECT COUNT(username) FROM players WHERE username = ?;");
    $stmt->bind_param("s", $username);
    if($stmt->execute()) {
        return $stmt->get_result()->fetch_row()[0] == 1;
    }
}