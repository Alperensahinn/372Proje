<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM fiyat_verir";
$result = $conn->query($sql);

$fiyatVerirData = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $fiyatVerirData[] = $row;
    }
}

echo json_encode($fiyatVerirData);

$conn->close();
?>
