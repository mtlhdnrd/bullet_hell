<?php
// Include config file
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if (!is_admin_logged_in()) {
    header("location: admin_login.php");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php"); ?>
    <link rel="stylesheet" href="src/style.css">
    <title>Character management</title>
</head>

<body>
    <?php require_once("admin_header.php"); ?>
    <div class="content">
        <h1>Characters</h1>
        <div class="table-container">
            <table class="table table-dark table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Delete</th>
                    </tr>
                </thead>
                <tbody class="table-contents">
                </tbody>
            </table>
        </div>
    </div>
    <div class="container">
        <h1>Add New Character</h1>
        <form action="" id="character-form" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="vanguard" required>
            </div>
            <div class="mb-3">
                <label for="display_image" class="form-label">Display image</label>
                <input type="text" class="form-control" id="display_image" name="display_image" placeholder="vanguard_display.png" required>
            </div>
            <div class="mb-3">
                <label for="background_image" class="form-label">Background image</label>
                <input type="text" class="form-control" id="background_image" name="background_image" placeholder="vanguard_background.png" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" placeholder="A fierce warrior leading the charge."></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Add Character</button>
        </form>
    </div>
    <script src="src/character_management.js"></script>
</body>

</html>