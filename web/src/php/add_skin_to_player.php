<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");

// Set content type to JSON for better API responses
header('Content-Type: application/json');

try {
    // Check if the request method is POST
    if ($_SERVER['REQUEST_METHOD'] !== "POST") {
        http_response_code(405);
        throw new Exception("Invalid request method.  Only POST requests are allowed.");
    }

    // Validate input data
    if (!isset($_POST["username"]) || !isset($_POST["skinName"])) {
        http_response_code(400);
        throw new Exception("Missing required parameters (username and/or skinName).");
    }

    // probably not needed, explained in add_music_pack_to_player.php
    $username = htmlspecialchars(trim($_POST["username"]));
    $skinName = trim($_POST["skinName"]); // Get skin name

    // Input validation
    if (empty($username)) {
        http_response_code(400);
        throw new Exception("Username cannot be empty.");
    }

    if (empty($skinName)) {
        http_response_code(400);
        throw new Exception("Skin Name cannot be empty.");
    }


    // Get the skin ID from the player_skins table based on the skin name
    $query = "SELECT id FROM `player_skins` WHERE `name` = ?";
    $stmt = $conn->prepare($query);

    if ($stmt === false) {
        http_response_code(500);
        throw new Exception("Prepare failed: " . $conn->error);
    }

    $stmt->bind_param("s", $skinName);
    $stmt->execute();
    $result = $stmt->get_result(); // Fetch the result


    if ($stmt->errno) {
        http_response_code(500);
        throw new Exception("Execute failed: " . $stmt->error);
    }

    if ($result->num_rows === 0) {
        http_response_code(404);
        throw new Exception("Skin with name '" . htmlspecialchars($skinName) . "' not found."); // 404 Not Found
    }


    $row = $result->fetch_assoc();
    $skinId = intval($row['id']); // Get the ID and convert to integer
    $stmt->close();  //Close this statment.

    // Prepare the SQL query to insert into player_skin_inventory
    $query = "INSERT INTO `player_skin_inventory` (player_id, skin_id) VALUES(?, ?)";
    $stmt = $conn->prepare($query);

    if ($stmt === false) {
        http_response_code(500);
        throw new Exception("Prepare failed: " . $conn->error);
    }

    // Bind parameters
    $stmt->bind_param("si", $username, $skinId); // Use skinId

    // Execute the query
    $stmt->execute();

    // Check for errors after execution
    if ($stmt->errno) {
        throw new Exception("Execute failed: " . $stmt->error, 500);
    }

    // Check if any rows were affected (optional)
    if ($stmt->affected_rows === 0) {
        http_response_code(409);
        throw new Exception("No rows were inserted.  Possible duplicate entry or data issue.");
    }

    // Respond with success message
    $response = array("status" => "success", "message" => "Skin added to player's inventory.");
    http_response_code(200);
    echo json_encode($response);

    // Close the statement
    $stmt->close();

} catch (Exception $e) {
    // Handle exceptions
    $response = array("status" => "error", "message" => $e->getMessage());
    echo json_encode($response);
}
