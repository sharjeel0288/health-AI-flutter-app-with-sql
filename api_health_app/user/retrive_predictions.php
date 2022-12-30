<?php

include '../connection.php';
$conn = OpenCon();


if (isset($_POST['user_id']))
    $user_id = $_POST['user_id'];
else
    return;



// $user_id=3;


$sqlQuery = "SELECT * FROM diseaseprediction WHERE user_id = '$user_id'";
$resultOfQuery = $conn->query($sqlQuery);
// header('Content-Type: application/json');
if (!empty($resultOfQuery) && $resultOfQuery->num_rows > 0) {
    //num rows length == 1 --email already is in someone use
    $userData = array();
    while ($rowFound = $resultOfQuery->fetch_assoc()) {
        $userData[] = $rowFound;
    }
    echo json_encode(
        array(
            "Found" => true,
            "predictions" => $userData
        )
    );

} else {
    //num rows length == 0 --email is not already is in someone use
    //-- user will be allowed to signup successfully
    echo json_encode(array("Found" => false));
}
CloseCon($conn);
?>