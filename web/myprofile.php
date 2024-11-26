<?php
require_once("utils.php");
require("links.php");
if (!is_logged_in()) {
    header("location: login.php");
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $_SESSION['username']; ?></title>
</head>

<body>
    <?php include("header.php") ?>
    <script src="load_profile_data.js" defer></script>
    <div class="container-fluid justify-contents-center">
        <div class="row bg-light p-5">
            <h1 class="text-start text-black fw-1 text-center" id="username"><?php echo $_SESSION['username']; ?></h1>
        </div>
        <div class="row bg-dark p-3">
            <h3 class="text-center text-white">Stats</h3>
        </div>
        <div class="row d-flex justify-contents-center mt-2">
            <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                <h1 class="text-center" id="stat-points">320</h1>
                <h1 class="text-center">Points</h1>
            </div>
            <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                <h1 class="text-center" id="stat-winrate">320</h1>
                <h1 class="text-center">Winrate</h1>
            </div>
            <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                <h1 class="text-center" id="stat-gamesplayed">320</h1>
                <h1 class="text-center">Games Played</h1>
            </div>
        </div>
        <div class="row d-flex justify-contents-center mt-2">
            <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                <h1 class="text-center" id="stat-kills">320</h1>
                <h1 class="text-center">Total Kills</h1>
            </div>
            <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                <h1 class="text-center" id="stat-deaths">320</h1>
                <h1 class="text-center">Total Deaths</h1>
            </div>
            <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                <h1 class="text-center" id="stat-music">320</h1>
                <h1 class="text-center">Favourite music</h1>
            </div>
        </div>
    </div>
</body>

</html>