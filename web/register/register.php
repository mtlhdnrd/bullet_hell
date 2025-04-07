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
    <link rel="stylesheet" href="register.css">
    <title>Bullet Hell</title>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php"); ?>
</head>

<body>
<div class="container">
         <div class="row justify-content-center">
                <div class="col-md-6">
                 <div class="register-container mx-auto">
                    <div class="register-header pixel-font">
                        <h1>Welcome to Bullet Hell</h1>
                    </div>

                        <form action="" method="post" id="register-form">
                        <div class="form-group">
                            <label for="username" class="pixel-font">Username</label>
                            <input type="text" name="username" class="form-control credential-input" id="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password" class="pixel-font">Password</label>
                            <div class="input-group">
                                <input type="password" name="password" class="form-control credential-input" id="password" required>
                                <div class="input-group-append">
                                    <button class="btn btn-secondary pixel-font" type="button" onclick="TogglePwVisibility()">
                                         <i class="fa fa-eye" id="eyeIcon"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <p class="text-danger d-none pixel-font" id="incorrect-register">Invalid characters in username!</p>
                        <button type="button" class="btn btn-success my-3 px-4 py-2 pixel-font" id="credential-submit-button" onclick="RegisterUser()">Sign up</button>
                        </form>

                    <div class="text-center mt-3 text-white pixel-font">
                        Already have an account? <a href="../login/login.php" class="text-info">Sign in</a>
                    </div>
                </div>
            </div>
         </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="register.js"></script>
    <script src="../src/js/form_utils.js"></script>
</body>
</html>