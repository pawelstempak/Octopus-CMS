<?php
function smarty_function_check_max_sort($params)
{
	global $pdo;
		if($params['parent_id']==0)
		{
			$par = " and id_menu != '1'";
		}
		$stmt=$pdo->query("
								SELECT id_menu, sort
								FROM menus
								WHERE type = '".$params['type']."' and parent_id = '".$params['parent_id']."'".$par."
								ORDER BY sort DESC
								LIMIT 1
								");
		$m = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);

		return $m['sort'];

}