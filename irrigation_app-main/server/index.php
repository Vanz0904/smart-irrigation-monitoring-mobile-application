<?php

$servername = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "dwangwadb";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Set headers to allow cross-origin resource sharing (CORS)
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// Handle HTTP requests
$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        // Read operation
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        readData($conn, $id);
        break;

    case 'POST':
        // Create operation
        $data = json_decode(file_get_contents("php://input"));
        
        // Check if it's a login request
        login($conn, $data->username, $data->password);
        break;

    default:
        header('HTTP/1.1 405 Method Not Allowed');
        header('Allow: GET, POST, PUT, DELETE');
        break;
}

// Close the connection
$conn->close();

function readData($conn, $id) {
    if ($id > 0) {
        // Read a specific item
        $result = $conn->query("SELECT * FROM sensordata WHERE id = $id");
    } else {
        // Read all items
        $result = $conn->query("SELECT * FROM sensordata");
    }

    $items = [];

    while ($row = $result->fetch_assoc()) {
        $items[] = $row;
    }

    echo json_encode($items);
}

function login($conn, $username, $password) {
    $username = $conn->real_escape_string($username);
    $password = $conn->real_escape_string($password);

    $result = $conn->query("SELECT * FROM users WHERE Username = '$username' AND Password = '$password'");

    if ($result->num_rows > 0) {
        // User credentials are valid
        $user = $result->fetch_assoc();
        echo json_encode($user);
    } else {
        // Invalid credentials
        echo json_encode(['message' => 'Login failed']);
    }
}
?>
