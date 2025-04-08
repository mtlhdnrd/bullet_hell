<?php
// Include config file
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if (is_admin_logged_in()) {
    header("Location: ./index.php");
}
if (!is_user_admin()) {
    header("Location: ../index.php");
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bullet Hell</title>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php"); ?>
</head>

<body>
    <div class="container mt-5">
        <div class="row mb-5">
            <h1 class="text-center text-white">Admin Panel</h1>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card bg-dark text-light">
                    <div class="card-header">
                        Login
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="password_admin">Password</label>
                            <div class="input-group">
                                <input type="password" name="password_admin" class="form-control credential-input" id="password" required>
                                <div class="input-group-append">
                                    <button class="btn btn-secondary" type="button" onclick="TogglePwVisibility()">
                                        <i class="fa fa-eye" id="eyeIcon"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <p class="text-danger d-none" id="incorrect-login">Incorrect login credentials!</p>
                        <button class="btn btn-primary my-3 px-4 py-2" id="credential-submit-button" onclick="LoginAdmin()">Log
                            in</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="src/script.js"></script>
    <script src="../src/js/form_utils.js"></script>
</body>

</html>