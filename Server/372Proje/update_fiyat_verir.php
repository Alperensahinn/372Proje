<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$SiparişID = $_POST['SiparişID'];
$TedarikçiID = $_POST['TedarikçiID'];
$Fiyat = $_POST['Fiyat'];

$updatequery = "UPDATE fiyat_verir SET Fiyat = ? WHERE SiparişID = ? AND TedarikçiID = ?";
$stmt = $conn->prepare($updatequery);
$stmt->bind_param("dii", $Fiyat, $SiparişID, $TedarikçiID);

if ($stmt->execute()) {
    echo json_encode(array("success" => true, "message" => "Record updated successfully"));
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();
?>
