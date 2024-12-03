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
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php");?>
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
                        Sign up
                    </div>
                    <div class="card-body">
                        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" id="register-form">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" name="username" id="username" class="form-control" required>
                            </div>
                            <p class="text-danger d-none" id="username-exists">The username already exists</p>
                            <p class="text-danger d-none" id="username-invalid-character">The username format invalid</p>


                            <div class="form-group">
                                <label for="password">Password</label>
                                <div class="input-group">
                                    <input type="password" name="password" class="form-control" id="password" required>
                                    <div class="input-group-append">
                                        <button class="btn btn-secondary" type="button" onclick="togglePwVisibility()">
                                            <i class="fa-solid fa-eye" id="eyeIcon"></i>
                                        </button>
                                    </div>
                                </div>
                                <?php echo (!empty($password_err)) ? "<p class='text-danger'>{$password_err}</p>" : ''; ?>
                            </div>
                        </form>
                        <button class="btn btn-primary my-3 px-4 py-2" style="background-color: green; border: none;" onclick="addNewUser()">Sign up</button>
                    </div>
                    <div class="card-footer">
                        Already have an account? <a href="../login/login.php">Log in my brother</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>