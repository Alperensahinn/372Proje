<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$ad = $_POST['ad'];
$soyad = $_POST['soyad'];
$gorev = $_POST['gorev'];

$insertquery = "INSERT INTO sivil_personel (Ad, Soyad, Gorev) VALUES (?, ?, ?)";
$stmt = $conn->prepare($insertquery);
$stmt->bind_param("sss", $ad, $soyad, $gorev);

if ($stmt->execute()) {
    echo json_encode(array("success" => true, "message" => "Record inserted successfully"));
} else {
    echo json_encode(array("success" => false, "message" => "Error inserting record: " . $stmt->error));
}

$stmt->close();
$conn->close();
?>
