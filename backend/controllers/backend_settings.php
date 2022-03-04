<?php
#####################################################################################
##################### Check if user has a right to view this page####################
#####################################################################################
$p = new PageValidation();
if($p->isSuperUser($result_login_user['id']))
{
	if($p->isPageValid($result_login_user['id'],"backend_settings"))
	{
		header("Location: ".PATH_BACKEND);
	}
}
##########################################################
###############save backend_settings to mysql#############
##########################################################
if($_POST['action']=="save")
{
$session_life_time = $_POST['session_life_time']*60;
$pdo -> exec("
			UPDATE settings
			SET id_language = '".$_POST['language']."', id_templates = '".$_POST['templates']."', session_life_time = '".$session_life_time."', pagination = '".$_POST['pagination']."'
			WHERE type = 'backend'
		");
header("Location: ".PATH_BACKEND."backend_settings/ok");
}

##########################################################
##############backend variables definition################
##########################################################

$stmt=$pdo->query("
						SELECT *
						FROM settings
						WHERE type = 'backend'
						");
$result_page_settings=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('settings',$result_page_settings);

##########################################################
##################define languages list###################
##########################################################

$stmt=$pdo->query("
						SELECT id_language, title, code
						FROM language
						");
foreach($stmt as $row)
{
	$languages[] = $row;
}
$stmt->closeCursor();
unset($stmt);
$smarty->assign('languages',$languages);

##########################################################
##################define templates list###################
##########################################################

$stmt=$pdo->query("
						SELECT id_templates, title
						FROM templates
						WHERE type = 'backend'
						");
foreach($stmt as $row)
{
	$templates[] = $row;
}
$stmt->closeCursor();
unset($stmt);
$smarty->assign('templates',$templates);
?>