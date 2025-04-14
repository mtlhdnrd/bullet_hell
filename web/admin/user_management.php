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
        <div class="table-container">
            <table class="table table-dark table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th class="clickable_head" id="username" scope="col">Username<span></span></th>
                        <th class="clickable_head" id="points" scope="col">Points<span></span></th>
                        <th class="clickable_head" id="winrate" scope="col">Winrate<span></span></th>
                        <th class="clickable_head" id="all_games_played" scope="col">Games Played<span></span></th>
                        <th class="clickable_head" id="kills" scope="col">Kills<span></span></th>
                        <th class="clickable_head" id="deaths" scope="col">Deaths<span></span></th>
                        <th scope="col">Delete</th>
                    </tr>
                </thead>
                <tbody class="table-contents">
                    <tr>
                        <td colspan="7">Loading...</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="bg-dark text-center rounded" id="page-controls">
        </div>
    </div>
    <script src="../src/js/url_utils.js"></script>
    <script src="src/user_management.js"></script>
</body>

</html>