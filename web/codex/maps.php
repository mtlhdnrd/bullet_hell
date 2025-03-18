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
    <title>Maps</title>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php"); ?>
    <link rel="stylesheet" href="src/style.css">
    <link rel="stylesheet" href="src/carousel_style.css">
</head>

<body data-page="maps">

    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php");?>
    <!-- Bootstrap centering -->
    <div id="carousel-wrapper" class="w-100">
        <div id="image-carousel">
            <div id="carousel-items-container"> <!-- Container for carousel items -->
            </div>

            <button id="prevBtn" class="carousel-control-prev" type="button">
                <img src="../src/images/ui/carousel-prev-icon.png" alt="Previous">
            </button>
            <button id="nextBtn" class="carousel-control-next" type="button">
                <img src="../src/images/ui/carousel-next-icon.png" alt="Next">
            </button>
        </div>
    </div>
    <script src="src/maps.js"></script>
</body>

</html>