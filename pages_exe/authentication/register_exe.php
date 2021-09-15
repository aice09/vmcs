<?php
//Import PHPMailer classes into the global namespace
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

include '../../environment.php';
include '../../config/database.php';

if (isset($_POST['submit_btn'])) {

    // Get data from the form
    $user_email = $_POST['user_email'];

    //Verify email if already exist
    $sql = "SELECT useremail FROM users WHERE useremail = '$user_email'";    
    $query=mysqli_query($db,$sql);
    $totalData=mysqli_num_rows($query);

    $data=array();
    if($totalData > 0) {
        $data['message'] = "Email already exist";
        $data['code'] = "exist";      

    } else {
        $data['message'] = "Email available";
        $data['code'] = "available";
        /* $mail = new PHPMailer(true);
        //Send email via php mailer
        //Server settings
        $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
        $mail->isSMTP();                                            //Send using SMTP
        $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
        $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
        $mail->Username   = 'ragayveterinaryhealthcenter@gmail.com';                     //SMTP username
        $mail->Password   = 'Zaq1Xsw2++';                               //SMTP password
        //$mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

        //Recipients
        $mail->setFrom('ragayveterinaryhealthcenter@gmail.com', 'Ragay Veterinary Health Center');
        //$mail->addAddress('joe@example.net', 'Joe User');     //Add a recipient
        $mail->addAddress($user_email);               //Name is optional
        $mail->addReplyTo('ragayveterinaryhealthcenter@gmail.com', 'Ragay Veterinary Health Center');

         // Setting the email content
        $mail->IsHTML(true);
        $mail->Subject = "Email verification";
        $mail->Body = "<html>
        <head>
        <title>Email verification</title>
        </head>
        <body>
        <p>Hi,</p>
        <p>Thank you for registering with us. Please click on the link below to verify your email address.</p>
        <p><a href='http://localhost/php_project/pages/authentication/verify_email.php?email=$user_email'>Verify Email</a></p>
        <p>Thank you,</p>
        <p>Team</p>
        </body>
        </html>";
        $mail->AltBody = 'Hi, Thank you, Thank you for registering with us. Please click on the link below to verify your email address. http://localhost/php_project/pages/authentication/verify_email.php?email=$user_email Verify Email Thank you,Team';

        $mail->send(); */


            //Create a new PHPMailer instance
$mail = new PHPMailer();

//Tell PHPMailer to use SMTP
$mail->isSMTP();

//Enable SMTP debugging
//SMTP::DEBUG_OFF = off (for production use)
//SMTP::DEBUG_CLIENT = client messages
//SMTP::DEBUG_SERVER = client and server messages
$mail->SMTPDebug = SMTP::DEBUG_OFF;

//Set the hostname of the mail server
$mail->Host = 'smtp.gmail.com';
//Use `$mail->Host = gethostbyname('smtp.gmail.com');`
//if your network does not support SMTP over IPv6,
//though this may cause issues with TLS

//Set the SMTP port number:
// - 465 for SMTP with implicit TLS, a.k.a. RFC8314 SMTPS or
// - 587 for SMTP+STARTTLS
$mail->Port = 465;

//Set the encryption mechanism to use:
// - SMTPS (implicit TLS on port 465) or
// - STARTTLS (explicit TLS on port 587)
$mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;

//Whether to use SMTP authentication
$mail->SMTPAuth = true;

//Username to use for SMTP authentication - use full email address for gmail
$mail->Username = 'ragayveterinaryhealthcenter@gmail.com';

//Password to use for SMTP authentication
$mail->Password = 'Zaq1Xsw2++';

//Set who the message is to be sent from
//Note that with gmail you can only use your account address (same as `Username`)
//or predefined aliases that you have configured within your account.
//Do not use user-submitted addresses in here
$mail->setFrom('ragayveterinaryhealthcenter@gmail.com', 'First Last');

//Set an alternative reply-to address
//This is a good place to put user-submitted addresses
$mail->addReplyTo('ragayveterinaryhealthcenter@gmail.com', 'First Last');

//Set who the message is to be sent to
$mail->addAddress('carlangelopamparonievarez@gmail.com', 'John Doe');

//Set the subject line
$mail->Subject = 'PHPMailer GMail SMTP test';

//Read an HTML message body from an external file, convert referenced images to embedded,
//convert HTML into a basic plain-text alternative body
$mail->msgHTML("<html><head><title>Email verification</title></head><body><p>Hi,</p><p>Thank you for registering with us. Please click on the link below to verify your email address.</p><p><a href='http://localhost/php_project/pages/authentication/verify_email.php?email=$user_email'>Verify Email</a></p><p>Thank you,</p><p>Team</p></body></html>");

//Replace the plain text body with one created manually
$mail->AltBody = 'This is a plain-text message body';

//Attach an image file
//$mail->addAttachment('images/phpmailer_mini.png');

//send the message, check for errors
if (!$mail->send()) {
    echo 'Mailer Error: ' . $mail->ErrorInfo;
} else {
    echo 'Message sent!';
    $data['mailstatus']= "Email message sent.";

    //Section 2: IMAP
    //Uncomment these to save your message in the 'Sent Mail' folder.
    #if (save_mail($mail)) {
    #    echo "Message saved!";
    #}
}


        
    }
    
    echo json_encode($data);   
}
?>