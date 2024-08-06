<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$MateryalID = $_POST['MateryalID'];
$DepoID = $_POST['DepoID'];
$BakımTarihi = $_POST['BakımTarihi'];
$İşlemDetayi = $_POST['İşlemDetayi'];
$PersonelID = $_POST['PersonelID'];

$updatequery = "UPDATE bakım SET BakımTarihi = ?, İşlemDetayi = ?, PersonelID = ? WHERE MateryalID = ? AND DepoID = ?";
$stmt = $conn->prepare($updatequery);
$stmt->bind_param("ssiii", $BakımTarihi, $İşlemDetayi, $PersonelID, $MateryalID, $DepoID);

if ($stmt->execute()) {
    echo json_encode(array("success" => true, "message" => "Record updated successfully"));
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();
?>
