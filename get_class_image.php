<?php
/**
 * Created by PhpStorm.
 * User: shidan
 * Date: 10/7/16
 * Time: 2:05 AM
 */
include("connect_to_mysql.php");

$ID = $_GET['ID'];

if ($ID == "") {
    echo "no image uploaded!";
} else {
    $stmt = mysqli_prepare($mysqli, "SELECT `ImageClass` FROM `staClass` WHERE `ID`=?");
    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "s", $ID);
        mysqli_stmt_execute($stmt);
        $stmt->bind_result($Image);
        mysqli_stmt_fetch($stmt);
        //echo  '<img src="data:image/jpeg;base64,'.base64_encode($Image).'" width="175" height="175"/>';
        echo $Image;
        //echo "data:image/jpeg;base64,base64_encode(".$Image.")";
        mysqli_stmt_close($stmt);
        //echo "miaoji";
    } else {
    }
}
?>