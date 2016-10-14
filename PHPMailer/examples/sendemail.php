<?php
/**
 * This example shows settings to use when sending via Google's Gmail servers.
 */

//SMTP needs accurate times, and the PHP time zone MUST be set
//This should be done in your php.ini, but this is how to do it if you don't have access to that
date_default_timezone_set('America/Chicago');

require '../PHPMailerAutoload.php';

//Create a new PHPMailer instance
$mail = new PHPMailer;

//Tell PHPMailer to use SMTP
$mail->isSMTP();

//Enable SMTP debugging
// 0 = off (for production use)
// 1 = client messages
// 2 = client and server messages
$mail->SMTPDebug = 2;

//Ask for HTML-friendly debug output
$mail->Debugoutput = 'html';

//Set the hostname of the mail server
$mail->Host = 'smtp.swmed.edu';
// use
// $mail->Host = gethostbyname('smtp.gmail.com');
// if your network does not support SMTP over IPv6

//Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
$mail->Port = 587;

//Set the encryption system to use - ssl (deprecated) or tls
$mail->SMTPSecure = 'tls';

//Whether to use SMTP authentication
$mail->SMTPAuth = true;

//Username to use for SMTP authentication - use full email address for gmail
//$mail->Username = "testemailaddressforshidan@gmail.com";
$mail->Username = "shidan.wang@utsouthwestern.edu";

//Password to use for SMTP authentication
//$mail->Password = "shidanwangtest";
$mail->Password = "UTsw0927";

//Set who the message is to be sent from
$SendFrom = $_POST['SendFrom'];
$mail->setFrom('testemailaddressforshidan@gmail.com', $SendFrom);

//Set an alternative reply-to address
//$mail->addReplyTo('replyto@example.com', 'First Last');

//Set who the message is to be sent to
//check format
$SendTo = $_POST['SendTo'];
if ($SendTo == "") {
    echo "please input receiver email address!";
    exit;
}
if (strpos($SendTo, "@") == FALSE || strpos($SendTo, ".") == FALSE || (strlen($SendTo) - strpos($SendTo, "@")) <= 3 ||
    strpos($SendTo, "'") != FALSE
) {
    echo "invalid email address!";
    exit;
}
if (strlen($SendTo) > 50) {
    echo "email address to long!";
    exit;
}
$mail->addAddress($SendTo);

//Set the subject line
$Subject = $_POST['Subject'];
$mail->Subject = $Subject;

//Read an HTML message body from an external file, convert referenced images to embedded,
//convert HTML into a basic plain-text alternative body
//$mail->msgHTML(file_get_contents('contents.html'), dirname(__FILE__));
$Content = $_POST['EmailContent'];
$mail->msgHTML($Content);

//Replace the plain text body with one created manually
//$mail->AltBody = 'This is a plain-text message body';

//Attach an image file
//$mail->addAttachment('images/phpmailer_mini.png');

//send the message, check for errors
if (!$mail->send()) {
    echo "Failed to send email with error:".$mail->ErrorInfo;
    exit;
} else {
    echo "Successfully send the email!";
    exit;
}
?>