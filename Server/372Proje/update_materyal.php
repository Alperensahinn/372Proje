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
$MateryalAdı = $_POST['MateryalAdı'];
$Tür = $_POST['Tür'];
$Marka = $_POST['Marka'];

$updatequery = "UPDATE materyal SET MateryalAdı = ?, Tür = ?, Marka = ? WHERE MateryalID = ?";
$stmt = $conn->prepare($updatequery);
$stmt->bind_param("sssi", $MateryalAdı, $Tür, $Marka, $MateryalID);

if ($stmt->execute()) {
    echo json_encode(array("success" => true, "message" => "Record updated successfully"));
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();
?>
