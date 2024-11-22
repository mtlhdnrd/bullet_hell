<?php
    require_once("utils.php");
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
    <?php require_once("links.php");?>
</head>
<body style="background-image: url('./src/i am starving brother.jpg'); background-repeat: no-repeat; background-size:cover;">
    <?php include("header.php");?>
</body>
</html>