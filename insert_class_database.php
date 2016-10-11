<?php
/**
 * Created by PhpStorm.
 * User: shidan
 * Date: 10/8/16
 * Time: 10:08 PM
 */
$ID = $_POST['ID'];
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
$CreateTime = $_POST['CreateTime'];
$UpdateTime = $_POST['UpdateTime'];

//echo $Image;
$Image = rawurldecode($Image);
$Image = base64_decode($Image);
//echo "####################";
//echo $Image;

include("connect_to_mysql.php");

if ($stmt = mysqli_prepare($mysqli, "INSERT INTO `staClass`(`ID`, `Title`, `ImageClass`, `ParagraphOne`, `ParagraphTwo`, 
`ParagraohThree`, `MaxSeat`, `DueRegister`, `Price`, `ClassType`, `BalanceType`, `DefaultTeacher`, `IsPublished`, 
`CreateTime`, `UpdateTime`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")){
    mysqli_stmt_bind_param($stmt, "sssssssssssssss", $ID, $Title, $Image, $ParagraphOne, $ParagraphTwo, $ParagraphThree,
        $MaxSeat, $DueRegister, $Price, $ClassType, $BalanceType, $DefaultTeacher,  $IsPublished, $CreateTime, $UpdateTime);
    if (!$stmt->execute()) {
        echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
    }else {
        echo "new class record added successfully!";
    }
    mysqli_stmt_close($stmt);
    exit;
}else{
    die('mysqli error: '.mysqli_error($mysqli));
}

$mysqli->close();
exit;