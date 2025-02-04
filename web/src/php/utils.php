<?php
session_start();
function make_query($conn, $sql) {
    return $conn -> query($sql);
}
function is_logged_in() {
    return isset($_SESSION['username']);
}
function is_admin_logged_in(){
    return isset($_SESSION['admin_login']) && $_SESSION['admin_login'] == 'true';
}

function logout() {
    unset($_SESSION['username']);
    unset($_SESSION['admin_login']);
}
