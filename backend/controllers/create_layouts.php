<?php
#####################################################################################
##################### Check if user has a right to view this page####################
#####################################################################################
$p = new PageValidation();
if($p->isSuperUser($result_login_user['id']))
{
	if($p->isPageValid($result_login_user['id'],"layouts"))
	{
		header("Location: ".PATH_BACKEND);
	}
}
##########################################################
################default language definition###############
##########################################################

$stmt=$pdo->query("
						SELECT t.id_language, t.title, t.code
						FROM language t
						LEFT JOIN settings s
						ON s.id_language = t.id_language and s.type='frontend'
						ORDER BY type DESC, title ASC
						");
$language_list=$stmt->fetchAll();
$stmt->closeCursor();
unset($stmt);
$smarty->assign("language_list",$language_list);

############# Zapis do MySQL danych kursu ################
if(isset($_POST['save']))
{
		$pdo -> exec("
			INSERT INTO layouts (title, tfile, cfile)
			VALUES ('".$_POST['title']."', '".$_POST['tfile']."', '".$_POST['cfile']."')
		");

		if(isset($_POST['save'])){header("Location: ".PATH_BACKEND."layouts/ok");}

}
#################################################################
?>