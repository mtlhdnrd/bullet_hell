<?php
require_once("utils.php");
if(!(isset($_SESSION['admin_login']) && $_SESSION['admin_login'] == true))
{
    header("location: admin_login.php");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin panel - Bullet Hell</title>
</head>
<body>
    <h1>Bullet hell</h1>
</body>
</html>