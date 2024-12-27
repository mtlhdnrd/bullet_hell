<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
header('Content-Type: application/json; charset=utf-8');
if ($_SERVER["REQUEST_METHOD"] === 'GET') {
    switch ($_GET['data_type']) {
        case 'maps':
            //Query all the maps along with their data
            $stmt = $conn->prepare("SELECT name, description FROM maps;");
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
        default:
            echo "Some error happened";
            break;
    }
}else{
    echo "ERROR";
}
?>