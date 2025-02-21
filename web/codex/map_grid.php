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
</head>

<body data-page="weapons">

    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php");
    ?>
    <!--div class="maps-section"-->
    <div>
        <div id="carouselExampleControls" class="carousel slide">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="w-100 h-100 anti-alias mx-auto" alt="First slide"
                        style="background-image: url('../src/images/maps/medieval_japan.png'); background-repeat: no-repeat; background-size: cover;">
                        <div class="map-description-tile text-right m-0">
                            <h1>Medieval Japan</h1>
                            <p>This is an ancient yappanese map. Lorem ipsum dolor sit amet consectetur adipisicing
                                elit. Minus, saepe?</p>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                <div class="w-100 h-100 anti-alias mx-auto" alt="First slide"
                        style="background-image: url('../src/images/maps/practice.png'); background-repeat: no-repeat; background-size: cover;">
                        <div class="map-description-tile text-right m-0">
                            <h1>Medieval Japan</h1>
                            <p>This is an ancient yappanese map. Lorem ipsum dolor sit amet consectetur adipisicing
                                elit. Minus, saepe?</p>
                        </div>
                </div>
                </div>
                <div class="carousel-item">
                <div class="w-100 h-100 anti-alias mx-auto" alt="First slide"
                        style="background-image: url('../src/images/maps/slaughterhouse.png'); background-repeat: no-repeat; background-size: cover;">
                        <div class="map-description-tile text-right m-0">
                            <h1>Medieval Japan</h1>
                            <p>This is an ancient yappanese map. Lorem ipsum dolor sit amet consectetur adipisicing
                                elit. Minus, saepe?</p>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <img src="../src/images/ui/carousel-prev-icon.png" class=" anti-alias" alt="">
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <img src="../src/images/ui/carousel-next-icon.png" class="img-fluid anti-alias" alt="">

            </a>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="src/map_grid.js" type="module"></script>
</body>

</html>