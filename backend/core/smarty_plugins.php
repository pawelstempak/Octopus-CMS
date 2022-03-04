<?php
##########################################################
############### set menu language badges #################
##########################################################
$smarty->registerPlugin("function","lang_badges", "set_lang_badges");

function set_lang_badges($params, $smarty)
{
		global $pdo;
		$stmt = $pdo -> query("
									SELECT lang.code
									FROM language_content l, language lang
									WHERE l.id_element = '".$params['id']."' and element = '".$params['element']."' and lang.id_language = l.id_language and l.id_language != '".$params['lang']."'
		");
		foreach($stmt as $row)
		{
			$badges .= "<span style=\"margin-right:5px;\" class=\"new badge\" data-badge-caption=\"".strtoupper($row['code'])."\"></span>";
		}
		$badges .= "<span style=\"margin-right:5px;\" class=\"new badge\" data-badge-caption=\"".strtoupper($params['code'])."\"></span>";
		$stmt->closeCursor();
		unset($stmt);

   return $badges;
}

##########################################################
############### set menu language badges #################
##########################################################
$smarty->registerPlugin("function","page_category", "display_page_category");

function display_page_category($params, $smarty)
{
		global $pdo;
		$stmt = $pdo -> query("
									SELECT parent_id
									FROM menus
									WHERE type = '".$params['type']."' and id_pages = '".$params['id']."'
		");
		$parent_id = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);

		$stmt = $pdo -> query("
									SELECT l.content
									FROM menus m, language_content l
									WHERE l.element = '".$params['element']."' and m.type = '".$params['type']."' and l.id_element = m.id_menu and m.id_menu = '".$parent_id['parent_id']."'
		");
		$cat = $stmt->fetch();
		if($cat)
		{
			$category = "<span class=\"grey-text \">".$cat['content']." &#187</span>";
		}
		$stmt->closeCursor();
		unset($stmt);

   return $category;
}

##########################################################
################ set admin name from id ##################
##########################################################
$smarty->registerPlugin("function","user", "show_user");

function show_user($params, $smarty)
{
		global $pdo;
		$stmt = $pdo -> query("
									SELECT *
									FROM users
									WHERE id = '".$params['id']."'
		");
		$user_name = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);

   return $user_name['name']." ".$user_name['lastname'];
}

##########################################################
############# check if id is in page_list ################
##########################################################
$smarty->registerPlugin("function","if_page_list", "check_id_page_list");

function check_id_page_list($params, $smarty)
{
		global $pdo;
		$stmt = $pdo -> query("
									SELECT *
									FROM pages_list
									WHERE id_list = '".$params['id']."' and id_pages = '".$params['action_id']."' and id_language = '".$params['action']."'
		");
		$id_page_list = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);

   return $id_page_list['id_pages'];
}

##########################################################
############# check if id_menu is parent #################
##########################################################
//layouts/single_page.tpl

$smarty->registerPlugin("function","if_is_parent", "check_if_is_parent");

function check_if_is_parent($params, $smarty)
{
		global $pdo;
		$stmt = $pdo -> query("
									SELECT id_menu
									FROM menus
									WHERE parent_id = '".$params['id']."' and type = '".$params['type']."'
		");
		$id_page_list = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);

   if($id_page_list)
	{
		return false;
	}
	return true;

}

##########################################################
############# check if lang file exsist ##################
##########################################################
//backend_settings.tpl

$smarty->registerPlugin("function","lang_file", "check_if_exist_lang_file");

function check_if_exist_lang_file($params, $smarty)
{
		global $backend_template;
		if(!file_exists('backend/tpl/'.$backend_template['folder_name'].'/lang/'.$params['code'].'.php'))
		{
			return ' - '.$params['info'].' /backend/tpl/'.$backend_template['folder_name'].'/lang/'.$params['code'].'.php';
		}
}
?>