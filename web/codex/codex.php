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
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php");
    ?>
    <style>
        .block {
            background-color: red;
            border: 1px solid black;
            margin: 3px;
            height: 250px;
        }
    </style>
    <div class="container">
        <div class="row">
            <div class="col search-bar-block input-group my-5 mx-5">
                <input type="text" class="form-control" placeholder="Search" aria-label="Recipient's username" aria-describedby="basic-addon2">
                <div class="input-group-append">
                    <span class="input-group-text" id="basic-addon2">?</span>
                </div>
            </div>
        </div>
        <span class="codex-tiles">
            <div class="row mx-auto">
                <div class="col-lg-6 col-sm-12 block mx-auto">
                    <h1 class="text-white position-absolute">Maps</h1>
                    <a href="maps.php">
                        <img src="<?php $_SERVER['DOCUMENT_ROOT'] ?>/bullet_hell/web/src/images/knight_web.png" alt="">
                    </a>
                </div>
                <div class="col-lg-6 col-sm-12 block mx-auto">
                    <h1 class="text-white position-absolute">Character skins</h1>
                    <a href="characters.php">
                        <img src="<?php $_SERVER['DOCUMENT_ROOT'] ?>/bullet_hell/web/src/images/knight_web.png" alt="">
                    </a>
                </div>
            </div>
            <div class="row mx-auto">
                <div class="col-lg-4 col-sm-12 block mx-auto">
                    <h1 class="text-white position-absolute">Music</h1>
                    <a href="music.php">
                        <img src="<?php $_SERVER['DOCUMENT_ROOT'] ?>/bullet_hell/web/src/images/knight_web.png" alt="">
                    </a>
                </div>
                <div class="col-lg-4 col-sm-12 block mx-auto">
                    <h1 class="text-white position-absolute">Weapons</h1>
                    <a href="weapons.php">
                        <img src="<?php $_SERVER['DOCUMENT_ROOT'] ?>/bullet_hell/web/src/images/knight_web.png" alt="">
                    </a>
                </div>
                <div class="col-lg-4 col-sm-12 block mx-auto">
                    <h1 class="text-white position-absolute">Weapon skins</h1>
                    <a href="maps.php">
                        <img src="<?php $_SERVER['DOCUMENT_ROOT'] ?>/bullet_hell/web/src/images/knight_web.png" alt="">
                    </a>
                </div>

            </div>
        </span>
    </div>
</body>

</html>