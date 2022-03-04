<?php
class PageValidation
{
	function isSuperUser($user_id)
	{
		global $pdo;

		$stmt=$pdo->prepare("SELECT COUNT(*) FROM users WHERE id='".$user_id."' AND super_admin = '1' AND type='backend'");
		$stmt->execute();
		$num = $stmt->fetchColumn();
		$stmt->closeCursor();
		unset($stmt);

		if($num != 1)
		{
			return true;
		}
		return false;
	}

	function isPageValid($user_id,$page)
	{
		global $pdo;

		$stmt=$pdo->prepare("SELECT COUNT(*) FROM users u, users_groups g WHERE u.id_users_groups = g.id_users_groups AND u.id='".$user_id."' AND u.type='backend' AND g.".$page." = '1'");
		$stmt->execute();
		$num = $stmt->fetchColumn();
		$stmt->closeCursor();
		unset($stmt);

		if($num != 1)
		{
			return true;
		}
		return false;
	}

	function whoYouAre($user_id)
	{
		global $pdo;

		$stmt=$pdo->prepare("SELECT g.title FROM users u, users_groups g WHERE u.id_users_groups = g.id_users_groups AND u.id='".$user_id."' AND u.type='backend'");
		$stmt->execute();
		$result = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);

		return $result['title'];
	}
}
?>