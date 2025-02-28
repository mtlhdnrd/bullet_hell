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
    <!-- <div class="hero-section">

    </div>
    <div class="other-characters-section">

    </div> -->
    <div class="character-slides-container container-fluid p-0">
    </div>
    <script src="src/character.js" type="module"></script>
</body>

</html>