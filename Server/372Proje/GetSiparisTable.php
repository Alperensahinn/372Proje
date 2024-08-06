<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM sipariş";
$result = $conn->query($sql);

$siparisData = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $siparisData[] = $row;
    }
}

echo json_encode($siparisData);

$conn->close();
?>
