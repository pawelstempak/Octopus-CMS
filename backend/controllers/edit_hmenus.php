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

#####################################################################################
############################# Save data to MySQL databse ############################
#####################################################################################
if(isset($_POST['save']) or isset($_POST['save_and_close']))
{
	if($_GET['id']!="1")
	{
		if($_POST['restful_url']!="")
		{
			$restful_url = restful_url($_POST['restful_url'],"others",$_GET['id']);
			$r_url = ", restful_url = '".$restful_url."'";
		}
		else
		{
			$param = $_POST['langid_'.$backend_language['id_language']];
			$restful_url = restful_url($param,"others",$_GET['id']);
			$r_url = ", restful_url = '".$restful_url."'";
		}
	}

	$_POST['parent_id']==""?$parent_id=0:$parent_id=$_POST['parent_id'];

	$stmt=$pdo->query("
						SELECT parent_id
						FROM menus
						WHERE id_menu = '".$_GET['id']."'
						");
	$par=$stmt->fetch();
	$stmt->closeCursor();
	unset($stmt);

	if($_POST['parent_id']!=$par['parent_id'] and $_GET['id']!="1")
	{
			$stmt=$pdo->query("
						SELECT MAX(sort)
						FROM menus
						WHERE type = 'others' and parent_id = '".$_POST['parent_id']."'
						");
			$sor=$stmt->fetch();
			$stmt->closeCursor();
			unset($stmt);
			if($sor['MAX(sort)']!=""){$s = $sor['MAX(sort)']+1;}else{$s = 0;}
			$sort = ", sort = '".$s."'";
	}

	$pdo -> exec("
				UPDATE menus
				SET type = 'others', status = '".$_POST['status']."', id_pages = '".$_POST['pages_id']."', parent_id = '".$parent_id."'".$sort.$r_url."
				WHERE id_menu = '".$_GET['id']."'
	");

	$stmt=$pdo->query("
							SELECT id_language, code
							FROM language
							");
	$lang_id=$stmt->fetchAll();
	$stmt->closeCursor();
	unset($stmt);

	foreach($lang_id as $lid)
	{
		$id = $lid['id_language'];
		$code = $lid['code'];

		if($_POST['langid_'.$id]!="")
		{
			$stmt=$pdo->query("
								SELECT content
								FROM language_content
								WHERE id_element = '".$_GET['id']."' and id_language = '".$id."' and element = 'menus'
								");
			$CheckIfExist=$stmt->fetch();
			$stmt->closeCursor();
			unset($stmt);

			if($CheckIfExist!="")
			{
				$pdo -> exec("
							UPDATE language_content
							SET element = 'menus', id_element = '".$_GET['id']."', id_language = '".$id."', content = '".addslashes($_POST['langid_'.$id])."'
							WHERE id_element = '".$_GET['id']."' and id_language = '".$id."' and element = 'menus'
				");
			}
			else
			{
				$pdo -> exec("
							INSERT INTO language_content (
																  element,
																  id_element,
																  id_language,
																  content
																 )
							VALUES (
									 'menus',
									 '".$_GET['id']."',
									 '".$id."',
									 '".addslashes($_POST['langid_'.$id])."'
									 )
				");
			}
		}
		else
		{
				$pdo -> exec("
								DELETE FROM language_content
								WHERE id_element = '".$_GET['id']."' and id_language = '".$id."' and element = 'menus'
				");
		}
	}

	CreateXMLSearchFile('others','menus');

	if(isset($_POST['save']) and $_POST['save']=="save_close"){header("Location: ".PATH_BACKEND."hmenus/ok");}
	if(isset($_POST['save']) and $_POST['save']=="save"){header("Location: ".PATH_BACKEND."edit_hmenus/ok/".$_GET['id']);}
}
#################################################################

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

##########################################################
################default language definition###############
##########################################################

$stmt=$pdo->query("
						SELECT t.id_language, t.title, t.code
						FROM language t
						LEFT JOIN settings s
						ON s.id_language = t.id_language and s.type='frontend'
						ORDER BY type DESC, title ASC
						");
$language_list=$stmt->fetchAll();
$stmt->closeCursor();
unset($stmt);
$smarty->assign("language_list",$language_list);

##########################################################
###################menus list definition##################
##########################################################

$menus_list = CheckParentID($backend_language['id_language'],'others','menus');

$smarty->assign("menus_list",$menus_list);

##########################################################
###################menus list definition##################
##########################################################

$stmt=$pdo->query("
						SELECT m.id_menu, l.content, l.id_language, m.restful_url, m.status, m.parent_id, m.sort, m.id_pages
						FROM menus m, language_content l
						WHERE m.id_menu = l.id_element and m.type = 'others' and l.id_language = '".$backend_language['id_language']."' and m.id_menu = '".$_GET['id']."'
						");
$u=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign("u",$u);
?>