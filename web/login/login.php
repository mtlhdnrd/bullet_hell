<?php
// Include config file
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if(is_logged_in()) {
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
            <h1 class="text-center text-black">Welcome to Bullet Hell</h1>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        Login
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" name="username" class="form-control login-input" id="username" required>
                            <?php echo (!empty($username_err)) ? "<p class='text-danger'>{$username_err}</p>" : ''; ?>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <div class="input-group">
                                <input type="password" name="password" class="form-control login-input" id="password" required>
                                <div class="input-group-append">
                                    <button class="btn btn-secondary" type="button" onclick="togglePwVisibility()">
                                        <i class="fa fa-eye" id="eyeIcon"></i>
                                    </button>
                                </div>
                            </div>
                            <?php echo (!empty($password_err)) ? "<p class='text-danger'>{$password_err}</p>" : ''; ?>
                        </div>
                        <p class="text-danger d-none" id="incorrect-login">Incorrect login credentials!</p>
                        <button class="btn btn-primary my-3 px-4 py-2" id="login-button" onclick="LoginUser()">Log in</button>
                    </div>
                    <div class="card-footer">
                        Don't have an account? <a href="../register/register.php">Make one my brother</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>