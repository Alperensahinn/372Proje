<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM kullanılır";
$result = $conn->query($sql);

$kullanilirData = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $kullanilirData[] = $row;
    }
}

echo json_encode($kullanilirData);

$conn->close();
?>
