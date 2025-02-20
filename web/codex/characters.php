<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php");
if (!is_logged_in()) {
    header("Location: ../login/login.php");
}
$characterIndex = $_GET['character'];
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Characters</title>
    <link rel="stylesheet" href="src/style.css">
</head>

<body data-page="weapons">

    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php");
    ?>
    <script src="src/character.js" type="module"></script>
    <!-- <div class="hero-section">

    </div>
    <div class="other-characters-section">

    </div> -->
    <div class="character-container">
        <div class="character-slide container-fluid p-0">
            <div class="row mx-auto">
                <div class="col-lg-9 col-md-12 p-3">
                    <h2 class="d-inline">Butcher</h2><br>
                    <p class="d-inline">Set free from the Váci hentes, on his way to kill the furries. (He killed the Duolingo Owl btw)</p>
                </div>
                <div class="col-lg-3 col-md-12">
                    <img src="knight.png" alt="" class="img-fluid img-fluid anti-alias mx-auto profile-image">
                </div>
            </div>
        </div>
    </div>
</body>

</html>