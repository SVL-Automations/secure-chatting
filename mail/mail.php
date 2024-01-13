<?php
require('PHPMailer.php');
require('SMTP.php');
require('Exception.php');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;


function mailsend($email, $body, $subject, $project, $filenames = NULL)
{
	$mail = new PHPMailer();

	$mail->IsSMTP();                                      	// set mailer to use SMTP
	$mail->CharSet = 'UTF-8';
	$mail->Host = "smtp.hostinger.in";  					// specify main and backup server
	$mail->SMTPAuth = true;    	 							// turn on SMTP authentication
	$mail->Username = "securechat@svlpro.online";  	// SMTP username
	$mail->Password = "password";						// SMTP password
	$mail->SMTPSecure = 'ssl';                              //Enable implicit TLS encryption
	$mail->Port       = 465;
	$mail->From = "securechat@svlpro.online";
	$mail->FromName = $project;
	$mail->addReplyTo("securechat@svlpro.online");
	$mail->AddAddress($email);

	if ($filenames != NULL) {
		foreach ($filenames as $file) {
			$mail->addAttachment($file);
		}
	}
	$mail->WordWrap = 50;                                 // set word wrap to 50 character
	$mail->IsHTML(true);                                  // set email format to HTML

	$mail->Subject = $subject;
	$mail->Body    = $body;
	$mail->AltBody = "This is the body in plain text for non-HTML mail clients";

	if (!$mail->Send()) {
		return "Fail";
	} else {
		return "Success";
	}
}
