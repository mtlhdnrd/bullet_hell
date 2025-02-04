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
    <link rel="icon" type="image/x-icon" href="<?php $_SERVER['DOCUMENT_ROOT'] ?>/bullet_hell/web/src/images/logo.png">
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php"); ?>
    <link rel="stylesheet" href="style.css">
    <title>User management</title>
</head>

<body>
    <?php require_once("admin_header.php"); ?>
    <div class="content">
        <h1>Players</h1>
        <table class="table table-dark table-striped">
        <thead class="thead-dark">
            <tr>
            <th scope="col">Username</th>
            <th scope="col">Points</th>
            <th scope="col">Winrate</th>
            <th scope="col">Games Played</th>
            <th scope="col">Kills</th>
            <th scope="col">Deaths</th>
            <th scope="col">Delete</th>
            </tr>
        </thead>
        <tbody class="table-contents">
        </tbody>
    </table>
    </div>
    <script src="user_management.js"></script>
</body>

</html>