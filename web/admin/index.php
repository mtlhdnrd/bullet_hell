<?php
// Include config file
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if (!is_admin_logged_in()) {
    header("location: admin_login.php");
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php"); ?>
    <link rel="stylesheet" href="src/style.css">
</head>

<body>
    <?php require_once("admin_header.php");
    header("location: user_management.php");
    ?>
</body>

</html>