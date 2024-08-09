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
$Ad = $_POST['Ad'];
$Soyad = $_POST['Soyad'];

$updatequery = "UPDATE sivil_personel SET Ad = ?, Soyad = ? WHERE PersonelID = ?";
$stmt = $conn->prepare($updatequery);
$stmt->bind_param("ssi", $Ad, $Soyad, $PersonelID);

if ($stmt->execute()) {
    echo json_encode(array("success" => true, "message" => "Record updated successfully"));
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();
?>