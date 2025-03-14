<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if (isset($_GET['username'])) {
    $username = $_GET['username'];
    $stmt = $conn->prepare("SELECT ps.name, CASE WHEN p.active_skin_id = ps.id THEN 1 ELSE 0 END AS active FROM player_skins AS ps INNER JOIN player_skin_inventory AS psi ON ps.id = psi.skin_id INNER JOIN players AS p ON psi.player_id = p.username WHERE psi.player_id = ?;");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    http_response_code(200);
    header("Content-Type: application/json");
    echo json_encode($result);
} else {
    http_response_code(400);
    echo "USERNAME NOT SET";
}
