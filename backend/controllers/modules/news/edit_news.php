<?php
/* CREATE NEW CONTENT */

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
################## module news content ##################
##########################################################
$stmt=$pdo->query("
					 	SELECT *
						FROM module_news
						WHERE id_module_news = '".$_GET['id']."'
						");
$news=$stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign("news",$news);


##########################################################
####################### module info ######################
##########################################################
$stmt = $pdo -> query("
							SELECT title, restful_url
							FROM modules
							WHERE restful_url = '".$_GET['mod']."'
");
$module = $stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('module',$module);

##########################################################
##################### get category list ##################
##########################################################
$stmt = $pdo -> query("
							SELECT *
							FROM module_cat_news
");

$module_news = $stmt->fetchAll();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('module_news',$module_news);

##########################################################
###################### set first tab# ####################
##########################################################

	$stmt = $pdo -> query("
								SELECT *
								FROM language_content l, language g
								WHERE g.id_language = l.id_language and l.element = 'pages_title' and g.id_language = '".$backend_settings['id_language']."'
	");

$first_tab = $stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('first_tab',$first_tab);

##########################################################
################default language definition###############
##########################################################

	$stmt=$pdo->query("
						 	SELECT id_language, title, code
							FROM language
							WHERE id_language != '".$backend_settings['id_language']."'
							ORDER BY title ASC
							");

$language_list=$stmt->fetchAll();
$stmt->closeCursor();
unset($stmt);
$smarty->assign("language_list",$language_list);

##########################################################
###################### get images list ###################
##########################################################
if($_GET['action']=="delete")
{
	$stmt = $pdo -> query("
						SELECT *
						FROM module_img_news
						WHERE id_module_img_news = '".$_GET['action_id']."'
						");
	$res = $stmt -> fetch();

	unlink(ABS_PATH."images/aktualnosci/".$res['filename']);
	unlink(ABS_PATH."images/aktualnosci/mini/".$res['filename']);
	unlink(ABS_PATH."images/aktualnosci/thumb/".$res['filename']);

	$stmt->closeCursor();
	unset($stmt);

	$pdo -> exec("
				DELETE FROM module_img_news
				WHERE id_module_img_news = '".$_GET['action_id']."'
	");
}

##########################################################
###################### get images list ###################
##########################################################
$stmt = $pdo -> query("
							SELECT *
							FROM module_img_news
							WHERE id_module_news = '".$_GET['id']."'
");

$images_list = $stmt->fetchAll();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('images_list',$images_list);

############# Zapis do MySQL danych ################
if(isset($_POST['save']))
{
			$lang_id = POST2LangId($_POST,'lang');

			foreach($lang_id as $id)
			{
				if($_POST['langid_'.$id])
				{
					$stmt=$pdo->query("
					 	SELECT *
						FROM language_content
						WHERE element = 'module_news_title' and id_element = '".$_GET['id']."' and id_language = '".$id."'
						");
					$if_exist=$stmt->fetch();
					$stmt->closeCursor();
					unset($stmt);
					if($if_exist)
					{
						$pdo -> exec("
									UPDATE language_content
									SET content = '".addslashes($_POST['langid_'.$id])."'
									WHERE element = 'module_news_title' and id_element = '".$_GET['id']."' and id_language = '".$id."'
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
											 'module_news_title',
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
								WHERE element = 'module_news_title' and id_element = '".$_GET['id']."' and id_language = '".$id."'
					");
				}
			}

			foreach($lang_id as $id)
			{
				if($_POST['langid_'.$id])
				{
					$stmt=$pdo->query("
					 	SELECT *
						FROM language_content
						WHERE element = 'module_news_content' and id_element = '".$_GET['id']."' and id_language = '".$id."'
						");
					$if_exist=$stmt->fetch();
					$stmt->closeCursor();
					unset($stmt);
					if($if_exist)
					{
						$pdo -> exec("
									UPDATE language_content
									SET content = '".addslashes($_POST['clangid_'.$id])."'
									WHERE element = 'module_news_content' and id_element = '".$_GET['id']."' and id_language = '".$id."'
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
											 'module_news_content',
											 '".$_GET['id']."',
					 						 '".$id."',
											 '".addslashes($_POST['clangid_'.$id])."'
											 )
						");
					}
				}
				else
				{
					$pdo -> exec("
								DELETE FROM language_content
								WHERE element = 'module_news_content' and id_element = '".$_GET['id']."' and id_language = '".$id."'
					");
				}
			}

			$pdo -> exec("
							UPDATE module_news
							SET created = '".$_POST['created']."', modified = '".date("Y-m-d H:i:s",time())."', modified_by = '".$user->GetUserId()."'
							WHERE id_module_news = '".$_GET['id']."'
			");

			if ($_FILES['gallery_file']['size'] != 0 && $_FILES['gallery_file']['error'] == 0)
			{
				##########################################################
				####################### module info ######################
				##########################################################

				$foo = new \Verot\Upload\Upload($_FILES['gallery_file']);
				if($foo->uploaded) {
					$time = time();

					$foo->file_safe_name = true;
					$foo->file_name_body_add = "_".$time;
					// save uploaded image with no changes
					$foo->process(ABS_PATH."images/aktualnosci/");

					$foo->image_resize = true;
					$foo->image_ratio_crop = true;
					$foo->image_x = 800;
					$foo->file_safe_name = true;
					$foo->file_name_body_add = "_".$time;
					$foo->process(ABS_PATH."images/aktualnosci/mini/");

					$foo->image_resize = true;
					$foo->image_ratio_crop = true;
					$foo->image_x = 100;
					$foo->image_y = 100;
					$foo->file_safe_name = true;
					$foo->file_name_body_add = "_".$time;
					$foo->process(ABS_PATH."images/aktualnosci/thumb/");
				}
				else
				{
				    echo 'error : ' . $foo->error;
				}

				$pdo -> exec("
				INSERT INTO module_img_news
				SET filename = '".$foo->file_dst_name."', id_module_news = '".$_GET['id']."', df = '1'
				");

			}

	if(isset($_POST['save']) and $_POST['save']=="save_close"){header("Location: ".PATH_BACKEND_MODULES.$module['restful_url']."/start/ok");}
	if(isset($_POST['save']) and $_POST['save']=="save"){header("Location: ".PATH_BACKEND_MODULES.$module['restful_url']."/edit_news/".$_GET['id']."/ok");}

}
#################################################################


?>