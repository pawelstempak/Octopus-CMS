<?php
function smarty_function_if_level($params)
{
		global $pdo;

		$stmt=$pdo->query("
								SELECT id_menu
								FROM menus
								WHERE type = '".$params['type']."'
								");
		$lev1=$stmt->fetchAll();
		$stmt->closeCursor();
		unset($stmt);
		foreach($lev1 as $val)
		{
			$stmt=$pdo->query("
									SELECT id_menu
									FROM menus
									WHERE parent_id = '".$val['id_menu']."' and type = '".$params['type']."'
									");
			$lev2=$stmt->fetchAll();
			$stmt->closeCursor();
			unset($stmt);

			foreach($lev2 as $val2)
			{
				$stmt=$pdo->query("
										SELECT id_menu
										FROM menus
										WHERE parent_id = '".$val2['id_menu']."' and type = '".$params['type']."'
										LIMIT 1
										");
				$lev3=$stmt->fetch();
				$stmt->closeCursor();
				unset($stmt);

				if($lev3['id_menu']!="")
				{
					return false;
				}
			}
		}
		return true;
}
?>