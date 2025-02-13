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
                $query = "SELECT maps.name, maps.description, maps.file_name, music_packs.name AS music_pack_name, music_packs.description AS music_pack_description FROM maps LEFT JOIN music_packs ON maps.music_pack_id = music_packs.id WHERE " . $_GET['condition'] . ";";
            } else {
                $query = "SELECT maps.name, maps.description,  maps.file_name, music_packs.name AS music_pack_name, music_packs.description AS music_pack_description FROM maps LEFT JOIN music_packs ON maps.music_pack_id = music_packs.id;";
            }
            $stmt = $conn->prepare($query);
            $stmt->execute();
            if ($stmt->errno) {
                echo $stmt->error;
            }
            $result = $stmt->get_result();
            $maps = [];
            if ($result->num_rows > 0) {
                $maps[] = $result->fetch_all(MYSQLI_ASSOC);
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
                $characters = $result->fetch_all(MYSQLI_ASSOC);

            }
            echo json_encode($characters);
            break;
        case 'music':
            $query = "";
            if (isset($_GET['condition'])) {
                $query = "SELECT name, cover_image, anthem, description, main_menu_theme1, main_menu_theme2 FROM music_packs WHERE " . $_GET['condition'] . " ORDER BY music_packs.name;";
            } else {
                $query = "SELECT name, cover_image, anthem, description, main_menu_theme1, main_menu_theme2 FROM music_packs ORDER BY music_packs.name;";
            }
            $stmt = $conn->prepare($query);
            $stmt->execute();
            if ($stmt->errno) {
                echo $stmt->error;
            }
            $result = $stmt->get_result();
            $music = [];
            if ($result->num_rows > 0) {
                $music[] = $result->fetch_all(MYSQLI_ASSOC);
            }
            echo json_encode($music);
            break;
        case 'weapons':
            $query = "";
            if (isset($_GET['condition'])) {
                $query = "SELECT weapons.id, name, file_name, damage, fire_rate, semi_auto, rarities.rarity, projectile_speed, description, devinfo FROM weapons INNER JOIN rarities ON weapons.rarity_id = rarities.id WHERE " . $_GET['condition'] . ";";
            } else {
                $query = "SELECT weapons.id, name, file_name, damage, fire_rate, semi_auto, rarities.rarity, projectile_speed, mag, description, devinfo FROM weapons INNER JOIN rarities ON weapons.rarity_id = rarities.id;";
            }
            $stmt = $conn->prepare($query);
            $stmt->execute();
            if ($stmt->errno) {
                echo $stmt->error;
            }
            $result = $stmt->get_result();
            $weapons = [];
            if ($result->num_rows > 0) {
                $weapons[] = $result->fetch_all(MYSQLI_ASSOC);
            }
            echo json_encode($weapons);
            break;
        default:
            //echo "Some error happened";
            break;
    }
} else {
    echo "ERROR";
}