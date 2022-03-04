<?php
#####################################################################################
##################### Check if user has a right to view this page####################
#####################################################################################
$p = new PageValidation();
if($p->isSuperUser($result_login_user['id']))
{
	if($p->isPageValid($result_login_user['id'],"backend_users"))
	{
		header("Location: ".PATH_BACKEND);
	}
}
##########################################################
################## save user to MySQL ####################
##########################################################
if(isset($_POST['save']))
{
		$pdo -> exec("
			INSERT INTO users (
									type,
									name,
									lastname,
									email,
									password,
									super_admin,
									id_users_groups
									)
			VALUES (
					 'backend',
					 '".$_POST['name']."',
					 '".$_POST['lastname']."',
					 '".$_POST['email']."',
					 '".$_POST['password']."',
					 '0',
					 '".$_POST['groups']."'
					 )
		");
	if(isset($_POST['save'])){header("Location: ".PATH_BACKEND."backend_users/ok");}
}

##########################################################
################# define user_group list #################
##########################################################

$stmt=$pdo->query("
						SELECT id_users_groups, title
						FROM users_groups
						");
foreach($stmt as $row)
{
	$users_groups[] = $row;
}
$stmt->closeCursor();
unset($stmt);
$smarty->assign('users_groups',$users_groups);
?>