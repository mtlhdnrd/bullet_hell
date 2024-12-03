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
    <title><?php echo $_SESSION['username']; ?></title>
</head>

<body>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php"); ?>
    <script src="<?php $_SERVER['DOCUMENT_ROOT'];?>/bullet_hell/web/src/js/load_profile_data.js" defer></script>
    <script src="<?php $_SERVER['DOCUMENT_ROOT'];?>/bullet_hell/web/src/js/change_password.js" defer></script>
    <div class="profile-container">
        <div class="justify-contents-center">
            <img src="../src/images/knight_web.png" class="anti-alias mx-auto " alt="player avatar" style="width: 100%; object-fit: cover;">
            <div class="row bg-light p-5">
                <h1 class="text-start text-black fw-1 text-center" id="username"><?php echo $_SESSION['username']; ?></h1>
            </div>
        </div>
        <div class="container-fluid justify-contents-center">

            <div class="row d-flex justify-contents-center mt-2">
                <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                    <h1 class="text-center" id="stat-points">-</h1>
                    <h1 class="text-center">Points</h1>
                </div>
                <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                    <h1 class="text-center" id="stat-winrate">-</h1>
                    <h1 class="text-center">Winrate</h1>
                </div>
                <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                    <h1 class="text-center" id="stat-gamesplayed">-</h1>
                    <h1 class="text-center">Games Played</h1>
                </div>
            </div>
            <div class="row d-flex justify-contents-center mt-2">
                <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                    <h1 class="text-center" id="stat-kills">-</h1>
                    <h1 class="text-center">Total Kills</h1>
                </div>
                <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                    <h1 class="text-center" id="stat-deaths">-</h1>
                    <h1 class="text-center">Total Deaths</h1>
                </div>
                <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                    <h1 class="text-center" id="stat-music">-</h1>
                    <h1 class="text-center">Favourite music</h1>
                </div>
            </div>
            <h4 class="mb-5">Change password</h4>
            <h4 class="text-success d-none bg-light" id="password-changed">Password changed successfully!</h4>
            <div class="change-pw">
                <div class="mb-3">
                    <label for="current-pw" class="form-label">Current Password</label>
                    <input type="password" class="form-control" id="current-pw" aria-describedby="emailHelp">
                    <p class="text-danger d-none" id="incorrect-password">Incorrect password!</p>
                </div>
                <div class="mb-3">
                    <label for="new-pw" class="form-label">New Password</label>
                    <input type="password" class="form-control" id="new-pw">
                </div>
                <div class="mb-3">
                    <label for="new-pw-again" class="form-label">Repeat New Password</label>
                    <input type="password" class="form-control" id="new-pw-again">
                    <p class="text-danger d-none" id="password-mismatch">Passwords do not match!</p>
                </div>
                <button type="submit" class="btn btn-secondary" onclick="changePassword()">Change</button>

            </div>
        </div>
    </div>
</body>

</html>