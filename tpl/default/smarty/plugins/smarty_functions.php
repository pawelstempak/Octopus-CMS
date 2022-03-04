<?php
##########################################################
################# registered smarty func #################
##########################################################

/* Check the category for being */
$smarty->registerPlugin("function","parent_menu","parentid");
function parentid($params, $smarty)
{
		global $pdo;

		$stmt=$pdo->query("
								SELECT parent_id
								FROM menus
								WHERE parent_id = '".$params['id']."' and type = 'second' and status = '1'
								");
		$out=$stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);
		if($out['parent_id']!="")
		{
			return true;
		}
		else
		{
			return false;
		}

}

/**/
$smarty->registerPlugin("function","if_level","if_is_level");
function if_is_level($params,$smarty)
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