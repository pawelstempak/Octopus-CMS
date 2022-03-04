<?php
##########################################################
############### page settings definition##################
##########################################################

$stmt=$pdo->query("
						SELECT *
						FROM  settings
						WHERE type='frontend'
						");
$settings=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('settings',$settings);
##########################################################
###############template folder definition#################
##########################################################

$stmt=$pdo->query("
						SELECT t.folder_name
						FROM  settings s, templates t
						WHERE s.id_templates = t.id_templates and t.type='frontend'
						");
$template=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);

##########################################################
##################language definition#####################
##########################################################

$stmt=$pdo->query("
						SELECT *
						FROM language
						");
$language=$stmt->fetchAll();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('language',$language);


##########################################################
###############set language user settings#################
##########################################################
if(isset($_GET['language']))
{
	setcookie('language', $_GET['language'], time() + (86400 * 30), "/");
	header("Location: ".PATH);
}

##########################################################
#################language user settings###################
##########################################################
if(!isset($_COOKIE['language']))
{
	$userLanguage = $settings['id_language'];
}
else
{
	$userLanguage = $_COOKIE['language'];
}
$stmt=$pdo->query("
						SELECT code
						FROM language
						WHERE id_language = '".$userLanguage."'
						");
$lang=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('UserLanguageCode',$lang['code']);
?>