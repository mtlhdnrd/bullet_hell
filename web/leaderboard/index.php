<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if (!is_logged_in()) {
    header("Location: ../login/login.php");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bullet Hell - Leaderboard</title>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php"); ?>
</head>

<body>
    <?php include($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php"); ?>

    <div class="container">
        <table class="table table-dark table-striped my-2">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Username</th>
                    <th scope="col">Points</th>
                    <th scope="col">Winrate</th>
                    <th scope="col">Games Played</th>
                    <th scope="col">Kills</th>
                    <th scope="col">Deaths</th>
                </tr>
            </thead>
            <tbody class="table-contents">
            </tbody>
        </table>
        <div class="bg-dark text-center rounded" id="page-controls">
        </div>
    </div>

    <script src="src/leaderboard.js"></script>
</body>

</html>