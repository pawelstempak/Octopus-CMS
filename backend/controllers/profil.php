<?php
if(isset($_POST['zapisz']))
{
		$stmt = $pdo -> query("
								SELECT email
								FROM users
								WHERE id = '".$user->getUserId()."'
		");
		$result_email = $stmt -> fetch();
		$pdo->exec("
			UPDATE users
			SET name = '".$_POST['name']."',
			lastname = '".$_POST['lastname']."',
			email = '".$_POST['email']."'
			WHERE id = '".$user->getUserId()."' and type = 'backend'
		");
		if($_POST['password']!="")
		{
			$pdo->exec("
				UPDATE users
				SET password = '".$_POST['password']."'
				WHERE id = '".$user->getUserId()."' and type = 'backend'
			");
		}
	if($result_email['email']!=$_POST['email'])
	{
		$user->user_logout();
		header("Location: ".PATH_BACKEND);
	}
	else
	{
		header("Location: ".PATH_BACKEND."profil/ok");
	}

}

?>