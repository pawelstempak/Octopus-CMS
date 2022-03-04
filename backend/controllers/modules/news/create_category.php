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
####################### module info ######################
##########################################################
$stmt = $pdo -> query("
							SELECT title, restful_url
							FROM modules
							WHERE restful_url = '".$_GET['mod']."'
");
$module = $stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('module',$module);

############# Zapis do MySQL danych kursu ################
if(isset($_POST['save']))
{
		$pdo -> exec("
			INSERT INTO module_cat_news (title)
			VALUES ('".$_POST['title']."')
		");
	if(isset($_POST['save'])){header("Location: ".PATH_BACKEND_MODULES.$module['restful_url']."/categories/ok");}

}
#################################################################
?>