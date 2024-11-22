<?php
    require_once("utils.php");
    if(!is_logged_in()) {
        header("location: login.php");
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $_SESSION['username'];?></title>
</head>
<body>
    <?php include("header.php")?>
    <div class="container-fluid d-flex">
        <h1 class="text-start text-black fw-1" ><?php echo $_SESSION['username'];?></h1>
    </div>
</body>
</html>