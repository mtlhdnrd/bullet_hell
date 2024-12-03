<?php
require_once("../utils.php");
require("../links.php");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Codex</title>
</head>

<body>
    <?php require_once("../header.php"); ?>
    <style>
        .block {
            background-color: red;
            border: 1px solid black;
            margin: 3px;
            height: 250px;
        }
    </style>
    <div class="container">
        <div class="row">
            <div class="col search-bar-block input-group my-5 mx-5">
                <input type="text" class="form-control" placeholder="Search" aria-label="Recipient's username" aria-describedby="basic-addon2">
                <div class="input-group-append">
                    <span class="input-group-text" id="basic-addon2">?</span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-6 block mx-auto"></div>
            <div class="col-6 block mx-auto"></div>
        </div>
        <div class="row">
            <div class="col-4 block mx-auto"></div>
            <div class="col-4 block mx-auto"></div>
            <div class="col-4 block mx-auto"></div>

        </div>
    </div>
</body>

</html>