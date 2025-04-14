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
    <title>Map management</title>
</head>

<body>
    <?php require_once("admin_header.php"); ?>
    <div class="content">
        <h1>Maps</h1>
        <div class="table-container">
            <table class="table table-dark table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Music pack</th>
                        <th scope="col">Delete</th>
                    </tr>
                </thead>
                <tbody class="table-contents">
                </tbody>
            </table>
        </div>
    </div>
    <div class="container">
        <h1>Add New Map</h1>
        <form action="" id="map-form" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Awesome Map" required>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label">File</label>
                <input type="text" class="form-control" id="file" name="file" placeholder="no_file.jpg" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" placeholder="A standard issue map."></textarea>
            </div>
            <div class="mb-3">

                <label for="rarity" class="form-label">Music Pack</label>
                <select class="form-select" id="music_id" name="music_id" required>
                    <?php
                    $query = "SELECT music_packs.id, music_packs.name FROM music_packs;";
                    $stmt = $conn->prepare($query);
                    $stmt->execute();
                    if ($stmt->errno) {
                        echo $stmt->error;
                    }
                    $result = $stmt->get_result();
                    $music = [];
                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo "<option value='" . $row['id'] . "'>" . $row['name'] . "</option>";
                        }
                    }
                    ?>

                </select>
            </div>
            <button type="submit" class="btn btn-primary">Add Map</button>
        </form>
    </div>
    <script src="src/map_management.js"></script>
</body>

</html>