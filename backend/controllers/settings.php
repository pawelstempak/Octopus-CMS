<?php
#####################################################################################
##################### Check if user has a right to view this page####################
#####################################################################################
$p = new PageValidation();
if($p->isSuperUser($result_login_user['id']))
{
	if($p->isPageValid($result_login_user['id'],"settings"))
	{
		header("Location: ".PATH_BACKEND);
	}
}
##########################################################
##################save settings to mysql##################
##########################################################
if($_POST['action']=="save")
{

$pdo -> exec("
			UPDATE settings
			SET title = '".$_POST['title']."', id_language = '".$_POST['language']."', id_templates = '".$_POST['templates']."'
			WHERE type = 'frontend'
		");
header("Location: ".PATH_BACKEND."settings/ok");
}

##########################################################
################page variables definition#################
##########################################################

$stmt=$pdo->query("
						SELECT *
						FROM settings
						WHERE type = 'frontend'
						");
$result_page_settings=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('settings',$result_page_settings);

##########################################################
##################define languages list###################
##########################################################

$stmt=$pdo->query("
						SELECT id_language, title
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
##################define languages list###################
##########################################################

$stmt=$pdo->query("
						SELECT id_templates, title
						FROM templates
						WHERE type = 'frontend'
						");
foreach($stmt as $row)
{
	$templates[] = $row;
}
$stmt->closeCursor();
unset($stmt);
$smarty->assign('templates',$templates);
?>