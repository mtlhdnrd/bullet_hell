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
    $result = make_query($conn, $sql);
    if($result->num_rows == 1)
    {
        //Check if $result's password is the same as the field's
        $row = $result->fetch_assoc();
        if($row['password'] === $password)
        {
            //Login complete, proceed to website
            $_SESSION['username'] = $username;
            header("location: index.php");
        }else{
            $password_err = "Invalid password";
        }
        
    }else{

        $username_err = "Username doesn't exist";
    }

}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Duel Masters</title>
    <?php require_once('links.php');?>
</head>
<body>
    
<div class="container mt-5">
    <div class="row mb-5">
        <h1 class="text-center text-black">Welcome to Duel Masters</h1>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    Login
                </div>
                <div class="card-body">
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" name="username" class="form-control" required>
                            <?php echo(!empty($username_err)) ? "<p class='text-danger'>{$username_err}</p>" : ''; ?>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <div class="input-group">
                                <input type="password" name="password" class="form-control" id="password" required>
                                <div class="input-group-append">
                                    <button class="btn btn-secondary" type="button" onclick="togglePwVisibility()">
                                        <i class="fa fa-eye" id="eyeIcon"></i>
                                    </button>
                                </div>
                            </div>
                            <?php echo(!empty($password_err)) ? "<p class='text-danger'>{$password_err}</p>" : ''; ?>
                        </div>
                        <button type="submit" class="btn btn-primary my-3 px-4 py-2" >Log in</button>
                    </form>
                </div>
                <div class="card-footer">
                    Don't have an account? <a href="register.php">Make one my brother</a>
                </div>
            </div>
        </div>
    </div>
</div>

    <script>
        function togglePwVisibility(){
            var field = document.getElementById("password");
            if(field.type==="password"){
                field.type = "text";
            }else{
                field.type = "password";
            }
            //TODO itt hagytam abba
        }
    </script>
</body>
</html> 