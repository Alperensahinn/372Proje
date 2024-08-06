<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$DepoID = $_POST['DepoID'];
$Konum = $_POST['Konum'];

$updatequery = "UPDATE depo SET Konum = ? WHERE DepoID = ?";
$stmt = $conn->prepare($updatequery);
$stmt->bind_param("si", $Konum, $DepoID);

if ($stmt->execute()) {
    echo json_encode(array("success" => true, "message" => "Record updated successfully"));
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();
?>
