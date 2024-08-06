<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM bulun";
$result = $conn->query($sql);

$bulunData = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $bulunData[] = $row;
    }
}

echo json_encode($bulunData);

$conn->close();
?>
