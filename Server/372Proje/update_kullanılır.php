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
$MateryalID = $_POST['MateryalID'];
$MateryalAdı = $_POST['MateryalAdı'];
$ToplamKullanım = $_POST['ToplamKullanım'];

$updatequery = "UPDATE kullanılır SET OperasyonAdı = ?, MateryalAdı = ?, ToplamKullanım = ? WHERE OperasyonID = ? AND MateryalID = ?";
$stmt = $conn->prepare($updatequery);
$stmt->bind_param("ssiii", $OperasyonAdı, $MateryalAdı, $ToplamKullanım, $OperasyonID, $MateryalID);

if ($stmt->execute()) {
    echo json_encode(array("success" => true, "message" => "Record updated successfully"));
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();
?>
