/**
 * Created by shidan on 9/28/16.
 */
//global var
var $username;
var ImageClass;

$(function () {
    $("#navmanagement").addClass("current");
});

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

                $("#PaymentID").val(id);
                $("#PaymentCreateTime").val(result[9]);

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

                document.getElementById('SelectClassID').value = result[6];

                $("#ReceiverName").val(result[7]);

                $("#Note").val(result[8]);

                $("#EditRow").show();
                $("#addRow").hide();
                $("#AddOrEdit").show();
                $("#ShowAddOrEditForm").html("Hide edit form");

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

//-------datatable funtion------
function getimageclass(ID) {
    // var xhttp;
    // if (window.XMLHttpRequest) {
    //     // code for IE7+, Firefox, Chrome, Opera, Safari
    //     xmlhttp = new XMLHttpRequest();
    // } else { // code for IE6, IE5
    //     xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    // }
    // xmlhttp.onreadystatechange = function () {
    //     if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
    //         ImageClass = xmlhttp.responseText;
    //         alert("miaoji");
    //         alert(ImageClass);
    //     }
    // };
    // xmlhttp.open("GET", "get_class_image.php?ID=" + ID, true);
    // xmlhttp.send();
    return $.ajax({
        url: "get_class_image.php",
        data: "ID=" + ID,
        type: "GET",
        beforeSend: function () {
            $('#loading_div').show();
        },
        success: function (msg) {
            //alert("successfully retrived image!");
            ImageClass = msg;
            $('#loading_div').hide();
        }
    })
}

function format(d) {
    // `d` is the original data object for the row
    // $.ajax(
    //     {
    //         url: "get_class_image.php",
    //         data: "ID=" + d.ID,
    //         type: "POST",
    //         beforeSend: function () {
    //             $('#loading_div').show();
    //         },
    //         success: function (msg) {
    //             alert("successfully retrived image!");
    //             var myimage = msg;
    //             $('#loading_div').hide();
    //             return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
    //                 '<tbody>' +
    //                 '<tr>' +
    //                 '<td>Class Name:</td>' +
    //                 '<td>' + d.Title + '</td>' +
    //                 '</tr>' +
    //                 '<tr>' +
    //                 '<td>Image:</td>' +
    //                 '<td>' + '<img src ="data:image/jpeg;base64,base64_encode(' + myimage + ')" width="175" height="175" />' + '</td>' +
    //                 '</tr>' +
    //                 '<tr>' +
    //                 '<td>Description Paragraph 1:</td>' +
    //                 '<td>' + d.ParagraphOne + '</td>' +
    //                 '</tr>' +
    //                 '<tr>' +
    //                 '<td>Description Paragraph 2:</td>' +
    //                 '<td>' + d.ParagraphTwo + '</td>' +
    //                 '</tr>' +
    //                 '<tr>' +
    //                 '<td>Description Paragraph 3:</td>' +
    //                 '<td>' + d.ParagraphThree + '</td>' +
    //                 '</tr>' +
    //                 '<tr>' +
    //                 '<td>Maximum Seat Number:</td>' +
    //                 '<td>' + d.MaxSeat + '</td>' +
    //                 '</tr>' +
    //                 '<tr>' +
    //                 '<td>Price($):</td>' +
    //                 '<td>' + d.Price + '</td>' +
    //                 '</tr>' +
    //                 '<tr>' +
    //                 '<td>Class Type:</td>' +
    //                 '<td>' + d.ClassType + '</td>' +
    //                 '</tr>' +
    //                 '<tr>' +
    //                 '<td>Balance Type:</td>' +
    //                 '<td>' + d.BalanceType + '</td>' +
    //                 '</tr>' +
    //                 '<tr>' +
    //                 '<td>Is Published:</td>' +
    //                 '<td>' + d.IsPublished + '</td>' +
    //                 '</tr>' +
    //                 '<tr>' +
    //                 '<td>Create Time:</td>' +
    //                 '<td>' + d.CreateTime + '</td>' +
    //                 '</tr>' +
    //                 '<tr>' +
    //                 '<td>Update Time:</td>' +
    //                 '<td>' + d.UpdateTime + '</td>' +
    //                 '</tr>' +
    //                 '</tbody>' +
    //                 '</table>';
    //         },
    //         error: function (xhr) {
    //             alert('Ajax request alert');
    //             $('#loading_div').hide();
    //         },
    //         complete: function () {
    //         }
    //     }
    // );
    //
    // var xhttp;
    // if (window.XMLHttpRequest) {
    //     // code for IE7+, Firefox, Chrome, Opera, Safari
    //     xmlhttp = new XMLHttpRequest();
    // } else { // code for IE6, IE5
    //     xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    // }
    // xmlhttp.onreadystatechange = function () {
    //     if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
    //         ImageClass = xmlhttp.responseText;
    //     }
    // };
    // xmlhttp.open("GET", "get_class_image.php?ID=" + d.ID, true);
    // xmlhttp.send();

    //var myimage = xmlhttp.responseText;
    getimageclass(d.ID);
    //alert(myimage);
    //alert(ImageClass);
    //ImageClass = unescape(encodeURIComponent(ImageClass.replace(/\s/g, '')));
    //var encoded = window.btoa(ImageClass);
    var mysrc = "data:image/jpeg;base64,base64_encode(" + ImageClass + ")";
    //var mysrc = "data:image/jpeg;base64," + encoded;
    //alert(mysrc);
    //var mysrc = "get_class_image.php?ID="+d.ID;
    return '<table cellpadding="5" cellspacing="0" border="0" width = "80%" style="padding-left:50px;">' +
        '<tbody>' +
        '<tr>' +
        '<td>Class Name:</td>' +
        '<td>' + d.Title + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Image:</td>' +
        //'<td>' + '<img src =' + mysrc + ' width=\"175px\" height=\"175px\" />' + '</td>' +
        '<td>' + ImageClass + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Description Paragraph 1:</td>' +
        '<td>' + d.ParagraphOne + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Description Paragraph 2:</td>' +
        '<td>' + d.ParagraphTwo + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Description Paragraph 3:</td>' +
        '<td>' + d.ParagraphThree + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Maximum Seat Number:</td>' +
        '<td>' + d.MaxSeat + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Price($):</td>' +
        '<td>' + d.Price + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Class Type:</td>' +
        '<td>' + d.ClassType + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Balance Type:</td>' +
        '<td>' + d.BalanceType + '</td>' +
        '</tr>' +
        '<tr>' +
        '<tr>' +
        '<td>Default Teacher</td>' +
        '<td>' + d.DefaultTeacher + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Is Published:</td>' +
        '<td>' + d.IsPublished + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Create Time:</td>' +
        '<td>' + d.CreateTime + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Update Time:</td>' +
        '<td>' + d.UpdateTime + '</td>' +
        '</tr>' +
        '</tbody>' +
        '</table>';
}
//-------end of datatable function-------

