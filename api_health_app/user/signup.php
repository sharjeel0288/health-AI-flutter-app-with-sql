<?php

include '../connection.php';
$conn = OpenCon();

//POST = send/save data to mysql db
//GET = retrive/read data from mysql db

if (isset($_POST['user_name']))
    $userName = $_POST['user_name'];
else
    return;

if (isset($_POST['user_email']))
    $userEmail = $_POST['user_email'];
else
    return;

if (isset($_POST['user_password']))
    $userPassword = md5($_POST['user_password']);
else
    return;


  

    

$sqlQuery = "INSERT INTO users_table (user_name,user_email,user_password) VALUES ('$userName' ,'$userEmail', '$userPassword') ";
$resultOfQuery = $conn->query($sqlQuery);
if ($resultOfQuery) {
    
    echo json_encode(array("success" => true));
} else {
    echo json_encode(array("success" => false));
}
CloseCon($conn);
?>