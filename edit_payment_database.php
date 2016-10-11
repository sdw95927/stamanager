<?php
/**
 * Created by PhpStorm.
 * User: shidan
 * Date: 10/6/16
 * Time: 9:55 PM
 */
$ID = $_POST['ID'];
$payername = $_POST['payername'];
$amountdollar = $_POST['amountdollar'];
$cardtype = $_POST['cardtype'];
$checkno = $_POST['checkno'];
$iscash = $_POST['iscash'];
$studentname = $_POST['studentname'];
$classID = $_POST['classID'];
$receivername = $_POST['receivername'];
$note = $_POST['note'];
$updater = $_POST['updater'];
$updatetime = $_POST['updatetime'];
if ($updatetime == ""){
    $updatetime = NULL;
}

include("connect_to_mysql.php");
//echo "mioaji";

if ($stmt = mysqli_prepare($mysqli, "UPDATE `Payment` SET `PayerName`=?,`AmountDollar`=?,`CardType`=?,`CheckNo`=?,
`IsCash`=?,`StudentName`=?,`ClassID`=?,`ReceiverName`=?,`Note`=?,`UpdaterName`=?,`UpdateTime`=? 
WHERE `ID`=?")){
    mysqli_stmt_bind_param($stmt, "ssssssssssss", $payername, $amountdollar, $cardtype, $checkno, $iscash, $studentname,
        $classID, $receivername, $note, $updater, $updatetime, $ID);
    if (!$stmt->execute()) {
        echo "Execute failed: (" . $stmt->error. ") " . $stmt->error;
    }else {
        //printf("rows inserted: %d\n", mysqli_stmt_affected_rows($stmt));
        echo "payment record updated successfully!";
    }
    mysqli_stmt_close($stmt);
    exit;
}else{
    die('mysqli error: '.mysqli_error($mysqli));
}

$mysqli->close();
exit;