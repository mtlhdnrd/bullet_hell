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
    <link rel="icon" type="image/x-icon" href="<?php $_SERVER['DOCUMENT_ROOT'] ?>/bullet_hell/web/src/images/logo.png">
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php"); ?>
    <link rel="stylesheet" href="src/style.css">
    <title>User management</title>
</head>

<body>
    <?php require_once("admin_header.php"); ?>
    <div class="content">
        <h1>Users</h1>
        <label for="page_size">Number of users per page:</label>
        <select name="page_size" id="page_size">
            <?php
                foreach($GLOBALS["page_sizes"] as $size) {
                    echo "<option value=\"$size\"";
                    if($size == $_SESSION["players_per_page"]) {
                        echo " selected";
                    }
                    echo ">$size</option>";
                }
            ?>
        </select>
        <table class="table table-dark table-striped">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Username</th>
                    <th scope="col">Points</th>
                    <th scope="col">Winrate</th>
                    <th scope="col">Games Played</th>
                    <th scope="col">Kills</th>
                    <th scope="col">Deaths</th>
                    <th scope="col">Delete</th>
                </tr>
            </thead>
            <tbody class="table-contents">
            </tbody>
        </table>
        <div class="bg-dark text-center rounded" id="page-controls">
        </div>
    </div>
    <script src="../src/js/url_utils.js"></script>
    <script src="src/user_management.js"></script>
</body>

</html>