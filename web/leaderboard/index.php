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
    <link rel="stylesheet" href="leaderboard.css">
    <title>Bullet Hell - Leaderboard</title>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php"); ?>
</head>

<body>
    <?php include($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php"); ?>

    <div class="container">
        <h1 class="pixel-font text-center my-3 py-2 bg-dark text-light border border-secondary">LEADERBOARD</h1>
        <table class="table my-2">
            <thead class="thead">
                <tr>
                    <th scope="col">Rank</th>
                    <th scope="col">Username</th>
                    <th scope="col"></th>
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

    <script src="leaderboard.js"></script>
</body>

</html>