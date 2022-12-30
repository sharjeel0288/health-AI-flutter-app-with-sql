<?php

include '../connection.php';
$conn = OpenCon();

//POST = send/save data to mysql db
//GET = retrive/read data from mysql db




  

    

$sqlQuery = "SELECT di.* , d.* from doctors d,doctors_info di where d.doctor_id=di.doctor_id ";
$resultOfQuery = $conn->query($sqlQuery);
if ($resultOfQuery) {
    $doctorRecord = array();
    while ($rowFound = $resultOfQuery->fetch_assoc()) {
        $doctorRecord[] = $rowFound;
    }
    echo json_encode(
        array(
            "success" => true,
            "doctorData" => $doctorRecord
        )
    );
} else {
    echo json_encode(array("success" => false));
}
CloseCon($conn);
?>