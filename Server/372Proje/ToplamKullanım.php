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
  k.OperasyonID,
  o.OperasyonAdı,
  k.MateryalID,
  m.MateryalAdı,
  SUM(k.Miktar) AS ToplamKullanım
FROM
  kullanlılır k
JOIN
  operasyon o ON k.OperasyonID = o.OperasyonID
JOIN
  materyal m ON k.MateryalID = m.MateryalID
GROUP BY
  k.OperasyonID, k.MateryalID
ORDER BY
  ToplamKullanım DESC;
";
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