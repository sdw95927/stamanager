<?php
/**
 * Created by PhpStorm.
 * User: shidan
 * Date: 9/25/16
 * Time: 11:49 PM
 */
include("connect_to_mysql.php");

$ID = $_POST['ID'];

if ($ID == ""){
    $stmt = mysqli_prepare($mysqli, "SELECT `ID`, `Title`, `ImageClass`, `ParagraphOne`, `ParagraphTwo`, `ParagraohThree`,
 `MaxSeat`, `DueRegister`, `Price`, `ClassType`, `BalanceType`, `IsPublished`, `CreateTime`, `UpdateTime` 
 FROM `staClass` WHERE 1");
    if ($stmt) {
        mysqli_stmt_execute($stmt);
        $stmt->bind_result($ID, $Title, $ImageClass, $ParagraphOne, $ParagraphTwo, $ParagraphThree, $MaxSeat, $DueRegister,
            $Price, $ClassType, $BalanceType, $IsPublished, $CreateTime, $UpdateTime);
        $stmt->store_result();
        $rows = $stmt->num_rows;
        $current_row = 1;
        echo "{\n";
        echo "\"draw\": 1,\n";
        echo "\"recordsTotal\": ".$rows.",\n";
        echo "\"recordsFiltered\": ".$rows.",\n";
        echo "\"data\": [\n";
        while (mysqli_stmt_fetch($stmt)) {
            echo "{\n";
            echo "\"ID\": \"$ID\",\n";
            echo "\"Title\": \"$Title\",\n";
            //echo "\"Image\": \"$ImageClass\",\n";
            echo "\"Image\": \"no image uploaded yet\",\n";
            echo "\"ParagraphOne\": \"$ParagraphOne\",\n";
            echo "\"ParagraphTwo\": \"$ParagraphTwo\",\n";
            echo "\"ParagraphThree\": \"$ParagraphThree\",\n";
            echo "\"MaxSeat\": \"$MaxSeat\",\n";
            echo "\"DueRegister\": \"$DueRegister\",\n";
            echo "\"Price\": \"$Price\",\n";
            echo "\"ClassType\": \"$ClassType\",\n";
            echo "\"BalanceType\": \"$BalanceType\",\n";
            echo "\"IsPublished\": \"$IsPublished\",\n";
            echo "\"CreateTime\": \"$CreateTime\",\n";
            echo "\"UpdateTime\": \"$UpdateTime\",\n";
            echo "\"Action\": \"<button id='$ID' onclick='EnableEditing($ID)'>edit</button>/<button>publish</button>\"\n";
            if ($current_row == $rows){
                echo "}\n";
            }else{
                echo "},\n";
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