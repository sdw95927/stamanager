/**
 * Created by shidan on 9/28/16.
 */
//global var
var $username;
var ImageClass;
var ImageToUpload;

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

//------- transfer image data to blob -------
// function dataURItoBlob(dataURI) {
//     // convert base64/URLEncoded data component to raw binary data held in a string
//     var byteString;
//     if (dataURI.split(',')[0].indexOf('base64') >= 0)
//         byteString = atob(dataURI.split(',')[1]);
//     else
//         byteString = unescape(dataURI.split(',')[1]);
//
//     // separate out the mime component
//     var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
//
//     // write the bytes of the string to a typed array
//     var ia = new Uint8Array(byteString.length);
//     for (var i = 0; i < byteString.length; i++) {
//         ia[i] = byteString.charCodeAt(i);
//     }
//
//     return new Blob([ia], {type:mimeString});
// }
// 作者：陈兆龙
// 链接：https://www.zhihu.com/question/31588622/answer/52792556
//     来源：知乎
// 著作权归作者所有，转载请联系作者获得授权。
// var convertImgDataToBlob = function (base64Data) {
//     var format = "image/jpeg";
//     var base64 = base64Data;
//     var code = window.atob(base64.split(",")[1]);
//     var aBuffer = new window.ArrayBuffer(code.length);
//     var uBuffer = new window.Uint8Array(aBuffer);
//     for(var i = 0; i < code.length; i++){
//         uBuffer[i] = code.charCodeAt(i) & 0xff ;
//     }
//     console.info([aBuffer]);
//     console.info(uBuffer);
//     console.info(uBuffer.buffer);
//     console.info(uBuffer.buffer==aBuffer); //true
//
//     var blob=null;
//     try{
//         blob = new Blob([uBuffer], {type : format});
//     }
//     catch(e){
//         window.BlobBuilder = window.BlobBuilder ||
//             window.WebKitBlobBuilder ||
//             window.MozBlobBuilder ||
//             window.MSBlobBuilder;
//         if(e.name == 'TypeError' && window.BlobBuilder){
//             var bb = new window.BlobBuilder();
//             bb.append(uBuffer.buffer);
//             blob = bb.getBlob("image/jpeg");
//
//         }
//         else if(e.name == "InvalidStateError"){
//             blob = new Blob([aBuffer], {type : format});
//         }
//         else{
//
//         }
//     }
//     alert(blob.size);
//     return blob;
// };

