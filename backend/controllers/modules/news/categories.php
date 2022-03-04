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

##########################################################
####################### save category ######################
##########################################################
if($_GET['action']=="save")
{
				$pdo -> exec("
					UPDATE module_cat_news
					SET title = '".$_POST['title']."'
					WHERE id_module_cat_news = '".$_GET['id']."'
				");
}

##########################################################
####################### delete category ######################
##########################################################
if($_GET['action']=="delete")
{
				$pdo -> exec("
					DELETE FROM module_cat_news
					WHERE id_module_cat_news = '".$_GET['id']."'
				");
				header("Location: ".PATH_BACKEND_MODULES.$module['restful_url']."/categories/".$_GET['action_id']);	
}
##########################################################
###################### get category list ####################
##########################################################
$query = "
			SELECT *
			FROM module_cat_news
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
							FROM module_cat_news
							ORDER BY title
							LIMIT ".$backend_settings['pagination'].$offset."
");

$module_news = $stmt->fetchAll();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('module_news',$module_news);
$smarty->assign('pag_numbers',$pag->getPagNumbers());
?>