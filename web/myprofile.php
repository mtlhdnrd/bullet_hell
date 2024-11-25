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
    <div class="container-fluid justify-contents-center">
        <div class="row bg-light p-5">
            <h1 class="text-start text-black fw-1 text-center"><?php echo $_SESSION['username']; ?></h1>
        </div>
        <div class="row bg-dark p-3">
            <h3 class="text-center text-white">Stats</h3>
        </div>
        <div class="row d-flex justify-contents-center mt-2">
            <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                <img src="src/bullet-icon.png" class="img-fluid mx-auto d-block"alt="bullet icon" width="200" height="200">
                <h1 class="text-center">320</h1>
            </div>
            <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                <img src="src/winrate-icon.png" class="img-fluid mx-auto d-block"alt="bullet icon" width="200" height="200">
                <h1 class="text-center">320</h1>
            </div>
            <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                <img src="src/bullet-icon.png" class="img-fluid mx-auto d-block"alt="bullet icon" width="200" height="200">
                <h1 class="text-center">320</h1>
            </div>
        </div>
        <div class="row d-flex justify-contents-center mt-2">
            <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                <img src="src/bullet-icon.png" class="img-fluid mx-auto d-block"alt="bullet icon" width="200" height="200">
                <h1 class="text-center">320</h1>
            </div>
            <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                <img src="src/bullet-icon.png" class="img-fluid mx-auto d-block"alt="bullet icon" width="200" height="200">
                <h1 class="text-center">320</h1>
            </div>
            <div class="col-lg-3 col-sm-12 p-5 stat-card mx-auto">
                <img src="src/bullet-icon.png" class="img-fluid mx-auto d-block"alt="bullet icon" width="200" height="200">
                <h1 class="text-center">320</h1>
            </div>
        </div>
    </div>
</body>

</html>