//------- for editing form -------
function EnableEditing(id) {
    $.ajax(
        {
            url: "search_class_datatable.php",
            data: "ID=" + id,
            type: "POST",
            beforeSend: function () {
                $('#loading_div').show();
            },
            success: function (msg) {
                var result = msg.split("&&");

                $("#ID").val(id);
                $("#OldID").val(id);
                //0: Title
                //1: Image (no image uploaded yet)
                //2: ParagraphOne
                //3: ParagraphTwo
                //4: ParagraphThree
                //5: MaxSeat
                //6: DueRegister
                //7: Price
                //8: ClassType
                //9: BalanceType
                //10: DefaultTeacher
                //11: IsPublished
                $("#Title").val(result[0]);
                $("#ParagraphOne").val(result[2]);
                $("#ParagraphTwo").val(result[3]);
                $("#ParagraphThree").val(result[4]);
                $("#MaxSeat").val(result[5]);
                $("#DueRegisterYear").val(result[6].split("-")[0]);
                $("#DueRegisterMonth").val(result[6].split("-")[1]);
                $("#DueRegisterDay").val(result[6].split("-")[2]);
                $("#Price").val(result[7]);
                document.getElementById("SelectClassType").value = result[8];
                document.getElementById("SelectBalanceType").value = result[9];
                $("#DefaultTeacher").val(result[10]);

                var mysrc = "data:image/jpeg;base64," + result[1];
                var img = document.querySelector("#UploadedImage");
                img.src = mysrc;
                ImageToUpload = result[1];

                var IsPublished = document.getElementsByName("IsPublished");
                if (result[11]) {
                    IsPublished[0].checked = false;
                    IsPublished[1].checked = true;
                } else {
                    IsPublished[1].checked = false;
                    IsPublished[0].checked = true;
                }

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

//------- preview image -------
function PreviewImage() {
    var file = document.getElementById("UploadImage").files[0];
    var img = document.querySelector("#UploadedImage");

    var reader = new FileReader();
    //var reader1 = new FileReader();

    reader.addEventListener("load", function () {
        //alert("this is in preview function"+reader.result);
        img.src = reader.result;
        ImageToUpload = reader.result.split(",")[1];
    }, false);

    // reader1.addEventListener("load", function () {
    //     alert("this is in load reader function"+reader1.result);
    //     ImageToUpload = reader1.result;
    // }, false);

    if (file) {
        reader.readAsDataURL(file);
        //reader1.readAsBinaryString(file);
    }
    //
    // if (!ImageToUpload.files[0]){
    //     alert("no image uploaded");
    // }else{
    //     var file = ImageToUpload.files.item(0).getAsBinary();
    //
    // }
    // img.src = ;
    // img.width = 175;
    // img.height = 175;
    // img.alt = "no image uploaded";
}
//------- end of preview image ------

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
        '<td>Register Due Date:</td>' +
        '<td>' + d.DueRegister + '</td>' +
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
            {
                "data": "Action",
                "orderable": false
            }
        ],
        "order": [[1, 'asc']]
    });

    // Add event listener for opening and closing details
    $($mytable).find('tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row(tr);
        var ajaxresult = getimageclass(row.data().ID);

        $.when(ajaxresult).then(function () {
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
    //getusername();

    $($add_row).on('click', function () {
        //alert($username);
        var $ID = $("#ID").val();
        var $Title = $("#Title").val();
        var $ClassType = $("select[name=ClassType]").val();
        var $BalanceType = $("select[name=BalanceType]").val();

        //for image
        // var file = document.getElementById("UploadImage").files[0];
        // var reader  = new FileReader();
        // reader.addEventListener("load", function () {
        //     alert("this is in preview function"+reader.result);
        //     ImageToUpload = reader.result;
        // }, false);
        // reader.onload = function(){
        //     alert("this is in onload function"+reader.result);
        //     //alert("this is in onload function"+file.content);
        //     //alert("this is in onload function"+reader);
        //     ImageToUpload = reader.result;
        // };
        // reader.readAsBinaryString(file);

        // alert("mioaji");
        //reader.readAsDataURL(file);
        // if (file) {
        //     alert("this is in main function"+file);
        //     //alert("this is in main function"+reader.result);
        //     //alert("this is in main function"+reader);
        // }
        // alert("miaoji");
        // var $Image = reader.result;
        // ImageToUpload = convertImgDataToBlob(file);
        // var ImageBlob = new Blob([file], { type: "image/png" });
        // ImageToUpload = ImageBlob;
        ImageToUpload = encodeURIComponent(ImageToUpload);

        var $IsPublished = $("input[name=IsPublished]:checked").val();
        var $ParagraphOne = $("#ParagraphOne").val();
        var $ParagraphTwo = $("#ParagraphTwo").val();
        var $ParagraphThree = $("#ParagraphThree").val();
        var $MaxSeat = $("#MaxSeat").val();
        var $DueRegister = $("#DueRegisterYear").val() + "-" + $("#DueRegisterMonth").val() + "-" + $("#DueRegisterDay").val();
        var $Price = $("#Price").val();
        var $DefaultTeacher = $("#DefaultTeacher").val();
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
                url: "insert_class_database.php",
                data: "ID=" + $ID + "&Title=" + $Title + "&ClassType=" + $ClassType +
                "&BalanceType=" + $BalanceType + "&Image=" + ImageToUpload + "&IsPublished=" + $IsPublished + "&ParagraphOne=" +
                $ParagraphOne + "&ParagraphTwo=" + $ParagraphTwo + "&ParagraphThree=" + $ParagraphThree + "&MaxSeat=" +
                $MaxSeat + "&DueRegister=" + $DueRegister + "&Price=" + $Price + "&DefaultTeacher=" + $DefaultTeacher +
                "&CreateTime=" + $datetime + "&UpdateTime=" + $datetime,
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

    $('#Reset').on('click', function () {
        $("#ID").val("");
        $("#OldID").val("");
        $("#Title").val("");
        $("#ParagraphOne").val("");
        $("#ParagraphTwo").val("");
        $("#ParagraphThree").val("");
        $("#MaxSeat").val("");
        $("#DueRegisterYear").val("");
        $("#DueRegisterMonth").val("");
        $("#DueRegisterDay").val("");
        $("#Price").val("");
        $("select[ID=SelectClassType]").val("");
        $("select[ID=SelectBalanceType]").val("");
        $("#DefaultTeacher").val("");

        //var img = document.querySelector("#UploadedImage");
        //var img = document.getElementById("UploadedImage");
        //img.src = "";
        //img.removeAttr('src');
        $("#UploadedImage").removeAttr('src');
        var img = document.querySelector("#UploadedImage");
        img.src = "?123"; //force refresh image cache
        ImageToUpload = "";
        $("#UploadImage").val("");

        var IsPublished = document.getElementsByName("IsPublished");
        IsPublished[0].checked = true;
        IsPublished[1].checked = false;

        $("#EditRow").hide();
        $("#addRow").show();

        var AddOrEdit = "#AddOrEdit";
        $(AddOrEdit).hide();
        $(AddOrEdit).show();
    });

    $('#EditRow').on('click', function () {
        var $ID = $("#ID").val();
        var $OldID = $("#OldID").val();
        var $Title = $("#Title").val();
        var $ClassType = $("select[name=ClassType]").val();
        var $BalanceType = $("select[name=BalanceType]").val();
        ImageToUpload = encodeURIComponent(ImageToUpload);
        var $IsPublished = $("input[name=IsPublished]:checked").val();
        var $ParagraphOne = $("#ParagraphOne").val();
        var $ParagraphTwo = $("#ParagraphTwo").val();
        var $ParagraphThree = $("#ParagraphThree").val();
        var $MaxSeat = $("#MaxSeat").val();
        var $DueRegister = $("#DueRegisterYear").val() + "-" + $("#DueRegisterMonth").val() + "-" + $("#DueRegisterDay").val();
        var $Price = $("#Price").val();
        var $DefaultTeacher = $("#DefaultTeacher").val();
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
                url: "edit_class_database.php",
                data: "ID=" + $ID + "&Title=" + $Title + "&ClassType=" + $ClassType +
                "&BalanceType=" + $BalanceType + "&Image=" + ImageToUpload + "&IsPublished=" + $IsPublished + "&ParagraphOne=" +
                $ParagraphOne + "&ParagraphTwo=" + $ParagraphTwo + "&ParagraphThree=" + $ParagraphThree + "&MaxSeat=" +
                $MaxSeat + "&DueRegister=" + $DueRegister + "&Price=" + $Price + "&DefaultTeacher=" + $DefaultTeacher +
                "&UpdateTime=" + $datetime + "&OldID=" + $OldID,
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
    });
    //------- end of for form -------

    //------- for publish class -------
    //var publish = "td.publish";
    $(document).on('click', '.publish', function () {
        var tr = $(this).closest('tr');
        //alert(tr);
        var row = table.row(tr);
        id = row.data().ID;
        //alert(id);
        $.ajax(
            {
                url: "publish_class_database.php",
                data: "ID=" + id,
                type: "POST",
                beforeSend: function () {
                    $('#loading_div').show();
                },
                success: function (msg) {
                    alert(msg);
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
    });
    //------- end of publish class -------
});