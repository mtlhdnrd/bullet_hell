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
                            <img class="img-fluid"
                                src="../src/videos/horizontal_.gif">
                            </im>
                        </div>
                    </div>
                    <div class="text-start w-100">
                        <div class="col-12">
                            <h2>Movement</h2>
                            <p>You can move left and right, and jump. The characters can be controlled with a keyboard and mouse,
                                or a game controller.</p>
                        </div>
                    </div>
                </div>
            </div>
            <hr>

            <div class="row text-white mx-auto mb-4">
                <div class="col-12 d-flex flex-column align-items-center">
                    <div class="row yt-video">
                        <div class="embed-responsive embed-responsive-4by3 d-flex justify-content-center align-items-center">
                        <img class="img-fluid"
                                src="../src/videos/climb.gif">
                            </im>
                        </div>
                    </div>
                    <div class="text-start w-100">
                        <div class="col-12">
                            <h2>Ladders</h2>
                            <p>There are ladders on the maps. You can climb them by going up to them and pressing the key assigned
                                to the upward direction. Going down is easy: just go there and you automatically descend.</p>
                        </div>
                    </div>
                </div>
            </div>
            <hr>

            <div class="row text-white mx-auto mb-4">
                <div class="col-12 d-flex flex-column align-items-center">
                    <div class="row yt-video">
                        <div class="embed-responsive embed-responsive-4by3 d-flex justify-content-center align-items-center">
                        <img class="img-fluid"
                                src="../src/videos/equip.gif">
                            </im>
                        </div>
                    </div>
                    <div class="text-start w-100">
                        <div class="col-12">
                            <h2>Acquiring weapons</h2>
                            <p>Various weapons are scattered across the maps. You can pick them up by hitting the assigned button.
                                You can also discard them, which you will have to do, since you only get one magazine per weapon.
                                It is recommended to go to the next weapon before you run out, or you will have a pretty bad day.</p>
                        </div>
                    </div>
                </div>
            </div>
            <hr>

            <div class="row text-white mx-auto mb-4">
                <div class="col-12 d-flex flex-column align-items-center">
                    <div class="row yt-video">
                        <div class="embed-responsive embed-responsive-4by3 d-flex justify-content-center align-items-center">
                        <img class="img-fluid"
                                src="../src/videos/altfire.gif">
                            </im>
                        </div>
                    </div>
                    <div class="text-start w-100">
                        <div class="col-12">
                            <h2>Aiming</h2>
                            <p>Aim you weapon of choice using the mouse or the secondary joystick on your controller. And towards your enemy.</p>
                        </div>
                    </div>
                </div>
            </div>
            <hr>

            <div class="row text-white mx-auto mb-4">
                <div class="col-12 d-flex flex-column align-items-center">
                    <div class="row yt-video">
                        <div class="embed-responsive embed-responsive-4by3 d-flex justify-content-center align-items-center">
                        <img class="img-fluid"
                                src="../src/videos/fire.gif">
                            </im>
                        </div>
                    </div>
                    <div class="text-start w-100">
                        <div class="col-12">
                            <h2>Attacking</h2>
                            <p>Fire you gun, swing your sword, stab with your knife, or otherwise try to kill your opponent by getting them
                                within your weapon's range, aiming their way, and pressing the assigned button. Some weapons take time,
                                some are instant. Keep an eye on your ammo, you don't want to miss the perfect chance to win because you
                                don't have any bullets!</p>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </div>
    </div>
</body>
</html>
