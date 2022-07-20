<?php header("Content-Type: text/html; charset=UTF-8");

$host = "localhost"; 

//username
$user = "postgres"; 

//password
$pass = "postgres"; 

//db Name
$db = "placepoi"; 

$data = @$_POST['data'];

//port=5432
$con = pg_connect("host=$host dbname=$db user=$user password=$pass")

or die ("Could not connect to server\n"); 


//$query = "SELECT * FROM types";
$query1 = "INSERT INTO poi(latitude, longitude, typeno) VALUES($data);"; 


$rs1 = pg_query($con, $query1) or die("Cannot execute query: $query1\n");


pg_close($con); 

?>
