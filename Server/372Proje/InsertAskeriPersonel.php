<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$rütbe = $_POST['Rütbe'];
$birlik = $_POST['Birlik'];

$insertquery = "INSERT INTO askeri_personel (Rütbe, Birlik) VALUES (?, ?)";
$stmt = $conn->prepare($insertquery);
$stmt->bind_param("ss", $rütbe, $birlik);

if ($stmt->execute()) {
    $last_id_query = "SELECT LAST_INSERT_ID() AS PersonelID";
    $result = $conn->query($last_id_query);
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $personelID = $row['PersonelID'];
        echo json_encode(array("success" => true, "PersonelID" => $personelID, "message" => "Record updated successfully"));
    } else {
        echo json_encode(array("success" => false, "message" => "Unable to retrieve PersonelID"));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();

?>
