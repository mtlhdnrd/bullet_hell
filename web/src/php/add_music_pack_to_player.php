<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

try {
    // Check if the request method is POST
    if ($_SERVER['REQUEST_METHOD'] !== "POST") {
        throw new Exception("Invalid request method.  Only POST requests are allowed.", 405);
    }

    // Validate input data
    if (!isset($_POST["username"]) || !isset($_POST["musicKit"])) {
        throw new Exception("Missing required parameters (username and/or musicKit).", 400);
    }

    $username = trim($_POST["username"]); // Trim whitespace
    $musicKitName = trim($_POST["musicKit"]); // Get music kit name

    // Input validation
    if (empty($username)) {
        throw new Exception("Username cannot be empty.", 400);
    }

    if (empty($musicKitName)) {
        throw new Exception("Music Kit Name cannot be empty.", 400);
    }


    // Get the music pack ID from the music_packs table based on the music kit name
    $query = "SELECT id FROM `music_packs` WHERE `name` = ?";
    $stmt = $conn->prepare($query);

    if ($stmt === false) {
        throw new Exception("Prepare failed: " . $conn->error, 500);
    }

    $stmt->bind_param("s", $musicKitName);
    $stmt->execute();
    $result = $stmt->get_result(); // Fetch the result


    if ($stmt->errno) {
        throw new Exception("Execute failed: " . $stmt->error, 500);
    }

    if ($result->num_rows === 0) {
        throw new Exception("Music kit with name '" . htmlspecialchars($musicKitName) . "' not found.", 404); // 404 Not Found
    }


    $row = $result->fetch_assoc();
    $musicPackId = intval($row['id']); // Get the ID and convert to integer
    $stmt->close();  //Close this statment.

    // Prepare the SQL query to insert into player_music_inventory
    $query = "INSERT INTO `player_music_inventory` (player_id, music_pack_id) VALUES(?, ?)";
    $stmt = $conn->prepare($query);

    if ($stmt === false) {
        throw new Exception("Prepare failed: " . $conn->error, 500);
    }

    // Bind parameters
    $stmt->bind_param("si", $username, $musicPackId); // Use musicPackId

    // Execute the query
    $stmt->execute();

    // Check for errors after execution
    if ($stmt->errno) {
        throw new Exception("Execute failed: " . $stmt->error, 500);
    }

    // Check if any rows were affected (optional)
    if ($stmt->affected_rows === 0) {
        throw new Exception("No rows were inserted.  Possible duplicate entry or data issue.", 409);
    }

    // Respond with success message
    $response = array("status" => "success", "message" => "Music kit added to inventory.");
    http_response_code(200);
    echo json_encode($response);

    // Close the statement
    $stmt->close();

} catch (Exception $e) {
    // Handle exceptions
    $response = array("status" => "error", "message" => $e->getMessage());
    http_response_code($e->getCode() ?: 500);
    echo json_encode($response);
} finally {
    // Close the database connection (if applicable)
    if (isset($conn)) {
        $conn->close();
    }
}