<?php	
	if(empty($_POST['textarea_389']))
	{
		return false;
	}
	
	$textarea_389 = $_POST['textarea_389'];
	
	$to = 'receiver@yoursite.com'; // Email submissions are sent to this email

	// Create email	
	$email_subject = "Message from StaffManBlocs.";
	$email_body = "You have received a new message. \n\n".
				  "Textarea_389: $textarea_389 \n";
	$headers = "From: contact@yoursite.com\n";
	$headers .= "Reply-To: DoNotReply@yoursite.com";	
	
	mail($to,$email_subject,$email_body,$headers); // Post message
	return true;			
?>