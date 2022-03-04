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
				WHERE id_pages = '".$_GET['action_id']."'
			");
}
if($_GET['action']=="hide")
{
			$pdo -> exec("
				UPDATE pages
				SET status = '0'
				WHERE id_pages = '".$_GET['action_id']."'
			");
}
##########################################################
####################### delete page ######################
##########################################################
if($_GET['action']=="delete")
{
			$pdo -> exec("
				DELETE FROM language_content
				WHERE id_element = '".$_GET['id']."' and element = 'pages_title' or id_element = '".$_GET['id']."' and element = 'pages_content'
			");

			$stmt = $pdo -> query("
										SELECT COUNT(*) as elements
										FROM language_content
										WHERE id_element = '".$_GET['id']."' and element = 'pages_title'
			");
			$if_exist = $stmt->fetch();
			unset($stmt);
			if($if_exist['elements']==0)
			{
				$pdo -> exec("
					DELETE FROM pages
					WHERE id_pages = '".$_GET['id']."'
				");
			}
			!empty($_GET['action_id'])?$id="/".$_GET['action_id']:$id="";
			header("Location: ".PATH_BACKEND."pages".$id);
}
##########################################################
###################### get pages list ####################
##########################################################
$query = "
			SELECT p.id_pages, p.status, l.id_language, l.code, lc.content, lc.id_language_content, lc.id_element
			FROM pages p
			JOIN language_content lc
				ON p.id_pages = lc.id_element
			JOIN language l
				ON l.id_language = lc.id_language
			WHERE lc.element = 'pages_title'
			AND lc.id_language = '".$backend_language['id_language']."'
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
							SELECT p.id_pages, p.status, l.id_language, l.code, lc.content, lc.id_language_content, lc.id_element
							FROM pages p
							JOIN language_content lc
								ON p.id_pages = lc.id_element
							JOIN language l
								ON l.id_language = lc.id_language
							WHERE lc.element = 'pages_title'
							AND lc.id_language = '".$backend_language['id_language']."'
							ORDER BY lc.content
							LIMIT ".$backend_settings['pagination'].$offset."
");

$pages_list = $stmt->fetchAll();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('pages_list',$pages_list);
$smarty->assign('pag_numbers',$pag->getPagNumbers());
?>