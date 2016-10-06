<?php
session_start();
if((!empty($_POST['usr'])) && (!empty($_POST['pswd']))){


if(strtolower($_POST['usr']) == "admin" && $_POST['pswd'] == "123456")
{
	$_SESSION['stamgaccount'] = $_POST['usr'];
	$_SESSION['stamgrole'] = "1"; // to do here. role will be read from database

	header("Location: index.php");
}
else
{
	header("Location: login.php");
}
}
else{
	header("Location: login.php");
}
?>
