<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$TedarikçiID = $_POST['TedarikçiID'];
$FirmaAdı = $_POST['FirmaAdı'];

$updatequery = "UPDATE tedarikçi SET FirmaAdı = ? WHERE TedarikçiID = ?";
$stmt = $conn->prepare($updatequery);
$stmt->bind_param("si", $FirmaAdı, $TedarikçiID);

if ($stmt->execute()) {
    echo json_encode(array("success" => true, "message" => "Record updated successfully"));
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();
?>
