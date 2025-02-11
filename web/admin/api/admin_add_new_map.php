<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");

IF($_SERVER['REQUEST_METHOD'] === 'POST')
{
    $name = $_POST['name'];
    $file = $_POST['file'];
    $description = $_POST['description'];
    $music = $_POST['music_id'];
    $query = "INSERT INTO maps (name, file_name, description, music_pack_id) VALUES(?,?,?,?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("sssi", $name, $file, $description, $music);
    $stmt->execute();
    if($stmt->errno){
        echo $stmt->error;
    }
    http_response_code(200);    
}