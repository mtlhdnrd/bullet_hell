<?php
    require_once($_SERVER['DOCUMENT_ROOT']."/bullet_hell/web/src/php/utils.php");
    if(!is_logged_in()) {
        header("location: login.php");
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bullet Hell - The Game</title>
    <?php require_once($_SERVER['DOCUMENT_ROOT']."/bullet_hell/web/src/php/links.php");?>
</head>
<body>
    <?php include($_SERVER['DOCUMENT_ROOT']."/bullet_hell/web/src/php/header.php");?>
</body>
</html>