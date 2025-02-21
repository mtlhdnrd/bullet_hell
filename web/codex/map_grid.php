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
    <title>Maps</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="src/style.css">
    <link rel="stylesheet" href="src/carousel/style.css">
</head>

<body data-page="weapons">

    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php");
    ?>
    <!-- Slideshow container -->
    <div class="slideshow-container">

        <div class="slide w-100 h-100 anti-alias"
            style="background-image: url('../src/images/maps/medieval_japan.png'); background-repeat: no-repeat; background-size: cover;">
            <div class="map-description-tile text-right m-0">
                <h1>Medieval Japan</h1>
                <p>This is an ancient yappanese map. Lorem ipsum dolor sit amet consectetur adipisicing
                    elit. Minus, saepe?</p>
            </div>
        </div>
        <div class="slide w-100 h-100 anti-alias"
            style="background-image: url('../src/images/maps/practice.png'); background-repeat: no-repeat; background-size: cover;">
            <div class="map-description-tile text-right m-0">
                <h1>Medieval Japan</h1>
                <p>This is an ancient yappanese map. Lorem ipsum dolor sit amet consectetur adipisicing
                    elit. Minus, saepe?</p>
            </div>
        </div>
        <div class="slide w-100 h-100 anti-alias"
            style="background-image: url('../src/images/maps/slaughterhouse.png'); background-repeat: no-repeat; background-size: cover;">
            <div class="map-description-tile text-right m-0">
                <h1>Medieval Japan</h1>
                <p>This is an ancient yappanese map. Lorem ipsum dolor sit amet consectetur adipisicing
                    elit. Minus, saepe?</p>
            </div>
        </div>
        <a class="carousel-control carousel-control-prev h-100" role="button" onclick="LoadPrevious()">
        <img src="../src/images/ui/carousel-prev-icon.png" alt="" class="img-fluid anti-alias" >
        </a>
        <a class="carousel-control carousel-control-next h-100" role="button" onclick="LoadNext()">
        <img src="../src/images/ui/carousel-next-icon.png" alt="" class="img-fluid anti-alias" >
        </a>
    </div>
    <br>
    <script src="src/carousel/script.js"></script>
</body>

</html>