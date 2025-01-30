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
    <div class="container my-5">
        <span class="codex-tiles">
            <div class="row mx-auto">
                <div class="col-lg-6 col-sm-12 block mx-auto codex-menu-tile">
                    <h1 class="text-white position-absolute">Maps</h1>
                    <a href="maps_grid.php">
                        <img src="<?php $_SERVER['DOCUMENT_ROOT'] ?>/bullet_hell/web/src/images/knight_web.png" alt="" class="anti-alias">
                    </a>
                </div>
                <div class="col-lg-6 col-sm-12 block mx-auto codex-menu-tile">
                    <h1 class="text-white position-absolute">Characters</h1>
                    <a href="characters.php?character=1">
                        <img src="<?php $_SERVER['DOCUMENT_ROOT'] ?>/bullet_hell/web/src/images/knight_web.png" alt="" class="anti-alias">
                    </a>
                </div>
            </div>
            <div class="row mx-auto">
                <div class="col-lg-6 col-sm-12 block mx-auto codex-menu-tile">
                    <h1 class="text-white position-absolute">Music</h1>
                    <a href="music.php">
                        <img src="<?php $_SERVER['DOCUMENT_ROOT'] ?>/bullet_hell/web/src/images/knight_web.png" alt="" class="anti-alias">
                    </a>
                </div>
                <div class="col-lg-6 col-sm-12 block mx-auto codex-menu-tile">
                    <h1 class="text-white position-absolute">Weapons</h1>
                    <a href="weapons.php?weapon=0">
                        <img src="<?php $_SERVER['DOCUMENT_ROOT'] ?>/bullet_hell/web/src/images/knight_web.png" alt="" class="anti-alias">
                    </a>
                </div>

            </div>
        </span>
    </div>
</body>

</html>