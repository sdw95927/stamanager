<?php
/**
 * Created by PhpStorm.
 * User: shidan
 * Date: 10/14/16
 * Time: 5:45 PM
 */
include("connect_to_mysql.php");
echo "[\n";

$stmt = mysqli_prepare($mysqli, "SELECT `AccountID`,`Name` FROM `staStudent`");
if ($stmt){
    mysqli_stmt_execute($stmt);
    $stmt->store_result();
    $stmt->bind_result($AccountID, $Name);
    while(mysqli_stmt_fetch($stmt)){
        $stmt3 = mysqli_prepare($mysqli, "SELECT `Email` FROM `staAccount` WHERE `ID` = ? ");
        mysqli_stmt_bind_param($stmt3, "s", $AccountID);
        mysqli_stmt_execute($stmt3);
        $stmt3->store_result();
        $stmt3->bind_result($Email);
        mysqli_stmt_fetch($stmt3);
        $stmt3->close();
        echo "\"'".$Name."'".$Email . "\",\n";
    }
    $stmt->close();
}else{
    die(mysqli_error($mysqli));
}

$stmt = mysqli_prepare($mysqli, "SELECT `Email`,`GuardianNameOne` FROM `staAccount`");
if ($stmt){
    mysqli_stmt_execute($stmt);
    $stmt->store_result();
    $stmt->bind_result($Email, $Name);
    $rows = $stmt->num_rows;
    $current_row = 1;
    while(mysqli_stmt_fetch($stmt)){
        if ($current_row == $rows){
            echo "\"'".$Name."'".$Email . "\"\n]";
        }else{
            echo "\"'".$Name."'".$Email . "\",\n";
        }
        $current_row = $current_row + 1;
    }
    $stmt->close();
}else{
    die(mysqli_error($mysqli));
}