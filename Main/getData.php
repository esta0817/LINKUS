<?php header("Content-Type: text/html; charset=UTF-8");


// Connecting, selecting database
$host = "localhost"; 

//username
$user = "postgres"; 

//password
$pass = "postgres"; 

//db Name
$db = "placepoi"; 

$typeno = @$_POST['typeno'];

$con = pg_connect("host=$host dbname=$db user=$user password=$pass")

or die ("Could not connect to server\n"); 

//echo "POST[typeno] : ";
//echo $typeno."<br>";


// Performing SQL query
if($typeno<50) {$query = "SELECT DISTINCT ST_AsText(avgpoint) FROM grouppoi WHERE typeno={$typeno}";}
elseif ($typeno==51) {$query = "SELECT DISTINCT ST_AsText(avgpoint) FROM grouppoi WHERE typeno=1 or typeno=3 or typeno=9";} //브런치
elseif ($typeno==52) {$query = "SELECT DISTINCT ST_AsText(avgpoint) FROM grouppoi WHERE typeno=1 or typeno=9";} //점심
elseif ($typeno==53) {$query = "SELECT DISTINCT ST_AsText(avgpoint) FROM grouppoi WHERE typeno=9";} //저녁
elseif ($typeno==54) {$query = "SELECT DISTINCT ST_AsText(avgpoint) FROM grouppoi WHERE typeno=3 or typeno=6 or typeno=8";} //팀플
elseif ($typeno==55) {$query = "SELECT DISTINCT ST_AsText(avgpoint) FROM grouppoi WHERE typeno=2 or typeno=3 or typeno=4 or typeno=5 or typeno=6 or typeno=7 or  typeno=8 or typeno=9 or typeno=10 or typeno=11";} //데이트, 친구, 가족
elseif ($typeno==56) {$query = "SELECT DISTINCT ST_AsText(avgpoint) FROM grouppoi WHERE typeno=5 or typeno=10 or typeno=11";} //쇼핑
elseif ($typeno==57) {$query = "SELECT DISTINCT ST_AsText(avgpoint) FROM grouppoi WHERE typeno=1 or typeno=2 or typeno=3 or typeno=9";} //음식
elseif ($typeno==58) {$query = "SELECT DISTINCT ST_AsText(avgpoint) FROM grouppoi WHERE typeno=2 or typeno=3 or typeno=4 or typeno=7 or typeno=8 or typeno=10";} //힐링
elseif ($typeno==59) {$query = "SELECT DISTINCT ST_AsText(avgpoint) FROM grouppoi WHERE typeno=2 or typeno=9";} //파티
elseif ($typeno==60) {$query = "SELECT DISTINCT ST_AsText(avgpoint) FROM grouppoi WHERE typeno=3 or typeno=9";} //회의
elseif ($typeno==61) {$query = "SELECT DISTINCT ST_AsText(avgpoint) FROM grouppoi WHERE typeno=2 or typeno=3 or typeno=9";} //동창회, 친목모임




$result = pg_query($query) or die('Query failed: ' . pg_last_error());

// Printing results in HTML
//echo "<table>\n";
$i = 0;
while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    //echo "\t<tr>\n";

	foreach ($line as $col_value) {
    	$explode = explode(" ", $col_value); //공백문자로 구분
    	$latitude = substr($explode[0], 6);  //처음부터 6글자까지
    	$longitude = substr($explode[1], 0, -1); //)날리기
        
        $latitude = substr($latitude, 0, 7); 
        $longitude = substr($longitude, 0, 8);
        

        //배열에 저장
    	$lati_arr[$i] = $latitude;
    	$long_arr[$i] = $longitude;
    }
    $i = $i+1;
    //echo "\t</tr>\n";
}

for($i=0 ; $i<count($lati_arr) ; $i++)
{
	echo "$lati_arr[$i],$long_arr[$i]<br>";
}


//echo "</table>\n";

// Free resultset
pg_free_result($result);

// Closing connection
pg_close($con);
?> 