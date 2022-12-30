<?php

include '../connection.php';
$conn = OpenCon();

//POST = send/save data to mysql db
//GET = retrive/read data from mysql db

if (isset($_POST['user_id']))
    $user_id = $_POST['user_id'];
else
    return;

if (isset($_POST['age']))
    $age = $_POST['age'];
else
    return;

if (isset($_POST['weight']))
    $weight = $_POST['weight'];
else
    return;
if (isset($_POST['sex']))
    $sex = $_POST['sex'];
else
    return;

if (isset($_POST['height']))
    $height = $_POST['height'];
else
    return;

$user_id=225;
$age =18;
$weight=55;
$height=103;
$sex='male';




$sqlValidateQuery = "SELECT * FROM patient WHERE user_id = '$user_id'";
$resultOfValidateQuery = $conn->query($sqlValidateQuery);
if ($resultOfValidateQuery && $resultOfValidateQuery->num_rows>0) {
    
    $sqlQuery = "UPDATE patient SET height='$height',weight='$weight',age='$age',sex='$sex' WHERE user_id='$user_id'";
    $resultOfQuery = $conn->query($sqlQuery);
    if ($resultOfQuery) {

        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }
} else {
    $sqlQuery = "INSERT INTO patient (user_id,height,weight,age,sex) VALUES ('$user_id','$height','$weight', '$age','$sex') ";
    $resultOfQuery = $conn->query($sqlQuery);
    if ($resultOfQuery) {

        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }
}


// $sqlQuery = "INSERT INTO patient (user_id,height,weight,age,sex) VALUES ('$user_id','$height','$weight', '$age','$sex') ";
// $resultOfQuery = $conn->query($sqlQuery);
// if ($resultOfQuery) {

//     echo json_encode(array("success" => true));
// } else {
//     echo json_encode(array("success" => false));
// }
CloseCon($conn);
?>