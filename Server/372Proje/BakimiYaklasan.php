<?php

    $servername = "localhost";
    $username = "root";
    $password = "";
    $database = "proje";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $database);

    // Check connection
    if ($conn->connect_error) 
    {
        die("Connection failed: " . $conn->connect_error);
    }

    $selectquery = "SELECT
  b.BakımTarihi,
  b.İşlemDetayi,
  b.PersonelID,
  sp.Ad,
  sp.Soyad
FROM
  bakım b
JOIN
  sivil_personel sp ON b.PersonelID = sp.PersonelID
WHERE
  b.BakımTarihi BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY);";
    $result = $conn->query($selectquery);

    if ($result->num_rows > 0) 
    {
        $rows = array();
        while($row = $result->fetch_assoc()) 
        {
            $rows[] = $row;
        }
        echo json_encode($rows);
    } 
    
    else 
    {
        echo json_encode(array());
    }
    
    $conn->close();
?>