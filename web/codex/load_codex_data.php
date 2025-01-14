<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
header('Content-Type: application/json; charset=utf-8');
if ($_SERVER["REQUEST_METHOD"] === 'GET') {
    switch ($_GET['data_type']) {
        case 'maps':
            //Query all the maps along with their data
            $query = "";
            if (isset($_GET['condition'])) {
                $query = "SELECT name, description, file_name FROM maps WHERE " . $_GET['condition'] . ";";
            } else {
                $query = "SELECT name, description, file_name FROM maps;";
            }
            $stmt = $conn->prepare($query);
            $stmt->execute();
            if ($stmt->errno) {
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
            $query = "";
            if (isset($_GET['condition'])) {
                $query = "SELECT player_skins.id, player_skins.name, player_skins.file_name, player_skins.description, CASE WHEN player_skin_inventory.skin_id IS NOT NULL THEN 'Owned' ELSE 'Unowned' END as ownership_status FROM player_skins LEFT JOIN player_skin_inventory ON player_skins.id = player_skin_inventory.skin_id AND player_skin_inventory.player_id = ? WHERE " . $_GET['condition'] . "ORDER BY player_skins.id;";
            } else {
                $query = "SELECT player_skins.id, player_skins.name, player_skins.file_name, player_skins.description, CASE WHEN player_skin_inventory.skin_id IS NOT NULL THEN 'Owned' ELSE 'Unowned' END as ownership_status FROM player_skins LEFT JOIN player_skin_inventory ON player_skins.id = player_skin_inventory.skin_id AND player_skin_inventory.player_id = ? ORDER BY player_skins.id;";
            }
            $stmt = $conn->prepare($query);
            $stmt->bind_param('s', $username);
            $stmt->execute();
            if ($stmt->errno) {
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
            break;
        case 'music':
            $query = "";
                if(isset($_GET['condition'])){
                    $query = "SELECT name, anthem, description, main_menu_theme1, main_menu_theme2, CASE WHEN player_music_inventory.player_id IS NOT NULL THEN 'Owned' ELSE 'Unowned' END as ownership_status FROM music_packs LEFT JOIN player_music_inventory ON music_packs.id = player_music_inventory.music_pack_id AND player_music_inventory.player_id = ? WHERE ".$_GET['condition']." ORDER BY music_packs.name;";
                }else{
                    $query = "SELECT name, anthem, description, main_menu_theme1, main_menu_theme2, CASE WHEN player_music_inventory.player_id IS NOT NULL THEN 'Owned' ELSE 'Unowned' END as ownership_status FROM music_packs LEFT JOIN player_music_inventory ON music_packs.id = player_music_inventory.music_pack_id AND player_music_inventory.player_id = ? ORDER BY music_packs.name;";
                }
                $stmt = $conn->prepare($query);
                $stmt->bind_param('s', $_SESSION['username']);
                $stmt->execute();
                if($stmt->errno)
                {
                    echo $stmt->error;
                }
                $result = $stmt->get_result();
                $music =  [];
                if($result->num_rows >0){
                    while($row = $result->fetch_assoc()){
                        $music[] = $row;
                    }
                }
                echo json_encode($music);
            break;
            case 'weapons':
            break;
        default:
            //echo "Some error happened";
            break;
    }
} else {
    echo "ERROR";
}
