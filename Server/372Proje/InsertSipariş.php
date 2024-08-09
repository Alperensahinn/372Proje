<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$materyalID = $_POST['MateryalID'];
$miktar = $_POST['Miktar'];
$depoID = $_POST['DepoID'];

$insertquery = "INSERT INTO sipariş (MateryalID, Miktar, DepoID) VALUES (?, ?, ?)";
$stmt = $conn->prepare($insertquery);
$stmt->bind_param("iii", $materyalID, $miktar, $depoID);

if ($stmt->execute()) {
    $last_id_query = "SELECT LAST_INSERT_ID() AS SiparişID";
    $result = $conn->query($last_id_query);
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $siparişID = $row['SiparişID'];
        echo json_encode(array("success" => true, "SiparişID" => $siparişID, "message" => "Record updated successfully"));
    } else {
        echo json_encode(array("success" => false, "message" => "Unable to retrieve SiparişID"));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();

?>
