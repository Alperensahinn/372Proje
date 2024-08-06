<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM depo";
$result = $conn->query($sql);

$depoData = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $depoData[] = $row;
    }
}

echo json_encode($depoData);

$conn->close();
?>
