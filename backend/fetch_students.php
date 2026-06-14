<?php
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $sql = "SELECT id, name, roll_number, email, cgpa FROM students ORDER BY created_at DESC";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $students = [];
        while ($row = $result->fetch_assoc()) {
            $students[] = $row;
        }
        echo json_encode(['status' => true, 'data' => $students]);
    } else {
        echo json_encode(['status' => true, 'data' => []]);
    }
} else {
    echo json_encode(['status' => false, 'message' => 'Invalid request method']);
}

$conn->close();
?>
