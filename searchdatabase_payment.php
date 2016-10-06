<?php
/**
 * Created by PhpStorm.
 * User: shidan
 * Date: 9/25/16
 * Time: 11:49 PM
 */

//$tumortype = $_GET['tumortype'];
include("connect_to_mysql.php");

//if ($tumortype == "All") {
if (1){
    $stmt = mysqli_prepare($mysqli, "SELECT `ID`,`PayerName`,`AmountDollar`,`CardType`,`CheckNo`,`IsCash`,`StudentName`,
`ClassID`,`ReceiverName`,`Note`,`CreateTime`,`UpdaterName`,`UpdateTime` FROM `Payment` WHERE 1 ");
    if ($stmt) {
        mysqli_stmt_execute($stmt);
        $stmt->bind_result($ID, $PayerName, $AmountDollar, $CardType, $CheckNo, $IsCash, $StudentName, $ClassID,
            $ReceiverName, $Note, $CreateTime, $UpdaterName, $UpdateTime);
        echo "<thead>\n";
        echo "<tr>\n";
        echo "<th>Payer Name</th>\n";
        echo "<th>Amount Dollar</th>\n";
        echo "<th>Card Type</th>\n";
        echo "<th>Check No</th>\n";
        echo "<th>Is Cash</th>\n";
        echo "<th>Student Name</th>\n";
        echo "<th>ClassID</th>\n";
        echo "<th>ReceiverName</th>\n";
        echo "<th>Note</th>\n";
        echo "<th>Create Time</th>\n";
        echo "<th>Updater Name</th>\n";
        echo "<th>Update Time</th>\n";
        echo "</tr>\n";
        echo "</thead>\n";
        echo "<tbody>\n";
        while (mysqli_stmt_fetch($stmt)) {
            echo "<tr>\n";
            echo "<td>$PayerName</td>\n";
            echo "<th>$AmountDollar</th>\n";
            echo "<th>$CardType</th>\n";
            echo "<th>$CheckNo</th>\n";
            echo "<th>$IsCash</th>\n";
            echo "<th>$StudentName</th>\n";
            echo "<th>$ClassID</th>\n";
            echo "<th>$ReceiverName</th>\n";
            echo "<th>$Note</th>\n";
            echo "<th>$CreateTime</th>\n";
            echo "<th>$UpdaterName</th>\n";
            echo "<th>$UpdateTime</th>\n";
            echo "</tr>\n";
        }
        echo "</tbody>\n";
        mysqli_stmt_close($stmt);
        //echo "miaoji";
    }else{
    }
} else {
    $stmt = mysqli_prepare($mysqli, "SELECT OldID FROM Basic WHERE TumorTypeID = ?");

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "s", $tumortype);
        mysqli_stmt_execute($stmt);
        $stmt->bind_result($OldID);
//        echo "<table id=\"mytable\" class=\"display\">\n";
        echo "<thead>\n";
        echo "<tr>\n";
        echo "<th>Cell Line</th>\n";
        echo "</tr>\n";
        echo "</thead>\n";
        echo "<tbody>\n";
        while (mysqli_stmt_fetch($stmt)) {
            echo "<tr>\n";
            echo "<td>$OldID</td>\n";
            echo "</tr>\n";
        }
        echo "</tbody>\n";
//        echo "</table>\n";
    }
    mysqli_stmt_close($stmt);
}
?>
