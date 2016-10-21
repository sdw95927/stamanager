<?php
session_start();
if(!isset($_SESSION['stamgaccount']) || !isset($_SESSION['stamgrole'])){
    header("Location: login.php");
}else{
    $_SESSION['StaManagerUsername'] = $_SESSION['stamgaccount'];
}

?>

<!DOCTYPE html>
<html>

<head>
    <title>Southlake Tutoring Academy Management Tool</title>
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="description" content="website description"/>
    <meta name="keywords" content="website keywords, website keywords"/>
    <meta http-equiv="content-type" content="text/html; charset=windows-1252"/>

    <!-- css  -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="css/mycss.checkinout.css">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>

    <!-- modernizr enables HTML5 elements and feature detects -->
    <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>

    <!-- javascript at the bottom for fast page loading -->
    <script type="text/javascript" src="js/jquery.js"></script>

    <!-- myjavascript   -->
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/checkinout.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#navcheckinout").addClass("current");
        });
    </script>
</head>

<body>
<div id="main">
    <?php include("header.php"); ?>

    <div id="site_content">

        <br><br>

        <div id="content">
            <div class="content_item">
                <h1>Check In / Out Management</h1>
                <hr>
                <br><br>

                <div style="background: #FFF;">
                    <div id="col-left">
                        <div id="menu8">
                            <ul>
<!--                                <li id="col-1"><a href="#student">&nbsp;&nbsp;&nbsp;Student Check In / Out</a></li>-->
<!--                                <li id="col-2"><a href="#teacher">&nbsp;&nbsp;&nbsp;Teacher Check In / Out</a></li>-->
<!--                                <li id="col-3"><a href="#history">&nbsp;&nbsp;&nbsp;Check In / Out History</a></li>-->
                                <li id="col-1"><a href="#">&nbsp;&nbsp;&nbsp;Student Check In / Out</a></li>
                                <li id="col-2"><a href="#">&nbsp;&nbsp;&nbsp;Teacher Check In / Out</a></li>
                                <li id="col-3"><a href="#">&nbsp;&nbsp;&nbsp;Check In / Out History</a></li>
                            </ul>
                        </div>
                    </div>

                    <!--    student check in/out   -->
                    <div id="col-right-1">
                        <div style="margin-left:60px;margin-right:20px;text-align: justify;">
                            <div style="padding: 0px 0px 0px 0px;"><h3 id="student"> Student Check In / Out</h3>
                            </div>
                            <!-- publications end -->
                        </div>
                        <div class="content">
                            <div class="container">
                                <div class="DivTable">
                                    <div>
                                        <table id="StudentCheckInTable" class="display" cellspacing="0" width="100%">
                                            <thead>
                                            <tr>
                                                <th>Student Name</th>
                                                <th>Account Name</th>
                                                <th>Action</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>
                                <!-- /.container -->

                                <div id="loading_div" hidden="hidden" class="center" style="display:none">
                                    <img src="images/loading2.gif">
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--    teacher check in/out   -->
                    <div id="col-right-2" hidden="hidden">

                        <div style="margin-left:60px;margin-right:20px;text-align: justify;">

                            <div style="padding: 0px 0px 0px 0px;"><h3 id="teacher"> Teacher Check In / Out</h3>
                            </div>

                            <!-- publications end -->
                        </div>
                        <div class="content">
                            <div class="container">
                                <div class="DivTable">
                                    <div id="DivDatatable">
                                        <table id="TeacherCheckInTable" class="display" cellspacing="0" width="100%">
                                            <thead>
                                            <tr>
                                                <th>Teacher Name</th>
                                                <th>Email Address</th>
                                                <th>Action</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>
                                <!-- /.container -->

                                <div id="loading_div" hidden="hidden" class="center" style="display:none">
                                    <img src="images/loading2.gif">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="col-right-3" hidden="hidden">

                        <div style="margin-left:60px;margin-right:20px;text-align: justify;">

                            <div style="padding: 0px 0px 0px 0px;"><h3 id="history"> Check In / Out History</h3>
                            </div>

                            <!-- publications end -->
                        </div>
                        <div class="content">
                            <div class="container">
                                <div class="DivTable">
                                    <div id="DivDatatable">
                                        <table id="HistoryTable" class="display" cellspacing="0" width="100%">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <!--                                                <th>Account ID</th>-->
                                                <th>Name</th>
                                                <th>Check In</th>
                                                <th>Check Out</th>
                                                <th>Recorder</th>
                                                <!--                                                <th>Recorder ID</th>-->
                                                <!--                                                <th>Recorder Name</th>-->
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>
                                <!-- /.container -->
                            </div>
                        </div>
                    </div>

                    <div id="loading_div" hidden="hidden" class="center" style="display:none">
                        <img src="images/loading2.gif">
                    </div>
                </div><!--close content_item-->
            </div><!--close content-->
        </div><!--close site_content-->
    </div><!--close main-->

    <?php include("footer.php"); ?>

</body>
</html>
