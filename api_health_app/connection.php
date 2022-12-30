 <?php 
// $servername = "localhost";
// $username="root";
// $password ="";
// $dbname="health_app";

// $connectNow = new mysqli($servername, $username, $password, $dbname);


function OpenCon()
 {
 $dbhost = "localhost";
 $dbuser = "root";
 $dbpass = "";
 $db = "health_app";
 $conn = new mysqli($dbhost, $dbuser, $dbpass,$db) or die("Connect failed: %s\n". $conn -> error);
 
 return $conn;
 }
 
function CloseCon($conn)
 {
 $conn -> close();
 }
   
?>
