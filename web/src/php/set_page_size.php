<?php
    require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
    require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && count($_POST) == 1 && isset($_POST["size"]) && is_int(intval($_POST["size"]))) {
        $_SESSION["players_per_page"] = max(intval($_POST["size"]), 1);
        http_response_code(200);
    } else {
        http_response_code(400);
    }
