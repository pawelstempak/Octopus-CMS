<?php
#####################################################################################
##################### Check if user has a right to view this page####################
#####################################################################################
$p = new PageValidation();
if($p->isSuperUser($result_login_user['id']))
{
	if($p->isPageValid($result_login_user['id'],"menus"))
	{
		header("Location: ".PATH_BACKEND);
	}
}

function smarty_function_check_max($params)
{
	global $pdo;
		$stmt=$pdo->query("
								SELECT id_menu, sort
								FROM menus
								WHERE type = '".$params['type']."' and parent_id = '".$params['parent_id']."'".$par."
								ORDER BY sort DESC
								LIMIT 1
								");
		$m = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);

		return $m['sort'];

}

function smarty_function_check_min($params)
{
	global $pdo;
		$stmt=$pdo->query("
								SELECT id_menu, sort
								FROM menus
								WHERE type = '".$params['type']."' and parent_id = '".$params['parent_id']."'".$par."
								ORDER BY sort ASC
								LIMIT 1
								");
		$m = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);

		return $m['sort'];
}

##########################################################
################### set homepage link ####################
##########################################################

if($_GET['action'] == "set_home_link")
{
			$pdo -> exec("
							UPDATE menus
							SET home = '0'
							");
			$pdo -> exec("
							UPDATE menus
							SET home = '1'
							WHERE id_menu = '".$_GET['id']."'
							");
}

##########################################################
#################### languages list ######################
##########################################################

$stmt=$pdo->query("
						SELECT *
						FROM language
						ORDER BY title
						");
$lang_list=$stmt->fetchAll();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('lang_list',$lang_list);

##########################################################
#################### change menus sort ###################
##########################################################
if($_GET['action'] == "lower")
{
	down($_GET['id'],"prime");
}

if($_GET['action'] == "upper")
{
	up($_GET['id'],"prime");
}
##########################################################

##########################################################
################# delete from menus table ################
##########################################################
if($_GET['action']=="delete") {
			$pdo -> exec("
							DELETE FROM language_content
							WHERE element = 'menus' and id_element = '".$_GET['id']."'
							");

			$stmt = $pdo -> query("
										SELECT COUNT(*) as elements
										FROM language_content
										WHERE element = 'menus' and id_element = '".$_GET['id']."'
			");
			$if_exist = $stmt->fetch();
			unset($stmt);
			if($if_exist['elements']==0)
			{

				$pdo -> exec("
								DELETE FROM menus
								WHERE id_menu = '".$_GET['id']."'
								");
			}
}
############################################################

##########################################################
###################menus list definition##################
##########################################################
if(isset($_POST['language_list']))
{
	setcookie("menu_lang", "", time()-3600,"/backend/menus");
	setcookie("menu_lang", $_POST['language_list'], time()+3600,"/backend/menus");
	header("Location: ".PATH_BACKEND."menus");
}
isset($_COOKIE['menu_lang'])?$menu_lang = $_COOKIE['menu_lang']:$menu_lang = $backend_language['id_language'];
$smarty->assign('menu_lang',$menu_lang);
$menus_list = CheckParentID($menu_lang,'prime','menus');

$smarty->assign("menus_list",$menus_list);

$smarty->assign("PATH_BACKEND",PATH_BACKEND);
############################################################
?>