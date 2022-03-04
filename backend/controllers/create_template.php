<?php
#####################################################################################
##################### Check if user has a right to view this page####################
#####################################################################################
$p = new PageValidation();
if($p->isSuperUser($result_login_user['id']))
{
	if($p->isPageValid($result_login_user['id'],"templates"))
	{
		header("Location: ".PATH_BACKEND);
	}
}
############# Zapis do MySQL danych kursu ################
if(isset($_POST['save']))
{
		$pdo -> exec("
			INSERT INTO templates (title, folder_name, description, type)
			VALUES ('".$_POST['title']."', '".$_POST['folder_name']."', '".$_POST['description']."', 'frontend')
		");
	if(isset($_POST['save'])){header("Location: ".PATH_BACKEND."templates/ok");}

}
#################################################################
?>