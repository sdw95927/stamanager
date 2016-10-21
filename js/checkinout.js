/**
 * Created by shidan on 9/28/16.
 */
//global var
var $username;
var StudentTable;
var TeacherTable;
var table;

<!--AJAX code-->
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

//------- for checkin/out -------
function CheckIn(id) {
    var currentdate = new Date();
    var currentmonth = currentdate.getMonth() + 1;
    var $datetime = currentdate.getFullYear() + "-" +
        currentmonth + "-" +
        currentdate.getDate() + " " +
        currentdate.getHours() + ":" +
        currentdate.getMinutes() + ":" +
        currentdate.getSeconds();

    $.ajax(
        {
            url: "checkin.php",
            data: "ID=" + id + "&Time=" + $datetime,
            type: "POST",
            beforeSend: function () {
                $('#loading_div').show();
            },
            success: function (msg) {
                alert(msg);
                StudentTable.ajax.reload();
                TeacherTable.ajax.reload();
                table.ajax.reload();
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

function CheckOut(id, HistoryID) {
    var currentdate = new Date();
    var currentmonth = currentdate.getMonth() + 1;
    var $datetime = currentdate.getFullYear() + "-" +
        currentmonth + "-" +
        currentdate.getDate() + " " +
        currentdate.getHours() + ":" +
        currentdate.getMinutes() + ":" +
        currentdate.getSeconds();
    $.ajax(
        {
            url: "checkout.php",
            data: "ID=" + id + "&Time=" + $datetime + "&HistoryID=" + HistoryID,
            type: "POST",
            beforeSend: function () {
                $('#loading_div').show();
            },
            success: function (msg) {
                alert(msg);
                StudentTable.ajax.reload();
                TeacherTable.ajax.reload();
                table.ajax.reload();
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
//------- end for checkin/out -------

$(document).ready(function () {
    // vars
    var $mytable = $("#HistoryTable");
    var $StudentCheckInTable = $("#StudentCheckInTable");
    var $TeacherCheckInTable = $("#TeacherCheckInTable");

    //-------load datatable-------
    StudentTable = $($StudentCheckInTable).DataTable({
        "ajax": {
            url: "search_checkinout_datatable.php?ID=1"
            //data: "ID=1",
            //type: "GET"
        },
        "columns": [
            {"data": "StudentName"},
            {"data": "AccountName"},
            {"data": "Action"}
        ],
        "order": [[0, 'asc']]
    });

    TeacherTable = $($TeacherCheckInTable).DataTable({
        "ajax": {
            url: "search_checkinout_datatable.php?ID=2"
            //data: "ID=2",//seems don't work here
            //type: "GET"
        },
        "columns": [
            {"data": "TeacherName"},
            {"data": "Email"},
            {"data": "Action"}
        ],
        "order": [[0, 'asc']]
    });

    table = $($mytable).DataTable({
        "ajax": {
            url: "search_checkinout_datatable.php"
        },
        "columns": [
            {"data": "ID"},
            // {"data": "AccountID"},
            {"data": "AccountName"},
            {"data": "CheckIn"},
            {"data": "CheckOut"},
            //{"data": "RecorderID"},
            {"data": "RecorderName"}
        ],
        "order": [[0, 'asc']]
    });
    //-------end of load datatable-------

    //------- for divs --------
    $('#col-1').on('click', function () {
        $('#col-right-1').show();
        $('#col-right-2').hide();
        $('#col-right-3').hide();
    });

    $('#col-2').on('click', function () {
        $('#col-right-2').show();
        $('#col-right-1').hide();
        $('#col-right-3').hide();
    });

    $('#col-3').on('click', function () {
        $('#col-right-3').show();
        $('#col-right-1').hide();
        $('#col-right-2').hide();
    });
    //------- end for divs -------

    // //------- for checkin/out -------
    // $(document).on('click', '.CheckIn', function () {
    //     var tr = $(this).closest('tr');
    //     //alert(tr);
    //     var row = table.row(tr);
    //     id = row.data().ID;
    //
    //     var currentdate = new Date();
    //     var currentmonth = currentdate.getMonth() + 1;
    //     var $datetime = currentdate.getFullYear() + "-" +
    //         currentmonth + "-" +
    //         currentdate.getDate() + " " +
    //         currentdate.getHours() + ":" +
    //         currentdate.getMinutes() + ":" +
    //         currentdate.getSeconds();
    //
    //     $.ajax(
    //         {
    //             url: "checkin.php",
    //             data: "ID=" + id + "&Time=" + $datetime,
    //             type: "POST",
    //             beforeSend: function () {
    //                 $('#loading_div').show();
    //             },
    //             success: function (msg) {
    //                 alert(msg);
    //                 table.ajax.reload();
    //                 $('#loading_div').hide();
    //             },
    //             error: function (xhr) {
    //                 alert('Ajax request alert');
    //                 $('#loading_div').hide();
    //             },
    //             complete: function () {
    //             }
    //         }
    //     );
    // });
    // $(document).on('click', '.CheckOut', function () {
    //     var tr = $(this).closest('tr');
    //     //alert(tr);
    //     var row = table.row(tr);
    //     id = row.data().ID;
    //     //alert(id);
    //     $.ajax(
    //         {
    //             url: "checkout.php",
    //             data: "ID=" + id,
    //             type: "POST",
    //             beforeSend: function () {
    //                 $('#loading_div').show();
    //             },
    //             success: function (msg) {
    //                 alert(msg);
    //                 table.ajax.reload();
    //                 $('#loading_div').hide();
    //             },
    //             error: function (xhr) {
    //                 alert('Ajax request alert');
    //                 $('#loading_div').hide();
    //             },
    //             complete: function () {
    //             }
    //         }
    //     );
    // });
    // //------- end for checkin/out -------
});