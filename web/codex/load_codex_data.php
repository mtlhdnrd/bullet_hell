<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
header('Content-Type: application/json; charset=utf-8');
if ($_SERVER["REQUEST_METHOD"] === 'GET') {
    switch ($_GET['data_type']) {
        case 'maps':
            //Query all the maps along with their data
            $query = "SELECT maps.name AS name, maps.description AS map_description, maps.file_name AS map_file_name, music_packs.name AS music_pack_name, music_packs.description AS music_pack_description FROM maps LEFT JOIN music_packs ON maps.music_pack_id = music_packs.id;";
            $stmt = $conn->prepare($query);
            $stmt->execute();
            if ($stmt->errno) {
                echo $stmt->error;
            }
            $result = $stmt->get_result();
            $maps = [];
            if ($result->num_rows > 0) {
                $maps = $result->fetch_all(MYSQLI_ASSOC);
            }
            echo json_encode($maps);
            break;
        case 'characters':
            $username = $_SESSION['username'];
            $query = "SELECT player_skins.id, player_skins.name, player_skins.display_image, player_skins.background_image, player_skins.description, CASE WHEN player_skin_inventory.skin_id IS NOT NULL THEN 'Unlocked' ELSE 'Locked' END as ownership_status FROM player_skins LEFT JOIN player_skin_inventory ON player_skins.id = player_skin_inventory.skin_id AND player_skin_inventory.player_id = ? ORDER BY player_skins.id;";
            $stmt = $conn->prepare($query);
            $stmt->bind_param('s', $username);
            $stmt->execute();
            if ($stmt->errno) {
                echo $stmt->error;
            }
            $result = $stmt->get_result();
            $characters = [];
            if ($result->num_rows > 0) {
                $characters = $result->fetch_all(MYSQLI_ASSOC);
            }
            echo json_encode($characters);
            break;
        case 'music':
            $query = "";
            $condition = "%";
            if (isset($_GET['condition'])) {
                $condition = "%".$_GET['condition']."%";
            }
            $query = "SELECT name, cover_image, anthem, description, main_menu_theme1, main_menu_theme2 FROM music_packs WHERE `name` LIKE ? ORDER BY music_packs.name;";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("s", $condition);
            $stmt->execute();
            if ($stmt->errno) {
                echo $stmt->error;
            }
            $result = $stmt->get_result();
            $music = [];
            if ($result->num_rows > 0) {
                $music = $result->fetch_all(MYSQLI_ASSOC);
            }
            echo json_encode($music);
            break;
        case 'weapons':
            $query = "SELECT weapons.id, name, file_name, damage, fire_rate, semi_auto, rarities.rarity, projectile_speed, mag, description, devinfo FROM weapons INNER JOIN rarities ON weapons.rarity_id = rarities.id;";
            $stmt = $conn->prepare($query);
            $stmt->execute();
            if ($stmt->errno) {
                echo $stmt->error;
            }
            $result = $stmt->get_result();
            $weapons = [];
            if ($result->num_rows > 0) {
                $weapons = $result->fetch_all(MYSQLI_ASSOC);
            }
            echo json_encode($weapons);
            break;
        default:
            //echo "Some error happened";
            http_response_code(400);
            break;
    }
} else {
    echo "ERROR";
}