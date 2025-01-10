<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Codex</title>
    <link rel="stylesheet" href="style.css">
</head>

<body data-page="characters">
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php");
    ?>
    <script src="script.js"></script>
    <div class="container character-container">
        <div class="row mx-auto">
            <div class="col search-bar-block input-group my-5 mx-5">
                <input type="text" class="form-control" placeholder="Search" aria-label="Searching" aria-describedby="basic-addon2">
                <div class="input-group-append">
                    <span class="input-group-text" id="basic-addon2">?</span>
                </div>
            </div>
            
        </div>
        
    </div>
</body>

</html>