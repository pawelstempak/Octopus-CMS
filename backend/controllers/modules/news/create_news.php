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

############# Zapis do MySQL danych ################
if(isset($_POST['save']))
{
			$pdo -> exec("
				INSERT INTO module_news (
										id_module_cat_news,
										status,
										created,
										modified,
										created_by,
										modified_by
										)
				VALUES (
						 '".$_POST['id_cat_news']."',
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
									 'module_news_title',
									 '".$l_ins_id."',
									 '".$id."',
									 '".addslashes($_POST['langid_'.$id])."'
									 )
				");
			}
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
									 'module_news_content',
									 '".$l_ins_id."',
									 '".$id."',
									 '".addslashes($_POST['clangid_'.$id])."'
									 )
				");
			}

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
				SET filename = '".$foo->file_dst_name."', id_module_news = '".$l_ins_id."', df = '1'
				");

			}

	if(isset($_POST['save']) and $_POST['save']=="save_close"){header("Location: ".PATH_BACKEND_MODULES.$module['restful_url']."/start/ok");}
	if(isset($_POST['save']) and $_POST['save']=="save"){header("Location: ".PATH_BACKEND_MODULES.$module['restful_url']."/edit_news/".$l_ins_id."/ok");}
}
#################################################################


?>