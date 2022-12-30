<?php

include '../connection.php';
$conn = OpenCon();
$userEmail = $_POST['user_email'];
$userName = $_POST['user_name'];
$userPassword = md5($_POST['user_password']);

// $userEmail = 'a@gmail.com';
// $userName = 'a';
// $userPassword = md5('a');

$sqlQuery1 = "SELECT * FROM users_table WHERE user_name = '$userName' and user_password='$userPassword'";
$sqlQuery2 = "SELECT * FROM users_table WHERE user_email = '$userEmail'  and user_password='$userPassword'";
$resultOfQuery1 = $conn->query($sqlQuery1);
$resultOfQuery2 = $conn->query($sqlQuery2);
// header('Content-Type: application/json');
if (!empty($resultOfQuery1) && $resultOfQuery1->num_rows > 0) {
    //num rows length == 1 --email already is in someone use
    $userRecord = array();
    while ($rowFound = $resultOfQuery1->fetch_assoc()) {
        $userRecord[] = $rowFound;
    }
    echo json_encode(
        array(
            "Found" => true,
            "userData" => $userRecord[0]
        )
    );

} elseif (!empty($resultOfQuery2) && $resultOfQuery2->num_rows > 0) {
    $userRecord = array();
    while ($rowFound = $resultOfQuery2->fetch_assoc()) {
        $userRecord[] = $rowFound;
    }
    echo json_encode(
        array(
            "Found" => true,
            "userData" => $userRecord[0]
        )
    );
} else {
    //num rows length == 0 --email is not already is in someone use
    //-- user will be allowed to signup successfully
    echo json_encode(array("Found" => false));
}
CloseCon($conn);
?>