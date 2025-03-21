<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");

header('Content-Type: application/json');

try {
    // Check if the request method is POST
    if ($_SERVER['REQUEST_METHOD'] !== "POST") {
        http_response_code(405);
        throw new Exception("Invalid request method.  Only POST requests are allowed.");
    }

    // Validate input data
    if (!isset($_POST["username"]) || !isset($_POST["musicKit"])) {
        http_response_code(400);
        throw new Exception("Missing required parameters (username and/or musicKit).");
    }

    // not really needed to feed it through htmlspecialchars since it's an fk and registration
    // is sanitized, but better safe than sorry
    $username = htmlspecialchars(trim($_POST["username"]));
    $musicKitName = trim($_POST["musicKit"]); // Get music kit name

    // Input validation
    if (empty($username)) {
        http_response_code(400);
        throw new Exception("Username cannot be empty.");
    }

    if (empty($musicKitName)) {
        http_response_code(400);
        throw new Exception("Music Kit Name cannot be empty.");
    }


    // Get the music pack ID from the music_packs table based on the music kit name
    $query = "SELECT id FROM `music_packs` WHERE `name` = ?";
    $stmt = $conn->prepare($query);

    if ($stmt === false) {
        http_response_code(500);
        throw new Exception("Prepare failed: " . $conn->error);
    }

    $stmt->bind_param("s", $musicKitName);
    $stmt->execute();
    $result = $stmt->get_result(); // Fetch the result


    if ($stmt->errno) {
        http_response_code(500);
        throw new Exception("Execute failed: " . $stmt->error);
    }

    if ($result->num_rows === 0) {
        http_response_code(404);
        throw new Exception("Music kit with name '" . $musicKitName . "' not found."); // 404 Not Found
    }


    $row = $result->fetch_assoc();
    $musicPackId = intval($row['id']); // Get the ID and convert to integer
    $stmt->close();  //Close this statment.

    // Prepare the SQL query to insert into player_music_inventory
    $query = "INSERT INTO `player_music_inventory` (player_id, music_pack_id) VALUES(?, ?)";
    $stmt = $conn->prepare($query);

    if ($stmt === false) {
        http_response_code(500);
        throw new Exception("Prepare failed: " . $conn->error);
    }

    // Bind parameters
    $stmt->bind_param("si", $username, $musicPackId); // Use musicPackId

    // Execute the query
    $stmt->execute();

    // Check for errors after execution
    if ($stmt->errno) {
        http_response_code(500);
        throw new Exception("Execute failed: " . $stmt->error);
    }

    // Check if any rows were affected (optional)
    if ($stmt->affected_rows === 0) {
        http_response_code(409);
        throw new Exception("No rows were inserted.  Possible duplicate entry or data issue.");
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
    echo json_encode($response);
}
