<?php
function smarty_function_if_last_child($params)
{
		global $pdo;

		$stmt=$pdo->query("
								SELECT id_menu
								FROM menus
								WHERE parent_id = '".$params['parent_id']."' and type = 'prime' and status = '1'
								ORDER BY sort DESC LIMIT 1
								");
		$out=$stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);
		return $out['id_menu'];
}
?>