<?php

function smarty_function_menu_check_name($params)
{
		global $pdo;

		$stmt=$pdo->query("
								SELECT content
								FROM language_content
								WHERE id_element = '".$params['id_menu']."' and id_language = '".$params['id_language']."'
								");
		$out=$stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);
		if($out['content']!="")
		{
		return " checked";
		}
		else
		return "";
}