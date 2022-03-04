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
	down($_GET['id'],"second");
}

if($_GET['action'] == "upper")
{
	up($_GET['id'],"second");
}
##########################################################

##########################################################
################# delete from menus table ################
##########################################################
if($_GET['action']=="delete") {
			$pdo -> exec("
							DELETE FROM language_content
							WHERE element = 'menus' and id_element = '".$_GET['id']."' and id_language = '".$_GET['action_id']."'
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
	setcookie("smenu_lang", "", time()-3600,"/backend/smenus");
	setcookie("smenu_lang", $_POST['language_list'], time()+3600,"/backend/smenus");
	header("Location: ".PATH_BACKEND."smenus");
}
isset($_COOKIE['smenu_lang'])?$menu_lang = $_COOKIE['smenu_lang']:$menu_lang = $backend_language['id_language'];
$smarty->assign('menu_lang',$menu_lang);
$menus_list = CheckParentID($menu_lang,'second','menus');

$smarty->assign("menus_list",$menus_list);

$smarty->assign("PATH_BACKEND",PATH_BACKEND);
?>