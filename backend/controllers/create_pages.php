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
############## default language definition ###############
##########################################################
if(isset($_POST['layouts_id']))
{
	$stmt = $pdo -> query("
							SELECT *
							FROM layouts
							WHERE id_layouts = '".$_POST['layouts_id']."'
	");
	$layout=$stmt->fetch();
	$stmt->closeCursor();
	unset($stmt);
	$smarty->assign('layout',$layout);
	include(ABS_PATH_BACKEND."controllers/layouts/".$layout['cfile']);
}
?>