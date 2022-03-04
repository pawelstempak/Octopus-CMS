<?php
$user = new Auth();

##########################################################
################User variables definition#################
##########################################################
if($user->GetUserId())
{
	$stmt=$pdo->query("
							SELECT *
							FROM users
							WHERE id='" . $user->GetUserId() . "'
							");
	$result_login_user=$stmt->fetch();
	$stmt->closeCursor();
	unset($stmt);
	$smarty->assign('signin_user',$result_login_user);
}
##########################################################
###############template folder definition#################
##########################################################

$stmt=$pdo->query("
						SELECT t.folder_name
						FROM  settings s, templates t
						WHERE s.id_templates = t.id_templates and t.type='backend'
						");
$backend_template=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);

##########################################################
##############backend language definition#################
##########################################################

$stmt=$pdo->query("
						SELECT t.code, t.id_language
						FROM  settings s, language t
						WHERE s.id_language = t.id_language and s.type='backend'
						");
$backend_language=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('default_language',$backend_language);

##########################################################
##############frontend language definition################
##########################################################

$stmt=$pdo->query("
						SELECT t.code, t.id_language
						FROM  settings s, language t
						WHERE s.id_language = t.id_language and s.type='frontend'
						");
$frontend_language=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('frontend_language',$frontend_language);


##########################################################
####################backend settings######################
##########################################################

$stmt=$pdo->query("
						SELECT *
						FROM settings
						WHERE type='backend'
						");
$backend_settings=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('backend_settings',$backend_settings);

##########################################################
###################frontend settings######################
##########################################################

$stmt=$pdo->query("
						SELECT *
						FROM settings
						WHERE type='frontend'
						");
$frontend_settings=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('frontend_settings',$frontend_settings);

##########################################################
##################### modules list #######################
##########################################################

$stmt=$pdo->query("
						SELECT *
						FROM modules
						ORDER BY title
						");
$modules=$stmt->fetchAll();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('modules',$modules);
?>