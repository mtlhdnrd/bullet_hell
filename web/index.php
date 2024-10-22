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
    <title>Gunkmasters</title>
</head>
<body>
<h1 style="text-align: center; font-family: 'Impact';">WELCOME TO GUNKMASTERS</h1>
<h3>Logged in as <?php echo $_SESSION['username'];?></h3>
<img src="src/i am starving brother.jpg" alt="I am starving brother!">
<a href="logout.php"><button>Kijel</button></a>
</body>
</html>