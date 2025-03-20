<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
header("Content-Type: application/json");
// Define variables and initialize with empty values
$username = $password = $confirm_password = "";
$username_err = $password_err = $confirm_password_err = "";
if (isset($_GET['user']) && count($_GET) == 1) {
    $username = $_GET['user'];
    $return[$username] = username_exists($username);
    echo json_encode($return);

} else {
    echo "USERNAME NOT EXISTS";
}