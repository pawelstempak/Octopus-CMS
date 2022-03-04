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
################### page static content ##################
##########################################################
$stmt=$pdo->query("
					 	SELECT *
						FROM pages
						WHERE id_pages = '".$_GET['id']."'
						");
$page=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign("page",$page);

##########################################################
######################layout definition###################
##########################################################
$stmt = $pdo -> query("
							SELECT *
							FROM layouts
							ORDER BY title
");

$layouts_list=$stmt->fetchAll();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('layouts_list',$layouts_list);

##########################################################
############## default language definition ###############
##########################################################
isset($_COOKIE['pages_lang'])?$page_lang = $_COOKIE['pages_lang']:$page_lang = $backend_language['id_language'];

##########################################################
################ pages content definition ################
##########################################################
// $stmt = $pdo -> query("
// 							SELECT *
// 							FROM pages p, layouts l, language_content c
// 							WHERE c.id_element = p.id_pages and p.id_layouts = l.id_layouts and c.id_language = '".$backend_language['id_language']."' and p.id_pages = '".$_GET['id']."' and c.element = 'pages_title'
// ");
$stmt = $pdo -> query("
							SELECT *
							FROM layouts l
							JOIN pages p
								USING(id_layouts)
							JOIN language_content c
								ON c.id_element = p.id_pages 
							WHERE c.id_language = '".$page_lang."'
							AND p.id_pages = '".$_GET['id']."'
							AND c.element = 'pages_title'
");

$pages=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('pages',$pages);
if($pages['cfile']!=""){include(ABS_PATH_BACKEND."controllers/layouts/".$pages['cfile']);}
?>