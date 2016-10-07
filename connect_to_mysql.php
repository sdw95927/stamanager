<?php
/**
 * Created by PhpStorm.
 * User: shidan
 * Date: 8/7/16
 * Time: 12:10 AM
 */

/* connect to database */
set_time_limit(1000);
$mysqli = mysqli_connect('localhost', 'root', '0927', 'southlaketa');
if($mysqli->connect_error){
    die('could not connect to MySQL:' . $mysqli->connect_error);
}
?>