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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">

</head>

<body data-page="weapons">

    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php");
    ?>
    <script src="weapons.js"></script>
    <div class="hero-section">

    </div>
    <div class="other-weapons-section">
        <div class="container">
            <div class="row g-0">
                <div class="col-lg-3 col-sm-12">
                    <div class="weapon-tile d-flex flex-column align-items-center bg-dark">
                        <img src="../src/images/1.png" alt="alt" class="img-thumbnail w-50">
                        <div class="text-center">Weapon [vípön]</div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-12">
                    <div class="weapon-tile d-flex flex-column align-items-center bg-dark">
                        <img src="../src/images/1.png" alt="alt" class="img-thumbnail w-50">
                        <div class="text-center">Weapon [vípön]</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>