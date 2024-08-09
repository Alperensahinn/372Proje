<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$transferID = isset($_POST['TransferID']) ? $_POST['TransferID'] : null;

$sql = "SELECT * FROM transfer";
if ($transferID !== null) {
    $sql .= " WHERE TransferID = $transferID";
}

$result = $conn->query($sql);

$transferData = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $transferData[] = $row;
    }
}

echo json_encode($transferData);

$conn->close();
?>
