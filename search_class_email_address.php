<?php
/**
 * Created by PhpStorm.
 * User: shidan
 * Date: 10/14/16
 * Time: 2:54 PM
 */
include("connect_to_mysql.php");
$ID = $_POST['id'];
$stmt = mysqli_prepare($mysqli, "SELECT `StudentID` FROM `StudentInClass` WHERE `ClassID`=?");
if ($stmt) {
    mysqli_stmt_bind_param($stmt, "s", $ID);
    mysqli_stmt_execute($stmt);
    $stmt->store_result();
    $stmt->bind_result($StudentID);
    while (mysqli_stmt_fetch($stmt)) {
        $stmt2 = mysqli_prepare($mysqli, "SELECT `AccountID`,`Name` FROM `staStudent` WHERE `ID`=?");
        if ($stmt2){
            mysqli_stmt_bind_param($stmt2, "s", $StudentID);
            mysqli_stmt_execute($stmt2);
            $stmt2->store_result();
            $stmt2->bind_result($AccountID, $Name);
            mysqli_stmt_fetch($stmt2);
            $stmt2->close();

            $stmt3 = mysqli_prepare($mysqli, "SELECT `Email` FROM `staAccount` WHERE `ID` = ? ");
            mysqli_stmt_bind_param($stmt3, "s", $AccountID);
            mysqli_stmt_execute($stmt3);
            $stmt3->store_result();
            $stmt3->bind_result($Email);
            mysqli_stmt_fetch($stmt3);
            $stmt3->close();
            echo "'".$Name."'".$Email . ";";
        }else{
            die(mysqli_error($mysqli));
        }
    }
    $mysqli->close();
}else{
    die(mysqli_error($mysqli));
}