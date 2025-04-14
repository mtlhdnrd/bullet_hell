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
            <h1 class="text-center my-5">Bullet Hell</h1>
            <img src="src/images/logo/logoSquare10x.png" alt="" class="anti-alias mx-auto w-50 my-3">
        </div>
        <div class="row">
            <p class="text-center w-50 mx-auto"><i>With impeccable symmetry, you can still get lucky. With enough time though, the stronger warrior will prevail.
                    This 2D platformer-shooter aims to give both players a level playing field, with equal chances, all on one screen.
                </i></p>
        </div>
        <div class="row yt-video">
            <div class="embed-responsive embed-responsive-4by3 d-flex justify-content-center align-items-center">
                <video width="800" height="600" autoplay loop muted>
                    <source src="src/videos/gameplayFootage.mp4" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
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
                <h2>Inspiration</h2>
                <hr>
                <p class="text-right">LORN's discography and music video for Weigh Me Down - the slaughterhouse, and the overall industrial, bleak aesthetics<br>
                    Hotline Miami - pixelart, violence, adrenaline, directness towards player<br>
                    Tekken - Split-screen, local co-op, fighting game<br>
                    Drifters - Nobunaga's character and castle<br>
                    Warframe - for the idea of over-the-top weapons and a bit of parkour implementation, and the high-and-mighty tone
                </p>
            </div>
        </div>
    </div>
</body>

</html>