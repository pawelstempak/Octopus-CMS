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
###############################################################
################### Save form data to MySQL ###################
###############################################################
if($_GET['action']=="save")
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
				UPDATE users_groups
				SET title = '".$_POST['title']."',
					menus = '".$menus."',
					pages = '".$pages."',
					layouts = '".$layouts."',
					modules = '".$modules."',
					widgets = '".$widgets."',
					backend_users = '".$backend_users."',
					templates = '".$templates."',
					language = '".$language."',
					settings = '".$settings."',
					backend_settings = '".$backend_settings."'
					WHERE id_users_groups = '".$_GET['id']."'
	");

header("Location: ".PATH_BACKEND."backend_users_groups/ok");
}

#####################################################################################
############################### Delete users group ##################################
#####################################################################################
if($_GET['action']=="delete") {
	$pdo -> exec("
					DELETE FROM users_groups
					WHERE id_users_groups = '".$_GET['id']."'
					");
!empty($_GET['action_id'])?$id="/".$_GET['action_id']:$id="";
header("Location: ".PATH_BACKEND."backend_users_groups/ok".$id);		
}

#####################################################################################
####### Downloading the list of user groups from MySQL and sending to SMARTY  #######
#####################################################################################
$query = "
			SELECT *
			FROM users_groups
		";

$pag = new Pagination($backend_settings['pagination'],$query);
$page_number = $_GET['id'];
if($page_number>1)
{
	$offset = $backend_settings['pagination']*($page_number-1);
	$offset = " OFFSET ".$offset;
}
else
{
	$offset = "";
}

$stmt = $pdo -> query("
							SELECT *
							FROM users_groups
							ORDER BY title
							LIMIT ".$backend_settings['pagination'].$offset."
");

foreach($stmt as $row)
{
	$backend_users_group_list[] = $row;
}
$stmt->closeCursor();
unset($stmt);
$smarty->assign('backend_users_group_list',$backend_users_group_list);
$smarty->assign('pag_numbers',$pag->getPagNumbers());
?>