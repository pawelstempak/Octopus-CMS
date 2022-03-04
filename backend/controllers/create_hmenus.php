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


############# Zapis do MySQL danych kursu ################
if(isset($_POST['save']))
{
	if($_POST['restful_url']!="")
	{
		$restful_url = restful_url($_POST['restful_url'],"others");
	}
	else
	{
		$param = $_POST['langid_'.$backend_language['id_language']];
		$restful_url = restful_url($param,"others");
	}

	$_POST['parent_id']==""?$parent_id=0:$parent_id=$_POST['parent_id'];

	$stmt = $pdo->query("
								SELECT MAX(sort) as max_sort
								FROM menus
								WHERE type = 'others' and parent_id = '".$parent_id."'
							  ");
	$sort = $stmt->fetch();
	$stmt->closeCursor();
	unset($stmt);
	$sort = $sort['max_sort']+1;


	$pdo -> exec("
				INSERT INTO menus (
										  type,
										  restful_url,
										  status,
										  parent_id,
										  sort,
										  id_pages,
										  home
										 )
				VALUES (
						 'others',
						 '".$restful_url."',
						 '".$_POST['status']."',
						 '".$parent_id."',
						 '".$sort."',
						 '".$_POST['pages_id']."',
						 '0'
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
							 'menus',
							 '".$l_ins_id."',
							 '".$id."',
							 '".addslashes($_POST['langid_'.$id])."'
							 )
		");
	}

	CreateXMLSearchFile('others','menus');

	if(isset($_POST['save']) and $_POST['save']=="save_close"){header("Location: ".PATH_BACKEND."hmenus/ok");}
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
?>