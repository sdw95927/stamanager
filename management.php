<!DOCTYPE html>
<html>

<head>
    <title>Southlake Tutoring Academy Management Tool</title>
    <meta name="description" content="website description"/>
    <meta name="keywords" content="website keywords, website keywords"/>
    <meta http-equiv="content-type" content="text/html; charset=windows-1252"/>
    
    <!--  css  -->
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/mycss.management.css"/>


    <!-- modernizr enables HTML5 elements and feature detects -->
    <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>

    <!-- javascript at the bottom for fast page loading -->
    <script type="text/javascript" src="js/jquery.js"></script>

    <script type="text/javascript">
        $(function() {
            $("#navmanagement").addClass("current");
        });
    </script>
</head>

<body>
<div id="main">
    <?php include("header.php") ?>

    <div id="site_content">

        <div class="slideshow">
            <ul class="slideshow">
                <li class="show"><img width="900" height="250" src="images/home_1.jpg"
                                      alt="&quot;Electronic form input&quot;"/>
                </li>
                <li><img width="900" height="250" src="images/home_2.jpg"
                         alt="&quot;Manager your teaching reports&quot;"/>
                </li>
                <li><img width="900" height="250" src="images/home_3.jpg"
                         alt="&quot;Mange check-in and check-out reports&quot;"/>
                </li>
            </ul>
        </div>

        <div id="content">
            <div class="content_item">
                <div class="form_settings">
                    <h1>Management</h1>
                    <p style="padding-bottom: 15px;">This tool aims to paperless school management. All of paper forms, such as registration form, check
                        in/out, and teach reports, are switching into computer-based form input. This tool also deals with
                        the requests from STA main website. These teach reports and responses of requests can be viewed by
                        the students on STA main website. Under 'Management', several important functions, such as class
                        management, account management, payment form, email function may help the managers in an efficient
                        way.</p>
                    <a href="class.php"><button class="bigbutton">Class Management</button></a>
                    <button class="bigbutton">Account Management</button>
                    <a href="payment.php"><button class="bigbutton">Payment Management</button></a>
                    <button class="bigbutton">Student Management</button><br><br>
                    <button class="bigbutton">Email Management</button>
                    <button class="bigbutton">Teacher Management</button><br><br>
                </div><!--close form_settings-->
            </div><!--close content_item-->
        </div><!--close content-->
    </div><!--close site_content-->
</div><!--close main-->

<?php include("footer.php"); ?>

<script type="text/javascript" src="js/image_slide.js"></script>

</body>
</html>
