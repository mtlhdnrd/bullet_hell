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
    <title>
        <?php echo $_SESSION['username']; ?>
    </title>
</head>

<body>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php"); ?>
    <script src="<?php $_SERVER['DOCUMENT_ROOT']; ?>/bullet_hell/web/src/js/load_profile_data.js" defer></script>
    <script src="<?php $_SERVER['DOCUMENT_ROOT']; ?>/bullet_hell/web/src/js/change_password.js" defer></script>
    <div class="profile-container py-3">
        <div class="justify-contents-center">
            <?php
            $query = "SELECT player_skins.file_name as `file_name` FROM player_skins INNER JOIN players ON players.active_skin_id = player_skins.id WHERE players.username = ?;";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("s", $_SESSION["username"]);
            $stmt->execute();
            $result = $stmt->get_result();
            while ($row = $result->fetch_assoc()) {
                echo "<img src='../src/images/characters/{$row['file_name']}' class='img-fluid anti-alias mx-auto profile-image' alt='player character'>";
            }
            ?>
            <div class="row p-5">
                <hr>
                <h1 class="text-start text-black fw-1 text-center text-uppercase mb-3" id="username">
                    <?php echo $_SESSION['username']; ?>
                </h1>
                <hr>
            </div>
        </div>
        <div class="container-fluid justify-contents-center">
            <div class="row d-flex justify-contents-center">
                <h1>Stats</h1>
                <hr>
            </div>
            <div class="row d-flex justify-contents-center mt-2 ">
                <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                    <h3 class="text-center" id="stat-points">-</h3>
                    <h3 class="text-center">Points</h3>
                </div>
                <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                    <h3 class="text-center" id="stat-winrate">-</h3>
                    <h3 class="text-center">Winrate</h3>
                </div>
                <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                    <h3 class="text-center" id="stat-gamesplayed">-</h3>
                    <h3 class="text-center">Games Played</h3>
                </div>
            </div>
            <hr>
            <div class="row d-flex justify-contents-center mt-2">
                <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                    <h3 class="text-center" id="stat-kills">-</h3>
                    <h3 class="text-center">Total Kills</h3>
                </div>
                <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                    <h3 class="text-center" id="stat-deaths">-</h3>
                    <h3 class="text-center">Total Deaths</h3>
                </div>
                <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto" title="Players's favourite music">
                    <br>
                    <h3 class="text-center display-5" id="stat-music"></h3>
                </div>
            </div>
            <hr>
            <div class="change-pw container-fluid">
                <h1 class="mb-5">Change password</h1>
                <h4 class="text-success d-none bg-light" id="password-changed">Password changed successfully!</h4>
                <div class="row">
                    <div class="col-12">
                        <div class="mb-3">
                            <label for="current-pw" class="form-label">Current Password</label>
                            <input type="password" class="form-control login-input" id="current-pw"
                                aria-describedby="emailHelp">
                            <p class="text-danger d-none" id="incorrect-password">Incorrect password!</p>
                        </div>
                        <div class="mb-3">
                            <label for="new-pw" class="form-label">New Password</label>
                            <input type="password" class="form-control login-input" id="new-pw">
                        </div>
                        <div class="mb-3">
                            <label for="new-pw-again" class="form-label">Repeat New Password</label>
                            <input type="password" class="form-control login-input" id="new-pw-again">
                            <p class="text-danger d-none" id="password-mismatch">Passwords do not match!</p>
                        </div>
                        <button type="submit" class="btn btn-secondary" id="login-button"
                            onclick="changePassword()">Change</button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>