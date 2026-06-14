<?php
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    if (!isset($data['name']) || !isset($data['roll_number']) || !isset($data['email']) || !isset($data['cgpa'])) {
        echo json_encode(['status' => false, 'message' => 'Missing required fields']);
        exit();
    }

    $name = $conn->real_escape_string($data['name']);
    $roll_number = $conn->real_escape_string($data['roll_number']);
    $email = $conn->real_escape_string($data['email']);
    $cgpa = floatval($data['cgpa']);

    $sql = "INSERT INTO students (name, roll_number, email, cgpa) VALUES ('$name', '$roll_number', '$email', $cgpa)";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(['status' => true, 'message' => 'Student added successfully']);
    } else {
        echo json_encode(['status' => false, 'message' => 'Error: ' . $conn->error]);
    }
} else {
    echo json_encode(['status' => false, 'message' => 'Invalid request method']);
}

$conn->close();
?>
