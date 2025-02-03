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
    <title>Admin Panel</title>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php"); ?>
    <link rel="icon" type="image/x-icon" href="<?php $_SERVER['DOCUMENT_ROOT'] ?>/bullet_hell/web/src/images/logo.png">

    <link rel="stylesheet" href="style.css">
</head>

<body>

    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Bullet hell - Admin</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">User management</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Weapon management</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Map management</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Music management</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>