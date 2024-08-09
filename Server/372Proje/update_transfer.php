<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$transferID = isset($_POST['TransferID']) ? $_POST['TransferID'] : '';
$materyalID = isset($_POST['MateryalID']) ? $_POST['MateryalID'] : '';
$gondericiDepoID = isset($_POST['GöndericiDepoID']) ? $_POST['GöndericiDepoID'] : '';
$aliciDepoID = isset($_POST['AlıcıDepoID']) ? $_POST['AlıcıDepoID'] : '';
$baslangicTarihi = isset($_POST['BaşlangıçTarihi']) ? $_POST['BaşlangıçTarihi'] : '';
$bitisTarihi = isset($_POST['BitişTarihi']) ? $_POST['BitişTarihi'] : '';
$miktar = isset($_POST['Miktar']) ? $_POST['Miktar'] : '';

$sql = "UPDATE transfer 
        SET MateryalID = '$materyalID', 
            GöndericiDepoID = '$gondericiDepoID', 
            AlıcıDepoID = '$aliciDepoID', 
            BaşlangıçTarihi = '$baslangicTarihi', 
            BitişTarihi = '$bitisTarihi', 
            Miktar = '$miktar' 
        WHERE TransferID = '$transferID'";

if ($conn->query($sql) === TRUE) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . $conn->error;
}

$conn->close();
?>
