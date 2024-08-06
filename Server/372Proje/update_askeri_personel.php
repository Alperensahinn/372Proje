<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$PersonelID = $_POST['PersonelID'];
$Rütbe = $_POST['Rütbe'];
$Birlik = $_POST['Birlik'];

$updatequery = "UPDATE askeri_personel SET Rütbe = ?, Birlik = ? WHERE PersonelID = ?";
$stmt = $conn->prepare($updatequery);
$stmt->bind_param("ssi", $Rütbe, $Birlik, $PersonelID);

if ($stmt->execute()) {
    echo json_encode(array("success" => true, "message" => "Record updated successfully"));
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();
?>
