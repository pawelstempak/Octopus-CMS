<?php
/* CREATE PAGES LIST */

// ##########################################################
// ###################### set first tab# ####################
// ##########################################################

// 	$stmt = $pdo -> query("
// 								SELECT *
// 								FROM language_content l, language g
// 								WHERE g.id_language = l.id_language and l.element = 'pages_title' and g.id_language = '".$backend_settings['id_language']."'
// 	");

// $first_tab = $stmt->fetch();
// $stmt->closeCursor();
// unset($stmt);
// $smarty->assign('first_tab',$first_tab);

// ##########################################################
// ################default language definition###############
// ##########################################################

// 	$stmt=$pdo->query("
// 						 	SELECT id_language, title, code
// 							FROM language
// 							WHERE id_language != '".$backend_settings['id_language']."'
// 							ORDER BY title ASC
// 							");

// $language_list=$stmt->fetchAll();
// $stmt->closeCursor();
// unset($stmt);
// $smarty->assign("language_list",$language_list);

##########################################################
###################### set first tab# ####################
##########################################################

$stmt = $pdo -> query("
SELECT *
FROM language
WHERE id_language = '".$page_lang."'
");


$first_tab = $stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('first_tab',$first_tab);

##########################################################
################default language definition###############
##########################################################

$stmt=$pdo->query("
 SELECT *
FROM language
WHERE id_language != '".$page_lang."'
ORDER BY title ASC
");

$language_list=$stmt->fetchAll();
$stmt->closeCursor();
unset($stmt);
$smarty->assign("language_list",$language_list);

##########################################################
###################### get pages list ####################
##########################################################
if($_GET['page']=="create_pages")
{
$stmt = $pdo -> query("
							SELECT *
							FROM pages p, language_content l
							WHERE p.id_pages = l.id_element and l.element = 'pages_title'
							ORDER BY l.content
");
}
else
{
$stmt = $pdo -> query("
							SELECT *
							FROM pages p, language_content l
							WHERE p.id_pages = l.id_element and l.element = 'pages_title' and p.id_pages != '".$_GET['id']."'
							ORDER BY l.content
");
}

$pages_list = $stmt->fetchAll();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('pages_list',$pages_list);

############# Zapis do MySQL danych ################
if(isset($_POST['save']))
{
	switch($_GET['page']) {
		case "create_pages":

			$pdo -> exec("
				INSERT INTO pages (
										id_layouts,
										status,
										created,
										modified,
										created_by,
										modified_by
										)
				VALUES (
						 '".$_POST['layouts_id']."',
						 '0',
						 '".date("Y-m-d H:i:s",time())."',
						 '".date("Y-m-d H:i:s",time())."',
						 '".$user->GetUserId()."',
						 '".$user->GetUserId()."'
						 )
			");

			$l_ins_id = $pdo->lastInsertId();

			$lang_id = POST2LangId($_POST,'langid');
			foreach($lang_id as $id)
			{

				$pdo -> exec("
							INSERT INTO language_content (
																  element,
																  id_element,
																  id_language,
																  content
																 )
							VALUES (
									 'pages_title',
									 '".$l_ins_id."',
									 '".$id."',
									 '".addslashes($_POST['langid_'.$id])."'
									 )
				");

			}

		break;

		case "edit_pages":

			$lang_id = POST2LangId($_POST,'lang');

			foreach($lang_id as $id)
			{
				if($_POST['langid_'.$id])
				{
					$stmt=$pdo->query("
					 	SELECT *
						FROM language_content
						WHERE element = 'pages_title' and id_element = '".$_GET['id']."' and id_language = '".$id."'
						");
					$if_exist=$stmt->fetch();
					$stmt->closeCursor();
					unset($stmt);
					if($if_exist)
					{
						$pdo -> exec("
									UPDATE language_content
									SET content = '".addslashes($_POST['langid_'.$id])."'
									WHERE element = 'pages_title' and id_element = '".$_GET['id']."' and id_language = '".$id."'
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
											 'pages_title',
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
								WHERE element = 'pages_title' and id_element = '".$_GET['id']."' and id_language = '".$id."'
					");
				}
			}
			$pdo -> exec("
							UPDATE pages
							SET created = '".$_POST['created']."', modified = '".date("Y-m-d H:i:s",time())."', modified_by = '".$user->GetUserId()."'
							WHERE id_pages = '".$_GET['id']."'
			");
		break;
		}

		CreateXMLSearchPagesFile('pages_title');

		if(isset($_POST['save']) and $_POST['save']=="save_close"){header("Location: ".PATH_BACKEND."pages/ok");}
		if(isset($_POST['save']) and $_POST['save']=="save"){header("Location: ".PATH_BACKEND."edit_pages/ok/".$_GET['id']);}
	}

	if(isset($_GET['action_id']) and $_GET['action_id']!="ok")
	{

		$stmt = $pdo -> query("
									SELECT id_pages_list
									FROM pages_list
									WHERE id_list = '".$_GET['id']."' and id_pages = '".$_GET['action_id']."' and id_language = '".$_GET['action']."'

		");
		$ile = $stmt -> fetch();
		$stmt->closeCursor();
		unset($stmt);

		if($ile['id_pages_list']!="")
		{
			$pdo -> exec("
							DELETE FROM pages_list
							WHERE id_pages_list = '".$ile['id_pages_list']."'
							");
		}
		else
		{
			$pdo -> exec("
							INSERT INTO pages_list (
											  id_list,
											  id_pages,
											  id_language
											 )
							VALUES (
							'".$_GET['id']."',
							'".$_GET['action_id']."',
							'".$_GET['action']."'
							)
			");
		}
			$pdo -> exec("
							UPDATE pages
							SET created = '".$_POST['created']."', modified = '".date("Y-m-d H:i:s",time())."', modified_by = '".$user->GetUserId()."'
							WHERE id_pages = '".$_GET['id']."'
			");
		header("Location: ".PATH_BACKEND."edit_pages/ok/".$_GET['id']);
	}
#################################################################

?>