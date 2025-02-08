<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");

IF($_SERVER['REQUEST_METHOD'] === 'POST')
{
    $name = $_POST['name'];
    $image = $_POST['image'];
    $damage = $_POST['damage'];
    $fire_rate = $_POST['fire_rate'];
    $semi_auto = isset($_POST['semi_auto'])? 1: 0;
    $rarity = $_POST['rarity_id'];
    $projectile_speed = $_POST['projectile_speed'];
    $mag = $_POST['mag'];
    $description = $_POST['description'];
    $devinfo = $_POST['devinfo'];
    $query = "INSERT INTO weapons (name, file_name, damage, fire_rate, semi_auto, rarity_id, projectile_speed, mag, description, devinfo) VALUES(?,?,?,?,?,?,?,?,?,?)";
    echo "Rarity: ".$rarity;
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ssidiidiss", $name, $image, $damage, $fire_rate, $semi_auto, $rarity, $projectile_speed, $mag, $description, $devinfo);
    $stmt->execute();
    if($stmt->errno){
        echo $stmt->error;
    }
    http_response_code(200);    
}