<?php
//Gibt alle SammelKategorie der Tabelle SammelKategorie im body zurück

require_once("dbconfig.php");

/*Gibt alle SammelKategorie komlett zurück*/
$query = "SELECT * FROM SammelKategorie";


$res = mysqli_query($con, $query);

$data = array();

while ($row = mysqli_fetch_array($res, MYSQLI_ASSOC)) {
    $data[] = $row;
}

mysqli_free_result($res);
header('Content-Type: application/json');

echo json_encode($data);

?>