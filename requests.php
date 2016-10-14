<!DOCTYPE html>
<html>

<head>
    <title>Southlake Tutoring Academy Management Tool</title>
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="description" content="website description"/>
    <meta name="keywords" content="website keywords, website keywords"/>
    <meta http-equiv="content-type" content="text/html; charset=windows-1252"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css"/>
    <!-- modernizr enables HTML5 elements and feature detects -->
    <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>

    <!-- javascript at the bottom for fast page loading -->
    <script type="text/javascript" src="js/jquery.js"></script>

    <script type="text/javascript" src="js/jquery.dataTables.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#navrequest").addClass("current");
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
                <h1>Request Management</h1>
                <hr>
                <br><br>

                <div style="background: #FFF;">
                    <div id="col-left">
                        <div id="menu8">
                            <ul>
                                <li><a href="#newquest">&nbsp;&nbsp;&nbsp;New Request</a></li>
                                <li><a href="#pendingrequest">&nbsp;&nbsp;&nbsp;Pending Request</a></li>
                                <li><a href="#closerequest">&nbsp;&nbsp;&nbsp;Closed Request</a></li>
                            </ul>
                        </div>
                    </div>


                    <div id="col-right">

                        <div style="margin-left:60px;margin-right:20px;text-align: justify;">

                            <div style="padding: 20px 10px 20px 0px;"><h3 id="newquest"> New Request</h3><hr><br>
                                <table class="table1">
                                    <thead>
                                    <tr>
                                        <th>Request Type</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Create Time</th>
                                        <th>Reply</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Accout Request</td>
                                        <td>Bo Yao</td>
                                        <td>bo.yao@utsoutwestern.edu</td>
                                        <td>214-111-1111</td>
                                        <td>2011/04/25</td>
                                        <td><a href="#">Reply</a></td>
                                    </tr>
                                    <tr>
                                        <td>Accout Request</td>
                                        <td>Bo Yao</td>
                                        <td>bo.yao@utsoutwestern.edu</td>
                                        <td>214-111-1111</td>
                                        <td>2011/04/25</td>
                                        <td><a href="#">Reply</a></td>
                                    </tr>
                                    <tr>
                                        <td>Accout Request</td>
                                        <td>Bo Yao</td>
                                        <td>bo.yao@utsoutwestern.edu</td>
                                        <td>214-111-1111</td>
                                        <td>2011/04/25</td>
                                        <td><a href="#">Reply</a></td>
                                    </tr>
                                    <tr>
                                        <td>Accout Request</td>
                                        <td>Bo Yao</td>
                                        <td>bo.yao@utsoutwestern.edu</td>
                                        <td>214-111-1111</td>
                                        <td>2011/04/25</td>
                                        <td><a href="#">Reply</a></td>
                                    </tr>
                                    <tr>
                                        <td>Accout Request</td>
                                        <td>Bo Yao</td>
                                        <td>bo.yao@utsoutwestern.edu</td>
                                        <td>214-111-1111</td>
                                        <td>2011/04/25</td>
                                        <td><a href="#">Reply</a></td>
                                    </tr>
                                    <tr>
                                        <td>Accout Request</td>
                                        <td>Bo Yao</td>
                                        <td>bo.yao@utsoutwestern.edu</td>
                                        <td>214-111-1111</td>
                                        <td>2011/04/25</td>
                                        <td><a href="#">Reply</a></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!-- publications end -->
                        </div>
                    </div>

                    <div id="col-right">

                        <div style="margin-left:60px;margin-right:20px;text-align: justify;">

                            <div style="padding: 0px 0px 0px 0px;"><h3 id="pendingrequest"> Pending Request</h3>
                            </div>

                            <!-- publications end -->
                        </div>
                    </div>

                    <div id="col-right">

                        <div style="margin-left:60px;margin-right:20px;text-align: justify;">

                            <div style="padding: 0px 0px 0px 0px;"><h3 id="closerequest"> Closed Request</h3>
                            </div>

                            <!-- publications end -->
                        </div>
                    </div>
                </div>
            </div><!--close content_item-->
        </div><!--close content-->
    </div><!--close site_content-->
</div><!--close main-->

<?php include("footer.php"); ?>

<script type="text/javascript" src="js/image_slide.js"></script>

</body>
</html>
