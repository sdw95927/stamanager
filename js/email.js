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
function AddClassAddress(id) {
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
                $($SendTo).val($($SendTo).val() + msg);
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

//------- autocomplete for #SendTo ------
$(function () {
    function split(val) {
        return val.split(/;\s*/);
    }

    function extractLast(term) {
        return split(term).pop();
    }

    $("#SendTo")
    // don't navigate away from the field on tab when selecting an item
        .on("keydown", function (event) {
            if (event.keyCode === $.ui.keyCode.TAB &&
                $(this).autocomplete("instance").menu.active) {
                event.preventDefault();
            }
        })
        .autocomplete({
            minLength: 0,
            source: function (request, response) {
                $.ajax({
                    url: "search_people_email_database.php",
                    dataType: "json",
                    success: function (data) {
                        // delegate back to autocomplete, but extract the last term
                        response($.ui.autocomplete.filter(
                            data, extractLast(request.term)));
                    }
                });
            },
            focus: function () {
                // prevent value inserted on focus
                return true;
            },
            select: function (event, ui) {
                var terms = split(this.value);
                // remove the current input
                terms.pop();
                // add the selected item
                terms.push(ui.item.value);
                // add placeholder to get the comma-and-space at the end
                terms.push("");
                this.value = terms.join(";");
                return false;
            }
        });
});
//------- end of autocomplete for #SendTo -------

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
        $("select[ID=SelectClass]").val("");
        $("#SendTo").val("");
        $("#Subject").val("");
        $("#EmailContent").val("");
        $("#SendFrom").val("STA Manager");
        $('#EmailFrom').val("noreply@STAManager.com")
    });
    //------- end of for email form -------
});