<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$OperasyonID = $_POST['OperasyonID'];
$OperasyonAdı = $_POST['OperasyonAdı'];
$Tarih = $_POST['Tarih'];

$updatequery = "UPDATE operasyon SET OperasyonAdı = ?, Tarih = ? WHERE OperasyonID = ?";
$stmt = $conn->prepare($updatequery);
$stmt->bind_param("ssi", $OperasyonAdı, $Tarih, $OperasyonID);

if ($stmt->execute()) {
    echo json_encode(array("success" => true, "message" => "Record updated successfully"));
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();
?>