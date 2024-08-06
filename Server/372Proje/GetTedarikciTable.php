<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM tedarikçi";
$result = $conn->query($sql);

$tedarikciData = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $tedarikciData[] = $row;
    }
}

echo json_encode($tedarikciData);

$conn->close();
?>
