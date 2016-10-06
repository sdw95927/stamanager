<?php
session_start();
if (isset($_SESSION['StaManagerUsername'])) { // if already login
    echo $_SESSION['StaManagerUsername'];
}else{
    echo "Guest";
}
?>