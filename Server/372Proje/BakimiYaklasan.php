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

    $selectquery = "SELECT b.BakımTarihi, b.İşlemDetayi, b.PersonelID, ap.Rütbe, ap.Birlik FROM bakım b JOIN askeri_personel ap ON b.PersonelID = ap.PersonelID WHERE b.BakımTarihi BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY);";
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