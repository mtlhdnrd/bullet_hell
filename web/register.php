<?php
// Include config file
require_once "config.php";
require_once "utils.php";
 
// Define variables and initialize with empty values
$username = $password = $confirm_password = "";
$username_err = $password_err = $confirm_password_err = "";
if($_SERVER["REQUEST_METHOD"] == "POST")
{
    //Check for any uncompleted fields
    if(!isset($_POST['username'])){
        $username_err = "Please enter a valid username";
    }
    if(!isset($_POST['password'])){
        $password_err = "Please enter a valid password";
    }
    if($username_err == "")
        $username = $_POST['username'];
    if($password_err == "")
        $password = $_POST['password'];
    //Check if username exists in the database
    $sql = "SELECT * FROM player_login WHERE username='{$username}';";
    if(make_query($conn, $sql)->num_rows > 0)
    {
        $username_err = "This username already exists!";
    }else{
        //Add username and password to database
        $sql = "INSERT INTO player_login(username, password)  VALUES('{$username}', '{$password}');";
        if(make_query($conn, $sql))
            echo "Signup Completed successfully";
        //Signup complete, go to login
        header("Location: login.php");
    }

}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Gunkmasters</title>
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <div class="form-element">
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>"  method="post">
            <label for="username">Username</label>
            <input type="text" name="username" class="">
            <label for="password">Password</label>
            <input type="password" name="password" class="">
            <?php echo(!empty($username_err)) ? "<p style='color: red'>{$username_err} </p>" : '' ?>
            <input type="submit" value="Sign Up" class="btn btn-primary">
        </form>
        <p>Already have an account? <a href="login.php">Log in my brother</a></p>
    </div>

</body>
</html> 