<?php
session_start();
/**
 * Created by PhpStorm.
 * User: shidan
 * Date: 9/27/16
 * Time: 10:45 AM
 */
$ID = $_POST['ID'];
$Time = $_POST['Time'];
$HistoryID = $_POST['HistoryID'];
include("connect_to_mysql.php");

//search for recorderID
if ($stmt = mysqli_prepare($mysqli, "SELECT `ID` FROM `staAccount` WHERE `GuardianNameOne`=? AND `Role`=3")){
    mysqli_stmt_bind_param($stmt, "s", $_SESSION['stamgaccount']);
    if (!$stmt->execute()) {
        echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
        exit;
    }else {
        $stmt->bind_result($RecorderID);
        $stmt->fetch();
    }
    mysqli_stmt_close($stmt);
}else{
    die('mysqli error: '.mysqli_error($mysqli));
}

if ($stmt = mysqli_prepare($mysqli, "UPDATE `CheckInOut` SET `CheckOut`=?, `RecorderID`=?, `UpdateTime`=? WHERE `ID`=?")){
    mysqli_stmt_bind_param($stmt, "ssss", $Time, $RecorderID, $Time,  $HistoryID);
    if (!$stmt->execute()) {
        echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
    }else {
        echo "Successfully checked out!";
    }
    mysqli_stmt_close($stmt);
    exit;
}else{
    die('mysqli error: '.mysqli_error($mysqli));
}

$mysqli->close();
exit;