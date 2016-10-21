<?php
/**
 * Created by PhpStorm.
 * User: shidan
 * Date: 9/25/16
 * Time: 11:49 PM
 */
include("connect_to_mysql.php");

if (!isset($_GET['ID'])) {
    $stmt = mysqli_prepare($mysqli, "SELECT `ID`, `AccountID`, `CheckIn`, `CheckOut`, `RecorderID` FROM `CheckInOut` WHERE 1");
    if ($stmt) {
        mysqli_stmt_execute($stmt);
        $stmt->bind_result($ID, $AccountID, $CheckIn, $CheckOut, $RecorderID);
        $stmt->store_result();
        $rows = $stmt->num_rows;
        $current_row = 1;
        echo "{\n";
        echo "\"draw\": 1,\n";
        echo "\"recordsTotal\": " . $rows . ",\n";
        echo "\"recordsFiltered\": " . $rows . ",\n";
        echo "\"data\": [\n";
        while (mysqli_stmt_fetch($stmt)) {
            echo "{\n";
            echo "\"ID\": \"$ID\",\n";
            echo "\"AccountID\": \"$AccountID\",\n";
            echo "\"CheckIn\": \"$CheckIn\",\n";
            echo "\"CheckOut\": \"$CheckOut\",\n";
            echo "\"RecorderID\": \"$RecorderID\",\n";

            //AccountName and role
            $stmtAccount = mysqli_prepare($mysqli, "SELECT `GuardianNameOne`, `Role` FROM `staAccount` WHERE `ID`=?");
            mysqli_stmt_bind_param($stmtAccount, "s", $AccountID);
            if ($stmtAccount) {
                mysqli_stmt_execute($stmtAccount);
                $stmtAccount->bind_result($AccountName, $Role);
                mysqli_stmt_fetch($stmtAccount);
                mysqli_stmt_close($stmtAccount);
            } else {
                die('mysqli error: ' . mysqli_error($mysqli));
            }
            echo "\"AccountName\": \"$AccountName\",\n";
            echo "\"Role\": \"$Role\",\n";

            //RecorderName
            $stmtRecorder = mysqli_prepare($mysqli, "SELECT `GuardianNameOne` FROM staAccount WHERE ID=? AND Role='3'");
            mysqli_stmt_bind_param($stmtRecorder, "s", $RecorderID);
            if ($stmtRecorder) {
                mysqli_stmt_execute($stmtRecorder);
                $stmtRecorder->bind_result($RecorderName);
                mysqli_stmt_fetch($stmtRecorder);
                mysqli_stmt_close($stmtRecorder);
            } else {
                die('mysqli error: ' . mysqli_error($mysqli));
            }
            echo "\"RecorderName\": \"$RecorderName\"\n";

            if ($current_row == $rows) {
                echo "}\n";
            } else {
                echo "},\n";
            }
            $current_row++;
        }
        echo "]\n";
        echo "}";
        mysqli_stmt_close($stmt);
        mysqli_close($mysqli);
        //echo "miaoji";
    } else {
    }
} else if ($_GET['ID']==='1'){
    //search for student
    $stmt = mysqli_prepare($mysqli, "SELECT `AccountID`, `Name` FROM `staStudent` WHERE 1");
    if ($stmt) {
        mysqli_stmt_execute($stmt);
        $stmt->bind_result($AccountID, $StudentName);
        $stmt->store_result();
        $rows = $stmt->num_rows;
        $current_row = 1;
        echo "{\n";
        echo "\"draw\": 1,\n";
        echo "\"recordsTotal\": " . $rows . ",\n";
        echo "\"recordsFiltered\": " . $rows . ",\n";
        echo "\"data\": [\n";
        while (mysqli_stmt_fetch($stmt)) {
            echo "{\n";
            echo "\"ID\": \"$AccountID\",\n";
            echo "\"StudentName\": \"$StudentName\",\n";

            //search for account name
            $stmt2 = mysqli_prepare($mysqli, "SELECT `GuardianNameOne` FROM `staAccount` WHERE `ID`=?");
            mysqli_stmt_bind_param($stmt2, 's', $AccountID);
            mysqli_stmt_execute($stmt2);
            $stmt2->bind_result($AccountName);
            mysqli_stmt_fetch($stmt2);
            $stmt2->close();
            echo "\"AccountName\": \"$AccountName\",\n";

            //Check if already checked in
            $stmt2 = mysqli_prepare($mysqli, "SELECT `ID`, `CheckIn`, `CheckOut` FROM `CheckInOut` WHERE `AccountID`=?
                                              ORDER BY ABS( TIMESTAMPDIFF(SECOND, `CheckIn`, NOW() ) ) LIMIT 1");
            mysqli_stmt_bind_param($stmt2, "s", $AccountID);
            if ($stmt2) {
                mysqli_stmt_execute($stmt2);
                $stmt2->bind_result($HistoryID, $CheckIn, $CheckOut);
                mysqli_stmt_fetch($stmt2);
                mysqli_stmt_close($stmt2);
            } else {
                die('mysqli error: ' . mysqli_error($mysqli));
            }
            echo "\"HistoryID\": \"$HistoryID\",\n";
            if ($HistoryID == ""){
                echo "\"Action\": \"<button class='CheckIn' onclick='CheckIn($AccountID)'>Check In</button>\"\n";
            }else if ($CheckOut == ""){
                echo "\"Action\": \"<button class='CheckOut' onclick='CheckOut($AccountID, $HistoryID)'>Check Out</button>\"\n";
            }else{
                echo "\"Action\": \"<button class='CheckIn' onclick='CheckIn($AccountID)'>Check In</button>\"\n";
            }

            if ($current_row == $rows) {
                echo "}\n";
            } else {
                echo "},\n";
            }
            $current_row++;
        }
        echo "]\n";
        echo "}";
        mysqli_stmt_close($stmt);
        mysqli_close($mysqli);
        //echo "miaoji";
    } else {
    }
}else{
    //search for teacher
    $stmt = mysqli_prepare($mysqli, "SELECT `ID`, `GuardianNameOne`, `Email` FROM `staAccount` WHERE `Role`=2");
    if ($stmt) {
        mysqli_stmt_execute($stmt);
        $stmt->bind_result($AccountID, $Name, $Email);
        $stmt->store_result();
        $rows = $stmt->num_rows;
        $current_row = 1;
        echo "{\n";
        echo "\"draw\": 1,\n";
        echo "\"recordsTotal\": " . $rows . ",\n";
        echo "\"recordsFiltered\": " . $rows . ",\n";
        echo "\"data\": [\n";
        while (mysqli_stmt_fetch($stmt)) {
            echo "{\n";
            echo "\"ID\": \"$AccountID\",\n";
            echo "\"TeacherName\": \"$Name\",\n";
            echo "\"Email\": \"$Email\",\n";

            //Check if already checked in
            $stmt2 = mysqli_prepare($mysqli, "SELECT `ID`, `CheckIn`, `CheckOut` FROM `CheckInOut` WHERE `AccountID`=?
                                              ORDER BY ABS( TIMESTAMPDIFF(SECOND, `CheckIn`, NOW() ) ) LIMIT 1");
            mysqli_stmt_bind_param($stmt2, "s", $AccountID);
            if ($stmt2) {
                mysqli_stmt_execute($stmt2);
                $stmt2->bind_result($HistoryID, $CheckIn, $CheckOut);
                mysqli_stmt_fetch($stmt2);
                mysqli_stmt_close($stmt2);
            } else {
                die('mysqli error: ' . mysqli_error($mysqli));
            }
            echo "\"HistoryID\": \"$HistoryID\",\n";
            if ($HistoryID == ""){
                echo "\"Action\": \"<button class='CheckIn' onclick='CheckIn($AccountID)'>Check In</button>\"\n";
            }else if ($CheckOut == ""){
                echo "\"Action\": \"<button class='CheckOut' onclick='CheckOut($AccountID, $HistoryID)'>Check Out</button>\"\n";
            }else{
                echo "\"Action\": \"<button class='CheckIn' onclick='CheckIn($AccountID)'>Check In</button>\"\n";
            }

            if ($current_row == $rows) {
                echo "}\n";
            } else {
                echo "},\n";
            }
            $current_row++;
        }
        echo "]\n";
        echo "}";
        mysqli_stmt_close($stmt);
        mysqli_close($mysqli);
        //echo "miaoji";
    } else {
    }
}
?>