<?php
#####################################################################################
##################### Check if user has a right to view this page####################
#####################################################################################
$p = new PageValidation();
if($p->isSuperUser($result_login_user['id']))
{
	if($p->isPageValid($result_login_user['id'],"modules"))
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
		$safe_module_name = SafeModuleName($_POST['title']);

		$pdo -> exec("
			INSERT INTO modules (title, restful_url)
			VALUES ('".$_POST['title']."', '".$safe_module_name."')
		");

		if($_POST['layout']=="1")
		{
			$pdo -> exec("
				INSERT INTO layouts (title, tfile, cfile)
				VALUES ('".$_POST['title']." - moduł', '".$safe_module_name.".tpl', '".$safe_module_name.".php')
			");
		}

	header("Location: ".PATH_BACKEND."modules/ok");

}
#################################################################
?>