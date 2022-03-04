<?php
#####################################################################################
##################### Check if user has a right to view this page####################
#####################################################################################
$p = new PageValidation();
if($p->isSuperUser($result_login_user['id']))
{
	if($p->isPageValid($result_login_user['id'],"pages"))
	{
		header("Location: ".PATH_BACKEND);
	}
}
##########################################################
###################### hide/show page ####################
##########################################################
if($_GET['action']=="show")
{
			$pdo -> exec("
				UPDATE pages
				SET status = '1'
				WHERE id_pages = '".$_GET['id']."'
			");
}
if($_GET['action']=="hide")
{
			$pdo -> exec("
				UPDATE pages
				SET status = '0'
				WHERE id_pages = '".$_GET['id']."'
			");
}
##########################################################
####################### delete page ######################
##########################################################
if($_GET['action']=="delete")
{
			$pdo -> exec("
				DELETE FROM pages
				WHERE id_pages = '".$_GET['id']."'
			");

			$pdo -> exec("
				DELETE FROM language_content
				WHERE id_element = '".$_GET['id']."' and element = 'pages_title' or id_element = '".$_GET['id']."' and element = 'pages_content'
			");
}
##########################################################
###################### get pages list ####################
##########################################################
$stmt = $pdo -> query("
							SELECT *
							FROM pages p, language_content l
							WHERE p.id_pages = l.id_element and l.element = 'pages_title' and l.id_language = '".$backend_language['id_language']."'
							ORDER BY l.content
");

$pages_list = $stmt->fetchAll();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('pages_list',$pages_list);
?>