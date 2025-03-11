<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php");
if (!is_logged_in()) {
    header("Location: ../login/login.php");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mechanics</title>
    <link rel="stylesheet" href="src/style.css">
</head>

<body data-page="mechanics">
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php");
    ?>
    <div class="container">
        <div class="mechanics-container">
            <div class="row text-white mx-auto mb-4">
                <div class="col-12 d-flex flex-column align-items-center">
                    <div class="row yt-video">
                        <div class="embed-responsive embed-responsive-4by3 d-flex justify-content-center align-items-center">
                            <iframe class="embed-responsive-item" width="600" height="400"
                                src="https://www.youtube.com/embed/mjF1rmSV1dM">
                            </iframe>
                        </div>
                    </div>
                    <div class="text-start w-100">
                        <div class="col-12">
                            <h2>Movement</h2>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore tenetur deleniti
                                doloribus enim dolorem. Expedita nisi aut accusantium non, alias culpa error est
                                assumenda velit. Ut aperiam iure fugit, nulla facere nobis non odit autem!</p>
                        </div>
                    </div>
                </div>
            </div>
            <hr>

            <div class="row text-white mx-auto mb-4">
                <div class="col-12 d-flex flex-column align-items-center">
                    <div class="row yt-video">
                        <div class="embed-responsive embed-responsive-4by3 d-flex justify-content-center align-items-center">
                            <iframe class="embed-responsive-item" width="600" height="400"
                                src="https://www.youtube.com/embed/3Y-J7sBT_no">
                            </iframe>
                        </div>
                    </div>
                    <div class="text-start w-100">
                        <div class="col-12">
                            <h2>Acquiring weapons</h2>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore tenetur deleniti
                                doloribus enim dolorem. Expedita nisi aut accusantium non, alias culpa error est
                                assumenda velit. Ut aperiam iure fugit, nulla facere nobis non odit autem!</p>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </div>
    </div>

</body>

</html>
