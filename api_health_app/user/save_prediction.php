<?php
include '../connection.php';
$conn = OpenCon();


if (isset($_POST['user_id']))
    $user_id = $_POST['user_id'];
else
    return;

if (isset($_POST['prediction']))
    $prediction = $_POST['prediction'];
else
    return;

// $user_id=3;
// $prediction='abc';


$sqlQuery = "INSERT INTO  diseaseprediction values ('$user_id','$prediction',NOW())";
$resultOfQuery = $conn->query($sqlQuery);
if ($resultOfQuery) {

    echo json_encode(array("success" => true));
} else {
    echo json_encode(array("success" => false));
}
CloseCon($conn);
?>