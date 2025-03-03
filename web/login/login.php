<?php
// Include config file
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if (is_logged_in()) {
    header("Location: ../index.php");
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bullet Hell</title>
    <link rel="stylesheet" href="style.css">
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php"); ?>
</head>

<body>
<div class="container">
         <div class="row justify-content-center">
                <div class="col-md-6">
                 <div class="login-container">
                    <div class="login-header pixel-font">
                        <h1>Welcome to Bullet Hell</h1>
                    </div>

                        <div class="form-group">
                            <label for="username" class="pixel-font">Username</label>
                            <input type="text" name="username" class="form-control login-input" id="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password" class="pixel-font">Password</label>
                            <div class="input-group">
                                <input type="password" name="password" class="form-control login-input" id="password" required>
                                <div class="input-group-append">
                                    <button class="btn btn-secondary pixel-font" type="button" onclick="TogglePwVisibility()">
                                         <i class="fa fa-eye" id="eyeIcon"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <p class="text-danger d-none pixel-font" id="incorrect-login">Incorrect login credentials!</p>
                        <button class="btn btn-primary my-3 px-4 py-2 pixel-font" id="login-button" onclick="LoginUser()">Log in</button>

                    <div class="text-center mt-3 text-white pixel-font">
                        Don't have an account? <a href="../register/register.php" class="text-info">Make one my brother</a>
                    </div>
                </div>
            </div>
         </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="login.js"></script>
</body>
</html>