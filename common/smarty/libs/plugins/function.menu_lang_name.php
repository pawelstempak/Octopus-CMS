<?php

function smarty_function_menu_lang_name($params)
{
		global $pdo;

		$stmt=$pdo->query("
								SELECT content
								FROM language_content
								WHERE id_element = '".$params['id_menu']."' and id_language = '".$params['id_language']."'
								");
		$output=$stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);
		if($output['content']!="")
		{
      return "value=\"".$output['content']."\"";
		}
		else
		{
      return " disabled";
		}
}