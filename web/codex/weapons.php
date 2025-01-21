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
    <title>Codex</title>
    <link rel="stylesheet" href="style.css">
</head>

<body data-page="weapons">

    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php");
    ?>
    <!--<script src="script.js"></script>-->
    <!--<div class="container">
        <div class="row mx-auto">
            <div class="col search-bar-block input-group my-5 mx-5">
                <input type="text" class="form-control" placeholder="Search" aria-label="Searching" aria-describedby="basic-addon2" id="search-bar">
                <div class="input-group-append">
                    <span class="input-group-text" id="basic-addon2">?</span>
                </div>
            </div>
        </div>
        <div class="weapon-container">
            
        </div>-->
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 hero-element bg-light">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-sm-12">
                            <ul>
                                <li>stats</li>
                                <li>stats</li>
                                <li>stats</li>
                                <li>stats</li>
                                <li>stats</li>
                                <li>stats</li>

                            </ul>
                        </div>
                        <div class="col-lg-4 col-sm-12">
                            <img src="../src/images/2.png" class="d-block mx-auto img-fluid" alt="">
                        </div>
                        <div class="col-lg-4 col-sm-12">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni labore eligendi, recusandae qui voluptate modi, amet consequatur aut excepturi impedit obcaecati inventore aspernatur? Ratione sit magnam, molestias asperiores assumenda quis amet sequi officiis dicta vero ipsum laborum aliquam quaerat libero ex ea fuga veritatis iste? Rerum aliquid vel commodi necessitatibus?</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-6">
                <h3 class="mb-3">Multi Item Carousel cards</h3>
            </div>
            <div class="col-6 text-right">
                <a class="btn btn-primary mb-3 mr-1"
                    href="#carouselExampleIndicators2"
                    role="button"
                    data-slide="prev">
                    <i class="fa fa-arrow-left"></i>
                </a>
                <a class="btn btn-primary mb-3"
                    href="#carouselExampleIndicators2"
                    role="button"
                    data-slide="next">
                    <i class="fa fa-arrow-right"></i>
                </a>
            </div>
            <div class="col-12">
                <div id="carouselExampleIndicators2"
                    class="carousel slide"
                    data-ride="carousel">

                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="row">

                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid"
                                            alt="100%x280"
                                            src="https://media.geeksforgeeks.org/wp-content/uploads/20240122184958/images2.jpg">
                                        <div class="card-body">
                                            <h4 class="card-title">
                                                Special title treatment</h4>
                                            <p class="card-text">With supporting text
                                                below as a natural lead-in</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid"
                                            alt="100%x280"
                                            src="https://media.geeksforgeeks.org/wp-content/uploads/20240122184958/images2.jpg">
                                        <div class="card-body">
                                            <h4 class="card-title">Special title
                                                treatment</h4>
                                            <p class="card-text">With supporting
                                                text below as a natural
                                                lead-in to additional
                                                content.</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid"
                                            alt="100%x280"
                                            src="https://media.geeksforgeeks.org/wp-content/uploads/20230407154213/gfg-bag.jpg">
                                        <div class="card-body">
                                            <h4 class="card-title">Special title treatment</h4>
                                            <p class="card-text">With supporting text below
                                                as a natural lead-in to
                                                additional content.</p>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">

                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid"
                                            alt="100%x280"
                                            src="https://media.geeksforgeeks.org/wp-content/uploads/20240110011854/reading-925589_640.jpg">
                                        <div class="card-body">
                                            <h4 class="card-title">Special title treatment</h4>
                                            <p class="card-text">With supporting text below
                                                as a natural lead-in to
                                                additional content.</p>

                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280"
                                            src="https://media.geeksforgeeks.org/wp-content/uploads/20240122182422/images1.jpg">
                                        <div class="card-body">
                                            <h4 class="card-title">Special title treatment</h4>
                                            <p class="card-text">With supporting text below
                                                as a natural lead-in to
                                                additional content.</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280"
                                            src="https://media.geeksforgeeks.org/wp-content/uploads/20240110011854/reading-925589_640.jpg">
                                        <div class="card-body">
                                            <h4 class="card-title">Special title treatment</h4>
                                            <p class="card-text">With supporting text below
                                                as a natural lead-in to
                                                additional content.</p>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">

                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid"
                                            alt="100%x280"
                                            src="https://media.geeksforgeeks.org/wp-content/uploads/20240110011815/sutterlin-1362879_640-(1).jpg">
                                        <div class="card-body">
                                            <h4 class="card-title">Special title treatment</h4>
                                            <p class="card-text">With supporting text below
                                                as a natural lead-in to
                                                additional content.</p>

                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280"
                                            src="https://media.geeksforgeeks.org/wp-content/uploads/20240110011929/glasses-1052010_640.jpg">
                                        <div class="card-body">
                                            <h4 class="card-title">Special title treatment</h4>
                                            <p class="card-text">With supporting text below
                                                as a natural lead-in to
                                                additional content.</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid"
                                            alt="100%x280"
                                            src="https://media.geeksforgeeks.org/wp-content/uploads/20240110011929/glasses-1052010_640.jpg">
                                        <div class="card-body">
                                            <h4 class="card-title">Special title treatment</h4>
                                            <p class="card-text">With supporting text below
                                                as a natural lead-in to
                                                additional content.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>