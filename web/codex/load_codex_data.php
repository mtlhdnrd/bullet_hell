<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
header('Content-Type: application/json; charset=utf-8');
if ($_SERVER["REQUEST_METHOD"] === 'GET') {
    switch ($_GET['data_type']) {
        case 'maps':
            //Query all the maps along with their data
            $stmt = $conn->prepare("SELECT name, description, file_name FROM maps;");
            $stmt->execute();
            if($stmt->errno)
            {
                echo $stmt->error;
            }
            $result = $stmt->get_result();
            $maps = [];
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $maps[] = $row;
                }
            }
            echo json_encode($maps);
            break;
        case 'characters':
            $username = $_SESSION['username'];
            $stmt = $conn->prepare("SELECT player_skins.id, player_skins.name, player_skins.file_name, player_skins.description, CASE WHEN player_skin_inventory.skin_id IS NOT NULL THEN 'Owned' ELSE 'Unowned' END as ownership_status FROM player_skins LEFT JOIN player_skin_inventory ON player_skins.id = player_skin_inventory.skin_id AND player_skin_inventory.player_id = ? ORDER BY player_skins.id;");
            $stmt->bind_param('s', $username);
            $stmt->execute();
            if($stmt->errno){
                echo $stmt->error;
            }
            $result = $stmt->get_result();
            $characters = [];
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $characters[] = $row;
                }
            }
            echo json_encode($characters);
        default:
            //echo "Some error happened";
            break;
    }
}else{
    echo "ERROR";
}
?>