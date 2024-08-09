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
$göndericiDepoID = $_POST['GöndericiDepoID'];
$alıcıDepoID = $_POST['AlıcıDepoID'];
$başlangıçTarihi = $_POST['BaşlangıçTarihi'];
$bitişTarihi = $_POST['BitişTarihi'];
$miktar = $_POST['Miktar'];

$insertquery = "INSERT INTO transfer (MateryalID, GöndericiDepoID, AlıcıDepoID, BaşlangıçTarihi, BitişTarihi, Miktar) VALUES (?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($insertquery);
$stmt->bind_param("iiissi", $materyalID, $göndericiDepoID, $alıcıDepoID, $başlangıçTarihi, $bitişTarihi, $miktar);

if ($stmt->execute()) {
    $last_id_query = "SELECT LAST_INSERT_ID() AS TransferID";
    $result = $conn->query($last_id_query);
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $transferID = $row['TransferID'];
        echo json_encode(array("success" => true, "TransferID" => $transferID, "message" => "Record updated successfully"));
    } else {
        echo json_encode(array("success" => false, "message" => "Unable to retrieve TransferID"));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();

?>
