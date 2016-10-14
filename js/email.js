/**
 * Created by shidan on 9/28/16.
 */
//global var
var $username;

$(function () {
    $("#navmanagement").addClass("current");
});

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

//------- add class email addresses -------
function AddClassAddress(id){
    //alert(id);
    $.ajax(
        {
            url: "search_class_email_address.php",
            data: "id=" + id,
            type: "POST",
            beforeSend: function () {
                $('#loading_div').show();
            },
            success: function (msg) {
                //alert(msg);
                $SendTo = "#SendTo";
                $($SendTo).val($($SendTo).val()+msg);
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
//------- end of add class email addresses ------

$(document).ready(function () {
    $('#SendFrom').val("STA Manager");
    $('#EmailFrom').val("noreply@STAManager.com");

    //-------- send email -------
    var $SendEmail = $("#SendEmail");
    getusername();

    $($SendEmail).on('click', function () {
        var $SendTo = $("#SendTo").val();
        var $Subject = $("#Subject").val();
        var $EmailContent = $("#EmailContent").val();
        var $SendFrom = $("#SendFrom").val();
        var $EmailFrom = $("#EmailFrom").val();
        //send email via sendemail.php
        $.ajax(
            {
                url: "PHPMailer/sendemail.php",
                data: "SendTo=" + $SendTo + "&Subject=" + $Subject + "&EmailContent=" + $EmailContent +
                "&SendFrom=" + $SendFrom + "&EmailFrom=" + $EmailFrom,
                type: "POST",
                beforeSend: function () {
                    $('#loading_div').show();
                },
                success: function (msg) {
                    alert(msg);
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
    //------- end send email ------

    //------- for email form -------
    $('#Reset').on('click', function () {
        $("#SendTo").val("");
        $("#Subject").val("");
        $("#EmailContent").val("");
        $("#SendFrom").val("STA Manager");
        $('#EmailFrom').val("noreply@STAManager.com")
    });
    //------- end of for email form -------
});