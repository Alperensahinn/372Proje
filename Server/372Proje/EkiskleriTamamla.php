
<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "proje";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO `sipariş` (`MateryalID`, `Miktar`, `DepoID`)
SELECT k.MateryalID, (k.Miktar - COALESCE(b.Miktar, 0)), 3 AS DepoID
FROM `kullanlılır` k
JOIN operasyon o on k.OperasyonID = o.OperasyonID
LEFT JOIN `bulun` b ON k.MateryalID = b.MateryalID
WHERE b.Miktar IS NULL OR b.Miktar < k.Miktar;";
$result = $conn->query($sql);

$kullanilirData = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $kullanilirData[] = $row;
    }
}

echo json_encode($kullanilirData);

$conn->close();
?>