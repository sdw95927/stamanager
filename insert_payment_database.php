<?php
/**
 * Created by PhpStorm.
 * User: shidan
 * Date: 9/27/16
 * Time: 10:45 AM
 */
//echo "mioaji";
$payername = $_POST['payername'];
$amountdollar = $_POST['amountdollar'];
$cardtype = $_POST['cardtype'];
$checkno = $_POST['checkno'];
$iscash = $_POST['iscash'];
$studentname = $_POST['studentname'];
$classID = $_POST['classID'];
$receivername = $_POST['receivername'];
$note = $_POST['note'];
$createtime = $_POST['createtime'];
$updater = $_POST['updater'];
$updatetime = $_POST['updatetime'];
if ($updatetime == ""){
    $updatetime = NULL;
}

include("connect_to_mysql.php");
//echo "mioaji";

if ($stmt = mysqli_prepare($mysqli, "INSERT INTO `Payment`(`PayerName`, `AmountDollar`, `CardType`, `CheckNo`, `IsCash`,
 `StudentName`, `ClassID`, `ReceiverName`, `Note`, `CreateTime`, `UpdaterName`, `UpdateTime`)  VALUES (?, ?, ?, ?, ?, ?,
  ?, ?, ?, ?, ?, ?)")){
    mysqli_stmt_bind_param($stmt, "ssssssssssss", $payername, $amountdollar, $cardtype, $checkno, $iscash, $studentname,
        $classID, $receivername, $note, $createtime, $updater, $updatetime);
    if (!$stmt->execute()) {
        echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
    }else {
        //printf("rows inserted: %d\n", mysqli_stmt_affected_rows($stmt));
        echo "new payment record added successfully!";
    }
    mysqli_stmt_close($stmt);
    exit;
}else{
    die('mysqli error: '.mysqli_error($mysqli));
}

$mysqli->close();
exit;