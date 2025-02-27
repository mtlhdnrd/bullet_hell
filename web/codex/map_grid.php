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
    <div class="container-fluid p-0">
        <div id="image-carousel">

            <div class="carousel-item active">
                <img src="../src/images/maps/japan_display_00000.png" alt="Map 1">
                <div class="description-label">
                    <h1>Map 1 Name</h1>
                    <p>Description of Map 1. Lorem ipsum dolor sit amet...</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="../src/images/maps/practice_display_00000.png" alt="Map 2">
                <div class="description-label">
                    <h1>Map 2 Name</h1>
                    <p>Description of Map 2.  Consectetur adipiscing elit...</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="../src/images/maps/ham_display_00000.png" alt="Map 3">
                <div class="description-label">
                    <h1>Map 3 Name</h1>
                    <p>Description of Map 3. Sed do eiusmod tempor...</p>
                </div>
            </div>

            <button id="prevBtn" class="carousel-control-prev" type="button">
                <img src="../src/images/ui/carousel-prev-icon.png" alt="Previous">
            </button>
            <button id="nextBtn" class="carousel-control-next" type="button">
                <img src="../src/images/ui/carousel-next-icon.png" alt="Next">
            </button>
        </div>
    </div>

    <script src="src/carousel/script.js"></script>
</body>

</html>