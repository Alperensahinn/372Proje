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
$MateryalID = $_POST['MateryalID'];
$Miktar = $_POST['Miktar'];

$updatequery = "UPDATE sipariş SET Miktar = ? WHERE SiparişID = ? AND MateryalID = ?";
$stmt = $conn->prepare($updatequery);
$stmt->bind_param("dii", $Miktar, $SiparişID, $MateryalID);

if ($stmt->execute()) {
    echo json_encode(array("success" => true, "message" => "Record updated successfully"));
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();
?>
