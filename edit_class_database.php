<?php
/**
 * Created by PhpStorm.
 * User: shidan
 * Date: 10/10/16
 * Time: 9:55 PM
 */
$ID = $_POST['ID'];
$OldID = $_POST['OldID'];
$Title = $_POST['Title'];
$ClassType = $_POST['ClassType'];
$BalanceType = $_POST['BalanceType'];
$Image = $_POST['Image'];
$IsPublished = $_POST['IsPublished'];
$ParagraphOne = $_POST['ParagraphOne'];
$ParagraphTwo = $_POST['ParagraphTwo'];
$ParagraphThree = $_POST['ParagraphThree'];
$MaxSeat = $_POST['MaxSeat'];
$DueRegister = $_POST['DueRegister'];
$Price = $_POST['Price'];
$DefaultTeacher = $_POST['DefaultTeacher'];
$UpdateTime = $_POST['UpdateTime'];
include("connect_to_mysql.php");

$Image = rawurldecode($Image);
$Image = base64_decode($Image);

if ($stmt = mysqli_prepare($mysqli, "UPDATE `staClass` SET `ID`= ?,`Title`= ? ,`ImageClass`= ?,`ParagraphOne`= ?,
`ParagraphTwo`= ?,`ParagraohThree`=?,`MaxSeat`=?,`DueRegister`=?,`Price`=?,`ClassType`=?,`BalanceType`=?,
`DefaultTeacher`=?,`IsPublished`=?,`UpdateTime`=? WHERE `ID`=?")){
    mysqli_stmt_bind_param($stmt, "sssssssssssssss", $ID, $Title, $Image, $ParagraphOne, $ParagraphTwo, $ParagraphThree,
        $MaxSeat, $DueRegister, $Price, $ClassType, $BalanceType, $DefaultTeacher,  $IsPublished, $UpdateTime, $OldID);
    if (!$stmt->execute()) {
        echo "Execute failed: (" . $stmt->error . ") " . $stmt->error;
    }else {
        printf("rows inserted: %d\n", mysqli_stmt_affected_rows($stmt));
        echo "Class information updated successfully!";
    }
    mysqli_stmt_close($stmt);
    exit;
}else{
    die('mysqli error: '.mysqli_error($mysqli));
}

$mysqli->close();
exit;