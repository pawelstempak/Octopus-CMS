<?php
#####################################################################################
##################### Check if user has a right to view this page####################
#####################################################################################
$p = new PageValidation();
if($p->isSuperUser($result_login_user['id']))
{
	if($p->isPageValid($result_login_user['id'],"backend_users"))
	{
		header("Location: ".PATH_BACKEND);
	}
}
############# Zapis do MySQL danych kursu ################
if(isset($_POST['save']))
{
	if(isset($_POST['menus'])){$menus = 1;}else{$menus = 0;}
	if(isset($_POST['pages'])){$pages = 1;}else{$pages = 0;}
	if(isset($_POST['layouts'])){$layouts = 1;}else{$layouts = 0;}
	if(isset($_POST['modules'])){$modules = 1;}else{$modules = 0;}
	if(isset($_POST['widgets'])){$widgets = 1;}else{$widgets = 0;}
	if(isset($_POST['backend_users'])){$backend_users = 1;}else{$backend_users = 0;}
	if(isset($_POST['templates'])){$templates = 1;}else{$templates = 0;}
	if(isset($_POST['language'])){$language = 1;}else{$language = 0;}
	if(isset($_POST['settings'])){$settings = 1;}else{$settings = 0;}
	if(isset($_POST['backend_settings'])){$backend_settings = 1;}else{$backend_settings = 0;}

	$pdo -> exec("
				INSERT INTO users_groups (
												  title,
												  menus,
												  pages,
												  layouts,
												  modules,
												  widgets,
												  backend_users,
												  templates,
												  language,
												  settings,
												  backend_settings
												 )
			VALUES (
					 '".$_POST['title']."',
					 '".$menus."',
					 '".$pages."',
					 '".$layouts."',
					 '".$modules."',
					 '".$widgets."',
					 '".$backend_users."',
					 '".$templates."',
					 '".$language."',
					 '".$settings."',
					 '".$backend_settings."'
					 )
	");
	if(isset($_POST['save'])){header("Location: ".PATH_BACKEND."backend_users_groups/ok");}

}
#################################################################
?>