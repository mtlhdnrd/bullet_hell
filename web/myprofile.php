<?php
    require_once("utils.php");
    if(!is_logged_in()){
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
    <?php require_once("header.php")?>
    <div class="container d-flex" style="margin: 120px 300px 0 300px;">
        <h1 class="text-start text-black fw-1" ><?php echo $_SESSION['username'];?></h1>
    </div>
</body>
</html>