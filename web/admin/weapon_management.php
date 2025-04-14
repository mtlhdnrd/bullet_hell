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
    <title>Weapon management</title>
</head>

<body>
    <?php require_once("admin_header.php"); ?>
    <div class="content">
        <h1>Weapons</h1>
        <div class="table-container">
            <table class="table table-dark table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Filename</th>
                        <th scope="col">Damage</th>
                        <th scope="col">Fire rate</th>
                        <th scope="col">Semi auto</th>
                        <th scope="col">Rarity</th>
                        <th scope="col">Projectile speed</th>
                        <th scope="col">Mag</th>
                        <th scope="col">Description</th>
                        <th scope="col">Devinfo</th>
                        <th scope="col">Delete</th>
                    </tr>
                </thead>
                <tbody class="table-contents">
                </tbody>
            </table>
        </div>
    </div>
    <div class="container">
        <h1>Add New Weapon</h1>
        <form action="" id="weapon-form" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Awesome Gun" required>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label">Image</label>
                <input type="text" class="form-control" id="image" name="image" placeholder="no_photo.jpg"
                    accept="image/*" required>
            </div>
            <div class="mb-3">
                <label for="damage" class="form-label">Damage</label>
                <input type="number" class="form-control" id="damage" name="damage" placeholder="10" required>
            </div>
            <div class="mb-3">
                <label for="fire_rate" class="form-label">Fire Rate</label>
                <input type="number" class="form-control" id="fire_rate" name="fire_rate" placeholder="1.0" step="0.1"
                    required>
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="semi_auto" name="semi_auto" placeholder="1">
                <label class="form-check-label" for="semi_auto">Semi Auto</label>
            </div>
            <div class="mb-3">
                <label for="rarity" class="form-label">Rarity</label>
                <select class="form-select" id="rarity" name="rarity_id" required>
                    <option value="1" selected>Common</option>
                    <option value="2">Uncommon</option>
                    <option value="3">Unique</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="projectile_speed" class="form-label">Projectile Speed</label>
                <input type="number" class="form-control" id="projectile_speed" name="projectile_speed"
                    placeholder="5.5" step="0.1">
            </div>
            <div class="mb-3">
                <label for="mag" class="form-label">Magazine Size</label>
                <input type="number" class="form-control" id="mag" name="mag" placeholder="30">
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description"
                    placeholder="A standard issue weapon."></textarea>
            </div>
            <div class="mb-3">
                <label for="devinfo" class="form-label">Dev Info</label>
                <textarea class="form-control" id="devinfo" name="devinfo" placeholder="None"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Add Weapon</button>
        </form>
    </div>
    <script src="src/weapon_management.js"></script>
</body>

</html>