<?php
session_start();
if (isset($_SESSION['StaManagerUsername'])) { // if already login
//check within database
    $username = $_SESSION['StaManagerUsername'];
} else {
    $_SESSION['StaManagerUsername'] = 'test.manager';
}
?>
<html>
<head>
    <!-- css  -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
    <!--          href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">-->
    <!--    <link rel="stylesheet" type="text/css" href="https://editor.datatables.net/extensions/Editor/css/editor.dataTables.min.css">-->
    <!--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.2.1/css/buttons.dataTables.min.css">-->
    <!--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.2.0/css/select.dataTables.min.css">-->
    <link rel="stylesheet" type="text/css" href="css/mycss.css">


    <!-- jQuery -->
    <script type="text/javascript" src="js/jquery.js"></script>

    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <!--    <script type="text/javascript" charset="utf8"-->
    <!--            src="https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script>-->
    <!--    <script type="text/javascript" charset="utf8"-->
    <!--            src="https://cdn.datatables.net/select/1.2.0/js/dataTables.select.min.js"></script>-->
    <!--    <script type="text/javascript" charset="utf8"-->
    <!--            src="https://cdn.datatables.net/buttons/1.2.1/js/dataTables.buttons.min.js"></script>-->


    <script>
        //global var
        var $username;

        <!--AJAX code-->
        function showresult(str, myid) {
            var xhttp;
            if (str == "") {
                document.getElementById(myid).innerHTML = "miaoji";
                return;
            }
            if (window.XMLHttpRequest) {
                // code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            } else { // code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    document.getElementById(myid).innerHTML = xmlhttp.responseText;
                }
            };
            if (str == 'all') {
                xmlhttp.open("GET", "searchdatabase_payment.php", true);
            } else {
                xmlhttp.open("GET", "searchdatabase_payment.php?tumortype=" + str, true);
            }
            xmlhttp.send();
        }

        function getusername() {
            var xhttp;
            if (window.XMLHttpRequest) {
                // code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            } else { // code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    $username = xmlhttp.responseText;
                }
            };
            xmlhttp.open("GET", "get_username.php", true);
            xmlhttp.send();
        }

        //------- for editing form -------
        function EnableEditing(id) {
            $.ajax(
                {
                    url: "search_payment_datatable.php",
                    data: "ID=" + id,
                    type: "POST",
                    beforeSend: function () {
                        $('#loading_div').show();
                        //beforeSend 發送請求之前會執行的函式
                    },
                    success: function (msg) {
                        var result = msg.split("&&");
                        //alert(result);
                        //0: payername
                        //1: amountdollar
                        //2: cardtype
                        //3: check No.
                        //4: is cash
                        //5: student name
                        //6: class ID
                        //7: receiver name
                        //8: note
                        //9: create time
                        $("#PayerName").val(result[0]);
                        $("#AmountDollar").val(result[1]);
                        //$("input[name=cardtype]:checked").val(); //2
                        //var $iscash = $("input[name=iscash]:checked").val(); //4
                        var cardtypes = document.getElementsByName('cardtype');
                        for (var i = 0; i < cardtypes.length; i++) {
                            cardtypes[i].checked = false;
                        }
                        var paymenttypes = document.getElementsByName('iscash');
                        var inputcheckno = "#InputCheckNo";
                        var selectcardtype = "#SelectCardType";

                        if (result[4] == 1) { //is cash;
                            paymenttypes[0].checked = true;
                            $(inputcheckno).hide();
                            $(selectcardtype).hide();
                        } else if (result[3] == "") { //no check No.; is card
                            paymenttypes[2].checked = true;
                            switch (result[2]) {
                                case "Debit":
                                    cardtypes[0].checked = true;
                                    break;
                                case "Credit":
                                    cardtypes[1].checked = true;
                                    break;
                                case "Discover":
                                    cardtypes[2].checked = true;
                                    break;
                                case "Master":
                                    cardtypes[3].checked = true;
                                    break;
                            }
                            $(inputcheckno).hide();
                            $(selectcardtype).show();
                        } else {//is check
                            paymenttypes[1].checked = true;
                            $("#CheckNo").val(result[3]);
                            $(inputcheckno).show();
                            $(selectcardtype).hide();
                        }
                        $("#StudentName").val(result[5]);

                        //select classID
                        //$("select[name=ClassID]").val(); //6
                        //var selectclassid = "#SelectClassID";
//                        var sel = document.getElementsByName("ClassID");
//                        alert(sel);
//                        var j = sel.length;
//                        for(i = 0; i < j; ++i) {
//                            if(sel.options[i].innerHTML === result[6]) {
//                                sel.selectedIndex = i;
//                                break;
//                            }
//                        }
                        document.getElementById('SelectClassID').value = result[6];
                        //document.getElementById(selectclassid).selectedIndex=result[6];

                        $("#ReceiverName").val(result[7]);

                        $("#Note").val(result[8]);

                        $("#EditRow").show();
                        $("#addRow").hide();
                        $("#AddOrEdit").show();
                        $("#ShowAddOrEditForm").html("Hide edit form");


//                            var flag = msg.substring(0, 8);
//                            var firstname = msg.substring(9)

//                            if (flag == "successY") {
//
//                                $('#login').hide();
//                                $('#logout').show();
//                                $('#login_showname').text('Hello, Admin');
//                                $("#loginForm").hide();
//                                $("#registerForm").hide();
//                                $("#recommended_products").fadeIn();
//                                Category_Admin();
//                                Search_Admin();
//                           }
//                            else if (flag == "successN") {
//                                $('#login').hide();
//                                $('#logout').show();
//                                $('#login_showname').text('Hello, ' + firstname);
//                                $("#loginForm").hide();
//                                $("#registerForm").hide();
//                                $("#recommended_products").fadeIn();
//                                Category_GeneralUser();
//                                Search_GeneralUser();
//                           }
//                            else {
//                                $('#error_msg').text('The username or password you entered is incorrect. Please try again.');
//                            }
                        $('#loading_div').hide();
                    },
                    error: function (xhr) {
                        alert('Ajax request alert');
                        $('#loading_div').hide();
                    },
                    complete: function () {
                    }
                }
            );
        }
        //------- end for editing form -------
    </script>

    <!--  datatable code  -->
    <script>
        //        var editor;

        $(document).ready(function () {
            var $mytable = $("#paymenttable");
            //load datatable

//            editor = new $.fn.dataTable.Editor( {
//                "ajax": "searchdatabase_payment_datatable.php",
//                "table": "#paymenttable"
//                fields: [ {
//                    label: "First name:",
//                    name: "first_name"
//                }, {
//                    label: "Last name:",
//                    name: "last_name"
//                }, {
//                    label: "Position:",
//                    name: "position"
//                }, {
//                    label: "Office:",
//                    name: "office"
//                }, {
//                    label: "Extension:",
//                    name: "extn"
//                }, {
//                    label: "Start date:",
//                    name: "start_date",
//                    type: "datetime"
//                }, {
//                    label: "Salary:",
//                    name: "salary"
//                }
//                ]
//           } );

//            $($mytable).on('click', 'tbody td:not(:first-child)', function (e) {
//                editor.inline(this);
//            });

            $($mytable).dataTable({
                // "processing": true,
                // "serverSide": true,
                // "ajax": 'test.txt'
                "ajax": "search_payment_datatable.php"


                //------- enable editing -------
                // Activate an inline edit on click of a table cell
                //dom: "Bfrtip",
                //ajax: "../php/staff.php",
//                columns: [
//                    {
//                        data: null,
//                        defaultContent: '',
//                        className: 'select-checkbox',
//                        orderable: false
//                    },
//                    {data: "first_name"},
//                    {data: "last_name"},
//                    {data: "position"},
//                    {data: "office"},
//                    {data: "start_date"},
//                    {data: "salary", render: $.fn.dataTable.render.number(',', '.', 0, '$')}
//                ],
//                "select": {
//                    style: 'os',
//                    selector: 'td:first-child'
//                },
//                buttons: [
//                    {extend: "create", editor: editor},
//                    {extend: "edit", editor: editor},
//                    {extend: "remove", editor: editor}
//                ]
                //------- end of enable editing
            });

            // vars
            var table = $($mytable).DataTable();
            //var $username = '<%= Session["StaManagerUsername"] %>';

            //--------add row-------
            var $add_row = $("#addRow");
            getusername();

            $($add_row).on('click', function () {
                //alert($username);
                var $payername = $("#PayerName").val();
                var $amountdollar = $("#AmountDollar").val();
                var $cardtype = $("input[name=cardtype]:checked").val();
                var $checkno = $("#CheckNo").val();
                var $iscash = $("input[name=iscash]:checked").val();
                var $studentname = $("#StudentName").val();
                //var $classID = $("#ClassID").val();
                var $classID = $("select[name=ClassID]").val();
                var $receivername = $("#ReceiverName").val();
                var $note = $("#Note").val();
                var currentdate = new Date();
                var $datetime = currentdate.getFullYear() + "-" +
                    currentdate.getMonth() + "-" +
                    currentdate.getDate() + " " +
                    currentdate.getHours() + ":" +
                    currentdate.getMinutes() + ":" +
                    currentdate.getSeconds();

                //add to database
                $.ajax(
                    {
                        url: "insert_payment_database.php",
                        data: "payername=" + $payername + "&amountdollar=" + $amountdollar + "&cardtype=" + $cardtype +
                        "&checkno=" + $checkno + "&iscash=" + $iscash + "&studentname=" + $studentname + "&classID=" +
                        $classID + "&receivername=" + $receivername + "&note=" + $note + "&createtime=" + $datetime +
                        "&updater=" + $username + "&updatetime=" + "",
                        type: "POST",
                        beforeSend: function () {
                            $('#loading_div').show();
                            //beforeSend 發送請求之前會執行的函式
                        },
                        success: function (msg) {
                            alert(msg);
//                            var flag = msg.substring(0, 8);
//                            var firstname = msg.substring(9)

//                            if (flag == "successY") {
//
//                                $('#login').hide();
//                                $('#logout').show();
//                                $('#login_showname').text('Hello, Admin');
//                                $("#loginForm").hide();
//                                $("#registerForm").hide();
//                                $("#recommended_products").fadeIn();
//                                Category_Admin();
//                                Search_Admin();
//                           }
//                            else if (flag == "successN") {
//                                $('#login').hide();
//                                $('#logout').show();
//                                $('#login_showname').text('Hello, ' + firstname);
//                                $("#loginForm").hide();
//                                $("#registerForm").hide();
//                                $("#recommended_products").fadeIn();
//                                Category_GeneralUser();
//                                Search_GeneralUser();
//                           }
//                            else {
//                                $('#error_msg').text('The username or password you entered is incorrect. Please try again.');
//                            }
                            $('#loading_div').hide();
                        },
                        error: function (xhr) {
                            alert('Ajax request alert');
                            $('#loading_div').hide();
                        },
                        complete: function () {
                        }
                    }
                );

                table.row.add([
                    $payername,
                    $amountdollar,
                    $cardtype,
                    $checkno,
                    $iscash,
                    $studentname,
                    $classID,
                    $receivername,
                    $note,
                    $datetime,
                    $username,
                    ""
                ]).draw(false);
            });

            // Automatically add a first row of data
            //$($add_row).click();

            //-------end add row------

            //------- Setup - add a text input to each footer cell --------
            $($mytable).find('tfoot th').each(function () {
                var title = $(this).text();
                $(this).html('<input type="text" placeholder="Search ' + title + '" />');
            });

            // Apply the search
            table.columns().every(function () {
                var that = this;

                $('input', this.footer()).on('keyup change', function () {
                    if (that.search() !== this.value) {
                        that
                            .search(this.value)
                            .draw();
                    }
                });
            });
            //------- end Setup text input search --------

//                //------- Setup select search (not working) --------
//                $($mytable).DataTable( {
//                    initComplete: function () {
//                        this.api().columns().every( function () {
//                            var column = this;
//                            var select = $('<select><option value=""></option></select>')
//                                .appendTo( $(column.footer()).empty() )
//                                .on( 'change', function () {
//                                    var val = $.fn.dataTable.util.escapeRegex(
//                                        $(this).val()
//                                    );
//
//                                    column
//                                        .search( val ? '^'+val+'$' : '', true, false )
//                                        .draw();
//                                } );
//
//                            column.data().unique().sort().each( function ( d, j ) {
//                                select.append( '<option value="'+d+'">'+d+'</option>' )
//                            } );
//                        } );
//                    }
//                } );
            //------- end Setup select search --------

            //------- highlight column --------
            $($mytable).find('tbody')
                .on('mouseenter', 'td', function () {
                    var colIdx = table.cell(this).index().column;
                    $(table.cells().nodes()).removeClass('highlight');
                    $(table.column(colIdx).nodes()).addClass('highlight');
                });
            //------- end highlight column

            //------- for form --------
            $($add_row).show();

            $('#ShowAddOrEditForm').on('click', function () {
                var addoredit = '#AddOrEdit';
                var showbutton = '#ShowAddOrEditForm';
                if ($(addoredit).is(":visible") === true) {
                    $(addoredit).hide();
                    $(showbutton).html('Open edit form/Add new payment record');
                } else {
                    $(addoredit).show();
                    $(showbutton).html('Hide edit form');
                }
            });

            $('#Close').on('click', function () {
                var addoredit = '#AddOrEdit';
                var showbutton = '#ShowAddOrEditForm';
                $(addoredit).hide();
                $(showbutton).html('Open edit form/Add new payment record');
            });

            $('#IsCardTrue').on('click', function () {
                $('#SelectCardType').show();
                $('#CheckNo').val("");
                $('#InputCheckNo').hide();
            });

            $('#IsCheckTrue').on('click', function () {
                var cardtypes = document.getElementsByName('cardtype');
                for (var i = 0; i < cardtypes.length; i++) {
                    cardtypes[i].checked = false;
                }
                $('#SelectCardType').hide();
                $('#InputCheckNo').show();
            });

            $('#IsCashTrue').on('click', function () {
                var cardtypes = document.getElementsByName('cardtype');
                for (var i = 0; i < cardtypes.length; i++) {
                    cardtypes[i].checked = false;
                }
                $('#SelectCardType').hide();
                $('#InputCheckNo').hide();
            });

            $('#Reset').on('click', function () {
                $("#PayerName").val("");
                $("#AmountDollar").val("");
                var cardtypes = document.getElementsByName('cardtype');
                for (var i = 0; i < cardtypes.length; i++) {
                    cardtypes[i].checked = false;
                }
                var paymenttypes = document.getElementsByName('iscash');
                var inputcheckno = "#InputCheckNo";
                var selectcardtype = "#SelectCardType";
                paymenttypes[0].checked = true;
                $(inputcheckno).hide();
                $(selectcardtype).hide();
                $("#CheckNo").val("");
                $("#StudentName").val("");
                $("select[name=ClassID]").val(""); //6
                $("#ReceiverName").val("");
                $("#Note").val("");
                $("#EditRow").hide();
                $("#addRow").show();
            });
            //------- end of for form -------
        })
    </script>
