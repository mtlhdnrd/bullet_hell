<?php
/* Database credentials. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'bullet_hell');

/* Attempt to connect to MySQL database */
$conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
$conn->set_charset("utf8");
$GLOBALS["conn"] = $conn;
$GLOBALS["page_sizes"] = array(15, 25, 50, 75);
if(!isset($_SESSION["players_per_page"])) {
    $_SESSION["players_per_page"] = 25;
}

// Check connection
if ($conn === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}