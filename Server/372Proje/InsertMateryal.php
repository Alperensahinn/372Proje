<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$materyalAdı = $_POST['MateryalAdı'];
$tür = $_POST['Tür'];
$marka = $_POST['Marka'];

$insertquery = "INSERT INTO materyal (MateryalAdı, Tür, Marka) VALUES (?, ?, ?)";
$stmt = $conn->prepare($insertquery);
$stmt->bind_param("sss", $materyalAdı, $tür, $marka);

if ($stmt->execute()) {
    $last_id_query = "SELECT LAST_INSERT_ID() AS MateryalID";
    $result = $conn->query($last_id_query);
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $materyalID = $row['MateryalID'];
        echo json_encode(array("success" => true, "MateryalID" => $materyalID, "message" => "Record updated successfully"));
    } else {
        echo json_encode(array("success" => false, "message" => "Unable to retrieve MateryalID"));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();

?>
