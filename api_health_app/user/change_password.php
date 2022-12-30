<?php

include '../connection.php';
$conn = OpenCon();

//POST = send/save data to mysql db
//GET = retrive/read data from mysql db



if (isset($_POST['user_id']))
    $userId = $_POST['user_id'];
else
    return;

if (isset($_POST['user_password']))
    $userPassword = md5($_POST['user_password']);
else
    return;

    // $userId = 1;
    // $userPassword = md5('a');

  

//     UPDATE Customers
// SET ContactName = 'Alfred Schmidt', City = 'Frankfurt'
// WHERE CustomerID = 1;

$sqlQuery = "UPDATE users_table set user_password='$userPassword' where user_id='$userId'";
$resultOfQuery = $conn->query($sqlQuery);
if ($resultOfQuery) {
    
    echo json_encode(array("success" => true));
} else {
    echo json_encode(array("success" => false));
}
CloseCon($conn);
?>