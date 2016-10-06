<?php
session_start();
if(!isset($_SESSION['stamgaccount']) || !isset($_SESSION['stamgrole'])){
    header("Location: login.php");
}

?>

<header>
    <div id="banner">
        <div id="welcome_slogan">
            <h3><img src="images/stalogo.png" style="height:60px;"/>&nbsp;&nbsp;&nbsp;Southlake Tutoring Academy
                Management Tool</h3>
        </div><!--close welcome_slogan-->
    </div><!--close banner-->
</header>

<nav>
    <div id="menubar">
        <ul id="nav">
            <li id="navhome"><a href="index.php">Home</a></li>
            <li id="navrequest"><a href="requests.php">Requests</a></li>
            <li id="navregister"><a href="register.php">Registration Form</a></li>
            <li id="navcheckinout"><a href="checkinout.php">Check In/Out</a></li>
            <li id="navreport"><a href="teachingreport.php">Teaching Report</a></li>
            <li id="navmanagement"><a href="management.php">Management</a></li>
        </ul>
    </div><!--close menubar-->
</nav>	