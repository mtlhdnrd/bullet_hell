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
        <div class="codex-menu-tile" id="maps-tile" onclick="OpenSite('maps.php')">
                <h1 class="text-white display-1">Maps</h1>
        </div>
        <div class="codex-menu-tile" id="characters-tile" onclick="OpenSite('characters.php')">
                <h1 class="text-white display-1">Characters</h1>
        </div>
        <div class="codex-menu-tile" id="music-tile" onclick="OpenSite('music.php')">
                <h1 class="text-white dead-center-text display-4">Music</h1>
        </div>
        <div class="codex-menu-tile" id="weapons-tile" onclick="OpenSite('weapons.php')">
                <h1 class="text-white display-2">Weapons</h1>
        </div>
        <div class="codex-menu-tile" id="mechanics-tile" onclick="OpenSite('mechanics.php')">
            <h1 class="text-white dead-center-text display-4">Mechanics</h1>
        </div>
    </div>
</body>
<script src="../src/js/form_utils.js"></script>

</html>