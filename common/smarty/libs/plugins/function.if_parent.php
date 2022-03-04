<?php
function smarty_function_if_parent($params)
{
		global $pdo;

		$stmt=$pdo->query("
								SELECT parent_id
								FROM menus
								WHERE parent_id = '".$params['id_menu']."' and type = 'prime' and status = '1'
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
?>