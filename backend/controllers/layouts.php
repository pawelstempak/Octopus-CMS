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

############# Zapis do MySQL danych j&#40569;ka ################
if($_GET['action']=="save")
{
$pdo -> exec("
			UPDATE layouts
			SET title = '".$_POST['title']."', tfile = '".$_POST['tfile']."', cfile = '".$_POST['cfile']."'
			WHERE id_layouts = '".$_GET['id']."'
		");

header("Location: ".PATH_BACKEND."layouts/ok");
}
#################################################################

################## DELETE LAYOUT FROM MYSQL #####################
if($_GET['action']=="delete")
{
$pdo -> exec("
			DELETE FROM layouts
			WHERE id_layouts = '".$_GET['id']."'
		");

		!empty($_GET['action_id'])?$id="/".$_GET['action_id']:$id="";
		header("Location: ".PATH_BACKEND."layouts/ok".$id);
}
#################################################################

##########################################################
#################### get layouts list ####################
##########################################################
$query = "
			SELECT *
			FROM layouts
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
							FROM layouts
							ORDER BY title
							LIMIT ".$backend_settings['pagination'].$offset."
");

foreach($stmt as $row)
{
	$layouts_list[] = $row;
}
$stmt->closeCursor();
unset($stmt);
$smarty->assign('layouts_list',$layouts_list);
$smarty->assign('pag_numbers',$pag->getPagNumbers());
?>