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
    <title>Music management</title>
</head>

<body>
    <?php require_once("admin_header.php"); ?>
    <div class="content">
        <h1>Music</h1>
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
        <h1>Add New Music Pack</h1>
        <form action="" id="music-pack-form" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Cool music" required>
            </div>
            <div class="mb-3">
                <label for="cover_image" class="form-label">Cover Image</label>
                <input type="text" class="form-control" id="cover_image" name="cover_image" placeholder="cover.png" required>
            </div>
            <div class="mb-3">
                <label for="anthem" class="form-label">Anthem</label>
                <input type="text" class="form-control" id="anthem" name="anthem" placeholder="no_file.mp3" required>
            </div>
            <div class="mb-3">
                <label for="main_menu_theme1" class="form-label">Main Menu Theme 1</label>
                <input type="text" class="form-control" id="main_menu_1" name="main_menu_1" placeholder="no_file.mp3"
                    required>
            </div>
            <div class="mb-3">
                <label for="main_menu_theme2" class="form-label">Main Menu Theme 2</label>
                <input type="text" class="form-control" id="main_menu_2" name="main_menu_2" placeholder="no_file.mp3"
                    required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" placeholder="The best music to ever exist."></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Add Music Pack</button>
        </form>
    </div>
    <script src="src/music_management.js"></script>
</body>

</html>