<?php
/**
 * Created by PhpStorm.
 * User: shidan
 * Date: 10/12/16
 * Time: 7:22 PM
 */

$ID = $_POST['ID'];
include("connect_to_mysql.php");

$Image = rawurldecode($Image);
$Image = base64_decode($Image);

if ($stmt = mysqli_prepare($mysqli, "UPDATE `staClass` SET `IsPublished`= 1 WHERE `ID`=?")){
    mysqli_stmt_bind_param($stmt, "s", $ID);
    if (!$stmt->execute()) {
        echo "Execute failed: (" . $stmt->error . ") " . $stmt->error;
    }else {
        echo "Class published successfully!";
    }
    mysqli_stmt_close($stmt);
    exit;
}else{
    die('mysqli error: '.mysqli_error($mysqli));
}

$mysqli->close();
exit;