</head>
<body>


<!-- Page Content -->
<div class="content">
    <div class="container">
        <hr>
        <div>
            <p>Payment</p>
        </div>

        <?php include("connect_to_mysql.php"); ?>

        <div class="DivTable">
            <!--    mytable    -->
            <button id="ShowAddOrEditForm">Add Payment record</button>
            <table id="paymenttable" class="display">
                <thead>
                <tr>
                    <th>Payer Name</th>
                    <th>Amount Dollar</th>
                    <th>Card Type</th>
                    <th>Check No</th>
                    <th>Is Cash</th>
                    <th>Student Name</th>
                    <th>ClassID</th>
                    <th>ReceiverName</th>
                    <th>Note</th>
                    <th>Create Time</th>
                    <th>Updater Name</th>
                    <th>Update Time</th>
                    <th>action</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Payer Name</th>
                    <th>Amount Dollar</th>
                    <th>Card Type</th>
                    <th>Check No</th>
                    <th>Is Cash</th>
                    <th>Student Name</th>
                    <th>ClassID</th>
                    <th>ReceiverName</th>
                    <th>Note</th>
                    <th>Create Time</th>
                    <th>Updater Name</th>
                    <th>Update Time</th>
                    <th>action</th>
                </tr>
                </tfoot>
            </table>
        </div>

        <hr>
        <!--        <form class="center">-->
        <div class="DivForm" id="AddOrEdit" hidden="" style="display:none">
            <h4 class="center">Edit Form</h4>
            <img id="Close" src="image/close1.png">
            <input id="PaymentID" hidden="" style="display:none">

            <p>Payer Name</p>
            <input type="text" id="PayerName">

            <p>Amount Dollar</p>
            <input type="text" id="AmountDollar">

            <p>Select Payment Type</p>
            <input type="radio" name="iscash" value="1" id="IsCashTrue" checked/> Cash
            <input type="radio" name="iscash" value="0" id="IsCheckTrue"/> Check
            <input type="radio" name="iscash" value="0" id="IsCardTrue"/> Card

            <div id="SelectCardType" hidden="" style="display:none">
                <p>Card Type</p>
                <input type="radio" name="cardtype" value="Debit"/> Debit
                <input type="radio" name="cardtype" value="Credit"/> Credit
                <input type="radio" name="cardtype" value="Discover"/> Discover
                <input type="radio" name="cardtype" value="Master"/> Master
            </div>

            <div id="InputCheckNo" hidden="hidden" style="display:none">
                <p>Check No.</p>
                <input type="text" id="CheckNo">
            </div>

            <p>Student Name</p>
            <input type="text" id="StudentName">

            <p>Class ID</p>
            <!-- <td><input type="text" id="ClassID"></td> -->
            <select id="SelectClassID" name="ClassID">
                <option value=""></option>
                <!-- auromatically generate list -->
                <?php
                $stmt = mysqli_prepare($mysqli, "SELECT ID FROM staClass");
                if ($stmt) {
                    mysqli_stmt_execute($stmt);
                    $stmt->bind_result($classID);
                    while (mysqli_stmt_fetch($stmt)) {
                        echo "<option value=$classID>$classID</option>\n";
                    }
                    mysqli_stmt_close($stmt);
                } else {
                    die('mysqli error: ' . mysqli_error($mysqli));
                }
                ?>
            </select>
            <p>Receiver Name</p>
            <input type="text" id="ReceiverName">
            <p>Note</p>
            <input type="text" id="Note">
            <button id="addRow" hidden="" style="display:none">Add row</button>
            <button id="EditRow" hidden="" style="display:none">Confirm Edition</button>
            <button id="Reset">Reset</button>
        </div>
        <!-- /.container -->

        <div id="loading_div" hidden="hidden" class="center" style="display:none">
            <img src="image/loading2.gif">
        </div>
    </div>
</div>

</body>
</html>