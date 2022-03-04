<?php
	$page_title = $page->getPageContent('pages_title',$route['id_pages'],$userLanguage);
	$smarty->assign('title',$page_title);

	$page_content = $page->getPageContent('pages_content',$route['id_pages'],$userLanguage);
	$smarty->assign('content',$page_content);
	if(isset($_POST['action']))
	{
							$headers = "MIME-Version: 1.0" . "\n";
							$header .= "Content-Type:".' text/html;charset="UTF-8"'."\n";
						   $header .= "From: <contact_form@company.com> Formularz kontaktowy \n";
							$header .= "Reply-to: <".$_POST['email']."> ".$_POST['name']." \n";
						   $to = "contact@company.com";
						   $subject = "Contact form question";
						   $message = "
							<html>
								<head>
								  <title>Contact form</title>
								</head>
								<body>
								  <p style=\"font-size:16px\">Contact form</p>
								  <table>
								    <tr>
								      <td>Name:</td><td>".$_POST['name']."</td>
								    </tr>
								    <tr>
								      <td>Phone number:</td><td>".$_POST['tel']."</td>
								    </tr>
								    <tr>
								      <td>E-mail:</td><td>".$_POST['email']."</td>
								    </tr>
								    <tr>
								      <td>Question:</td><td>".nl2br($_POST['tresc'])."</td>
								    </tr>
								  </table>
								</body>
							</html>
							";
						   mail($to, $subject, $message, $header);
	}
?>