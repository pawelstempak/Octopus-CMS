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
################# delete from menus table ################
##########################################################
if($_GET['action']=="delete") {
				$pdo -> exec("
								DELETE FROM modules
								WHERE id_modules = '".$_GET['id']."'
								");
								!empty($_GET['action_id'])?$id="/".$_GET['action_id']:$id="";
								header("Location: ".PATH_BACKEND."modules/ok".$id);
}

##########################################################
################### get modules list #####################
##########################################################
$query = "
			SELECT *
			FROM modules
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
							FROM modules
							ORDER BY title
							LIMIT ".$backend_settings['pagination'].$offset."
");

foreach($stmt as $row)
{
	$modules_list[] = $row;
}
$stmt->closeCursor();
unset($stmt);
$smarty->assign('modules_list',$modules_list);
$smarty->assign('pag_numbers',$pag->getPagNumbers());
?>