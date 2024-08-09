<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$firmaAdı = $_POST['FirmaAdı'];

$insertquery = "INSERT INTO tedarikçi (FirmaAdı) VALUES (?)";
$stmt = $conn->prepare($insertquery);
$stmt->bind_param("s", $firmaAdı);

if ($stmt->execute()) {
    $last_id_query = "SELECT LAST_INSERT_ID() AS TedarikçiID";
    $result = $conn->query($last_id_query);
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $tedarikçiID = $row['TedarikçiID'];
        echo json_encode(array("success" => true, "TedarikçiID" => $tedarikçiID, "message" => "Record updated successfully"));
    } else {
        echo json_encode(array("success" => false, "message" => "Unable to retrieve TedarikçiID"));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();

?>
