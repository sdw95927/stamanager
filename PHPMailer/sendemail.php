<?php
/**
 * This example shows settings to use when sending via Google's Gmail servers.
 */

//SMTP needs accurate times, and the PHP time zone MUST be set
//This should be done in your php.ini, but this is how to do it if you don't have access to that
date_default_timezone_set('America/Chicago');

require 'PHPMailerAutoload.php';

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

//Whether to use SMTP authentication
//$mail->SMTPAuth = true;

//Username to use for SMTP authentication - use full email address for gmail
//$mail->Username = "testemailaddressforshidan@gmail.com";
$mail->Username = "shidan.wang@utsouthwestern.edu";

//Password to use for SMTP authentication
//$mail->Password = "shidanwangtest";
$mail->Password = "UTsw0927";

//Set who the message is to be sent from
$SendFrom = $_POST['SendFrom'];
$EmailFrom = $_POST['EmailFrom'];
$mail->setFrom($EmailFrom, $SendFrom);

//Set an alternative reply-to address
//$mail->addReplyTo('replyto@example.com', 'First Last');

//Set who the message is to be sent to
//check format
$SendTo = explode(';', $_POST['SendTo']);
$length = count($SendTo);
for($i = 0; $i < $length; $i++){
    if ($SendTo[$i] == "") {
        continue;
    }
    if (strpos($SendTo[$i], "@") == FALSE || strpos($SendTo[$i], ".") == FALSE || (strlen($SendTo[$i]) - strpos($SendTo[$i], "@")) <= 3 ||
        strpos($SendTo[$i], "'") != FALSE
    ) {
        echo "invalid email address!";
        exit;
    }
    if (strlen($SendTo[$i]) > 50) {
        echo "email address to long!";
        exit;
    }
    $mail->addAddress($SendTo[$i]);
}


//Set the subject line
$Subject = $_POST['Subject'];
$mail->Subject = $Subject;

//Read an HTML message body from an external file, convert referenced images to embedded,
//convert HTML into a basic plain-text alternative body
//$mail->msgHTML(file_get_contents('contents.html'), dirname(__FILE__));
$Content = $_POST['EmailContent'];
$mail->msgHTML($Content);
$mail->WordWrap = 100;

//Replace the plain text body with one created manually
//$mail->AltBody = 'This is a plain-text message body';

//Attach an image file
//$mail->addAttachment('images/phpmailer_mini.png');

//send the message, check for errors
if (!$mail->send()) {
    echo "Failed to send email with error:".$mail->ErrorInfo;
    exit;
} else {
    echo "Successfully send the email to ".$length. "receiver(s)!";
    exit;
}
?>