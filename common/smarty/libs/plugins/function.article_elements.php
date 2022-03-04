<?php

function smarty_function_article_elements($params)
{
		global $pdo;

		$stmt=$pdo->query("
								SELECT content
								FROM language_content
								WHERE id_element = '".$params['id_element']."' and id_language = '".$params['id_language']."' and element = '".$params['element']."'
								");
		$out=$stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);
		return $out['content'];
}