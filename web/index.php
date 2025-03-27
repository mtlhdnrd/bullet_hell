<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if (!is_logged_in()) {
    header("Location: ./login/login.php");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bullet Hell - The Game</title>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php"); ?>
</head>

<body>
    <?php include($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php"); ?>
    <div class="hero-content container fade-in pixel-font">
        <div class="row">
            <img src="src/images/logo.png" alt="" class="img-fluid mx-auto w-50">
        </div>
        <div class="row">
            <p class="text-center w-50 mx-auto"><i>"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum
                    numquam accusantium veniam voluptas deserunt repudiandae dicta mollitia soluta quod iusto."</i></p>
        </div>
        <div class="row yt-video">
            <div class="embed-responsive embed-responsive-4by3 d-flex justify-content-center align-items-center">
                <iframe class="embed-responsive-item" width="600" height="400"
                    src="https://www.youtube.com/embed/tgbNymZ7vqY">
                </iframe>
            </div>
        </div>
        <div class="row">
            <div class="about-game-section w-50 mx-auto">
                <h2 class="text-left">The game</h2>
                <hr>
                <p class="text-justify">Bullet Hell is a 2D, 1v1 platformer shooter. The aim of the game is for players to test their skills in a local multiplayer environment, where one player uses a keyboard and mouse and the other player uses a connected gamepad for control. The game is designed in a pixelart style, with all visual elements created by a member of the development team, ensuring a consistent and unique look.</p>
                <p>The gameplay focuses on quick reflexes and tactical thinking. Players have a wide arsenal of weapons to choose from, including both melee (e.g. katana, scythe, knife) and ranged (e.g. pistol, musket, shotgun, kunai). Apart from basic movement options (left and right, jumping, ladder climbing), there are no special abilities, so players must rely solely on the effective use of weapons and the opportunities provided by the maps.</p>
            </div>
        </div>
        <div class="row">
            <div class="about-game-section w-50 mx-auto">
                <h2 >Inspiration</h2>
                <hr>
                <p class="text-right">Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam dolores fuga suscipit ex incidunt quo corporis molestiae harum, praesentium voluptates non saepe quidem ipsam in. Animi dolores suscipit est beatae reprehenderit nemo voluptates eligendi molestias quo quis cum distinctio hic, dolor ut dicta, labore vel! Ratione harum voluptatibus velit ex.</p>
            </div>
        </div>
    </div>
</body>

</html>