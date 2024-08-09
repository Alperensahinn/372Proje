<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$operasyonAdı = $_POST['OperasyonAdı'];
$tarih = $_POST['Tarih'];

$insertquery = "INSERT INTO operasyon (OperasyonAdı, Tarih) VALUES (?, ?)";
$stmt = $conn->prepare($insertquery);
$stmt->bind_param("ss", $operasyonAdı, $tarih);

if ($stmt->execute()) {
    $last_id_query = "SELECT LAST_INSERT_ID() AS OperasyonID";
    $result = $conn->query($last_id_query);
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $operasyonID = $row['OperasyonID'];
        echo json_encode(array("success" => true, "OperasyonID" => $operasyonID, "message" => "Record updated successfully"));
    } else {
        echo json_encode(array("success" => false, "message" => "Unable to retrieve OperasyonID"));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();

?>
