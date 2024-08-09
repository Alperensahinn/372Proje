<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$konum = $_POST['Konum'];

$insertquery = "INSERT INTO depo (Konum) VALUES (?)";
$stmt = $conn->prepare($insertquery);
$stmt->bind_param("s", $konum);

if ($stmt->execute()) {
    $last_id_query = "SELECT LAST_INSERT_ID() AS DepoID";
    $result = $conn->query($last_id_query);
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $depoID = $row['DepoID'];
        echo json_encode(array("success" => true, "DepoID" => $depoID, "message" => "Record updated successfully"));
    } else {
        echo json_encode(array("success" => false, "message" => "Unable to retrieve DepoID"));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();

?>
