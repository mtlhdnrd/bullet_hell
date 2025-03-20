<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
// this is *really* unsafe, the proper method would be (i think) having to call a start_game.php api,
// which would then generate a gametoken associated with the two players and store it,
// the game generating the same thing, and this would require that game token but oh well
if (isset($_POST["player1"], $_POST["player2"], $_POST["p1kills"], $_POST["p1deaths"], $_POST["p2kills"], $_POST["p2deaths"])
    && is_int(intval($_POST["p1kills"]))
    && is_int(intval($_POST["p1deaths"]))
    && is_int(intval($_POST["p2kills"]))
    && is_int(intval($_POST["p2deaths"]))
    && count($_POST) == 6
    && $_SERVER["REQUEST_METHOD"] === 'POST'
    && username_exists($_POST["player1"])
    && username_exists($_POST["player2"])) {
    $players = array($_POST['player1'], $_POST['player2']);
    $kills = array(intval($_POST['p1kills']), intval($_POST['p2kills']));
    $deaths = array(intval($_POST['p1deaths']), intval($_POST['p2deaths']));
    $points = array();
    for($i = 0; $i < 2; $i++) {
        array_push($points, $kills[$i] * 25 - $deaths[$i] * 25);
    }

    $conn->begin_transaction();
    $result = true;
    for($i = 0; $result && $i < 2; $i++) {
        $stmt = $conn->prepare("UPDATE players SET all_games_played = all_games_played + 1, kills = kills + ?, deaths = deaths + ?, points = points + ? WHERE username=?;");
        $stmt->bind_param("iiis", $kills[$i], $deaths[$i], $points[$i], $players[$i]);
        $result = $result && $stmt->execute();
    }
    if ($result) {
        $conn->commit();
        http_response_code(200);
    } else {
        $conn->rollback();
        http_response_code(500);
    }
} else {
    http_response_code(400);
}
