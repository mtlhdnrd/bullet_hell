<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php");
if (!is_logged_in()) {
    header("Location: ../login/login.php");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Codex</title>
    <link rel="stylesheet" href="src/style.css">
</head>

<body>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php");
    ?>
    <div class="codex-wrapper">
        <div class="codex-menu-tile" id="maps-tile" onclick="OpenSite('maps_grid.php')">
            <a href="maps_grid.php">
                <h1 class="text-white position-absolute">Maps</h1>
            </a>
        </div>
        <div class="codex-menu-tile" id="characters-tile" onclick="OpenSite('characters.php?character=1')">
            <a href="characters.php?character=1">
                <h1 class="text-white position-absolute">Characters</h1>
            </a>
        </div>
        <div class="codex-menu-tile" id="music-tile" onclick="OpenSite('music.php')">
            <a href="music.php">
                <h1 class="text-white position-absolute">Music</h1>
            </a>
        </div>
        <div class="codex-menu-tile" id="weapons-tile" onclick="OpenSite('weapons.php?weapon=0')">
            <a href="weapons.php?weapon=0">
                <h1 class="text-white position-absolute">Weapons</h1>
            </a>
        </div>
        <div class="codex-menu-tile" id="mechanics-tile" onclick="OpenSite('mechanics.php')">
            <a href="mechanics.php">
                <h1 class="text-white position-absolute">Mechanics</h1>
            </a>
        </div>
    </div>
</body>
<script src="src/script.js"></script>

</html>