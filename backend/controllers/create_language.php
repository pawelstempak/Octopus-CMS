<?php
#####################################################################################
##################### Check if user has a right to view this page####################
#####################################################################################
$p = new PageValidation();
if($p->isSuperUser($result_login_user['id']))
{
	if($p->isPageValid($result_login_user['id'],"language"))
	{
		header("Location: ".PATH_BACKEND);
	}
}
############# Zapis do MySQL danych kursu ################
if(isset($_POST['save']))
{
		$pdo -> exec("
			INSERT INTO language (title, code)
			VALUES ('".$_POST['title']."', '".$_POST['code']."')
		");
	if(isset($_POST['save'])){header("Location: ".PATH_BACKEND."language/ok");}

}
#################################################################
?>