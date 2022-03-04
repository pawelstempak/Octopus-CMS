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
###################### hide/show page ####################
##########################################################
if($_GET['action']=="show")
{
			$pdo -> exec("
				UPDATE module_news
				SET status = '1'
				WHERE id_module_news = '".$_GET['id']."'
			");
}
if($_GET['action']=="hide")
{
			$pdo -> exec("
				UPDATE module_news
				SET status = '0'
				WHERE id_module_news = '".$_GET['id']."'
			");
}
##########################################################
####################### delete page ######################
##########################################################
if($_GET['action']=="delete")
{
			$pdo -> exec("
				DELETE FROM language_content
				WHERE id_element = '".$_GET['id']."' and element = 'module_news_title' or id_element = '".$_GET['id']."' and element = 'module_news_content'
			");

				$pdo -> exec("
					DELETE FROM module_news
					WHERE id_module_news = '".$_GET['id']."'
				");
				header("Location: ".PATH_BACKEND_MODULES.$module['restful_url']."/start/".$_GET['action_id']);			

}
##########################################################
###################### get pages list ####################
##########################################################
$query = "
			SELECT *
			FROM module_news p, language_content l, language g
			WHERE p.id_module_news = l.id_element and g.id_language = l.id_language and l.element = 'module_news_title' and l.id_language = '".$backend_language['id_language']."'
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
							FROM module_news p, language_content l, language g
							WHERE p.id_module_news = l.id_element and g.id_language = l.id_language and l.element = 'module_news_title' and l.id_language = '".$backend_language['id_language']."'
							ORDER BY l.content
							LIMIT ".$backend_settings['pagination'].$offset."
");

$module_news = $stmt->fetchAll();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('module_news',$module_news);
$smarty->assign('pag_numbers',$pag->getPagNumbers());
?>