$(document).ready(function () {
    // vars
    var $mytable = $("#classtable");

    //-------load datatable-------
    var table = $($mytable).DataTable({
        "ajax": "search_class_datatable.php",
        "columns": [
            {
                "className": 'details-control',
                "orderable": false,
                "data": null,
                "defaultContent": ''
            },
            {"data": "ID"},
            {"data": "Title"},
            {"data": "ClassType"},
            {"data": "BalanceType"},
            {"data": "IsPublished"},
            {"data": "CreateTime"},
            {"data": "Action"}
        ],
        "order": [[1, 'asc']]
    });

    // Add event listener for opening and closing details
    $($mytable).find('tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row(tr);
        var ajaxresult = getimageclass(row.data().ID);

        $.when(ajaxresult).then(function(){
            if (row.child.isShown()) {
                // This row is already open - close it
                row.child.hide();
                tr.removeClass('shown');
            }
            else {
                // Open this row
                row.child(format(row.data())).show();
                tr.addClass('shown');
            }
        })
    });
    //-------end of load datatable-------

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
        var currentmonth = currentdate.getMonth() + 1;
        var $datetime = currentdate.getFullYear() + "-" +
            currentmonth + "-" +
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
                },
                success: function (msg) {
                    alert(msg);
                    $('#loading_div').hide();

                    //to reload datatable
                    table.ajax.reload();
                },
                error: function (xhr) {
                    alert('Ajax request alert');
                    $('#loading_div').hide();
                },
                complete: function () {
                }
            }
        );
    });
    //-------end add row------

    //------- for form --------
    $($add_row).show();

    $('#ShowAddOrEditForm').on('click', function () {
        var addoredit = '#AddOrEdit';
        var showbutton = '#ShowAddOrEditForm';
        if ($(addoredit).is(":visible") === true) {
            $(addoredit).hide();
            $(showbutton).html('Open/Add new payment record');
        } else {
            $(addoredit).show();
            $(showbutton).html('Hide form');
        }
    });

    $('#Close').on('click', function () {
        var addoredit = '#AddOrEdit';
        var showbutton = '#ShowAddOrEditForm';
        $(addoredit).hide();
        $(showbutton).html('Open/Add new payment record');
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

    $('#EditRow').on('click', function () {
        //alert($username);
        var $ID = $("#PaymentID").val();
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
        var currentmonth = currentdate.getMonth() + 1;
        var $datetime = currentdate.getFullYear() + "-" +
            currentmonth + "-" +
            currentdate.getDate() + " " +
            currentdate.getHours() + ":" +
            currentdate.getMinutes() + ":" +
            currentdate.getSeconds();

        //add to database
        $.ajax(
            {
                url: "edit_payment_database.php",
                data: "payername=" + $payername + "&amountdollar=" + $amountdollar + "&cardtype=" + $cardtype +
                "&checkno=" + $checkno + "&iscash=" + $iscash + "&studentname=" + $studentname + "&classID=" +
                $classID + "&receivername=" + $receivername + "&note=" + $note + "&updater=" + $username +
                "&updatetime=" + $datetime + "&ID=" + $ID,
                type: "POST",
                beforeSend: function () {
                    $('#loading_div').show();
                },
                success: function (msg) {
                    alert(msg);
                    $('#loading_div').hide();

                    //to reload datatable
                    table.ajax.reload();

                    //alert success
                    alert('Successfully updated!')
                },
                error: function (xhr) {
                    alert('Ajax request alert');
                    $('#loading_div').hide();
                },
                complete: function () {
                }
            }
        );
        //------- end of for form -------
    });
});