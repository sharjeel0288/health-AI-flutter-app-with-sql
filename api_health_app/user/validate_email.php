<?php

include '../connection.php';
$conn = OpenCon();
$userEmail = $_POST['user_email'];
$userName = $_POST['user_name'];
// $userEmail='a@gmail.com';
// $userName='a';

$sqlQuery = "SELECT * FROM users_table WHERE user_email = '$userEmail' OR user_name = '$userName'";
$resultOfQuery = $conn->query($sqlQuery);
// header('Content-Type: application/json');
if (!empty($resultOfQuery) && $resultOfQuery->num_rows>0) {
    //num rows length == 1 --email already is in someone use
    echo json_encode(array("Found" => true));
} else {
    //num rows length == 0 --email is not already is in someone use
    //-- user will be allowed to signup successfully
    echo json_encode(array("Found" => false));
}
CloseCon($conn);
?>