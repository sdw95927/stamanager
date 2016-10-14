<?php
/**
 * Created by PhpStorm.
 * User: shidan
 * Date: 9/25/16
 * Time: 11:49 PM
 */
include("connect_to_mysql.php");

if (!isset($_POST['ID'])){
    $stmt = mysqli_prepare($mysqli, "SELECT `ID`,`PayerName`,`AmountDollar`,`CardType`,`CheckNo`,`IsCash`,`StudentName`,
`ClassID`,`ReceiverName`,`Note`,`CreateTime`,`UpdaterName`,`UpdateTime` FROM `Payment` WHERE 1 ");
    if ($stmt) {
        mysqli_stmt_execute($stmt);
        $stmt->bind_result($ID, $PayerName, $AmountDollar, $CardType, $CheckNo, $IsCash, $StudentName, $ClassID,
            $ReceiverName, $Note, $CreateTime, $UpdaterName, $UpdateTime);
        $stmt->store_result();
        $rows = $stmt->num_rows;
        $current_row = 1;
        echo "{\n";
        echo "\"draw\": 1,\n";
        echo "\"recordsTotal\": ".$rows.",\n";
        echo "\"recordsFiltered\": ".$rows.",\n";
        echo "\"data\": [\n";
        while (mysqli_stmt_fetch($stmt)) {
            echo "[\n";
            echo "\"$PayerName\",\n";
            echo "\"$AmountDollar\",\n";
            echo "\"$CardType\",\n";
            echo "\"$CheckNo\",\n";
            echo "\"$IsCash\",\n";
            echo "\"$StudentName\",\n";
            echo "\"$ClassID\",\n";
            echo "\"$ReceiverName\",\n";
            echo "\"$Note\",\n";
            echo "\"$CreateTime\",\n";
            echo "\"$UpdaterName\",\n";
            echo "\"$UpdateTime\",\n";
            echo "\"<button id='$ID' class='ToClick edit' onclick='EnableEditing($ID)'>edit</button>\"\n";
            //echo "\"<button id='$ID'>edit</button>\"";
            if ($current_row == $rows){
                echo "]\n";
            }else{
                echo "],\n";
            }
            $current_row++;
        }
        echo "]\n";
        echo "}";
        mysqli_stmt_close($stmt);
        //echo "miaoji";
    }else{
    }
} else {
    $ID = $_POST['ID'];
    $stmt = mysqli_prepare($mysqli, "SELECT `PayerName`,`AmountDollar`,`CardType`,`CheckNo`,`IsCash`,`StudentName`,
`ClassID`,`ReceiverName`,`Note`,`CreateTime`,`UpdaterName`,`UpdateTime` FROM `Payment` WHERE `ID` = ? ");
    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "s", $ID);
        mysqli_stmt_execute($stmt);
        $stmt->bind_result($PayerName, $AmountDollar, $CardType, $CheckNo, $IsCash, $StudentName, $ClassID,
            $ReceiverName, $Note, $CreateTime, $UpdaterName, $UpdateTime);
        while (mysqli_stmt_fetch($stmt)) {
            echo "$PayerName&&";
            echo "$AmountDollar&&";
            echo "$CardType&&";
            echo "$CheckNo&&";
            echo "$IsCash&&";
            echo "$StudentName&&";
            echo "$ClassID&&";
            echo "$ReceiverName&&";
            echo "$Note&&";
            echo "$CreateTime&&";
            echo "$UpdaterName&&";
            echo "$UpdateTime";
        }
        mysqli_stmt_close($stmt);
        //echo "miaoji";
    }else{
    }
}
?>
