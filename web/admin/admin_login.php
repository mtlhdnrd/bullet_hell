<?php
// Include config file
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
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
            <h1 class="text-center text-black">Admin Panel</h1>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        Login
                    </div>
                    <div class="card-body">
                        <!--form action="" method="get" id="admin-login-form" onsubmit="LoginAdmin()"-->
                        <div class="form-group">
                            <label for="username_admin">Username</label>
                            <input type="text" name="username_admin" class="form-control" id="username_admin" required>
                            <?php echo (!empty($username_err)) ? "<p class='text-danger'>{$username_err}</p>" : ''; ?>
                        </div>
                        <div class="form-group">
                            <label for="password_admin">Password</label>
                            <div class="input-group">
                                <input type="password" name="password_admin" class="form-control" id="password_admin"
                                    required>
                                <div class="input-group-append">
                                    <button class="btn btn-secondary" type="button" onclick="togglePwVisibility()">
                                        <i class="fa fa-eye" id="eyeIcon"></i>
                                    </button>
                                </div>
                            </div>
                            <?php echo (!empty($password_err)) ? "<p class='text-danger'>{$password_err}</p>" : ''; ?>
                        </div>
                        <p class="text-danger d-none" id="incorrect-login">Incorrect login credentials!</p>
                        <button class="btn btn-primary my-3 px-4 py-2" type="submit" onclick="LoginAdmin()">Log
                            in</button>
                        <!--/form-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="script.js"></script>
</body>

</html>