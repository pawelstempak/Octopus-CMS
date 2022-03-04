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

#####################################################################################
########################### Check if it is not the last user#########################
#####################################################################################
$stmt = $pdo -> prepare("
							SELECT COUNT(id)
							FROM users
							WHERE type = 'backend'
");
$stmt->execute();
$users_number = $stmt->fetchColumn();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('users_number',$users_number);

###############################################################
################ Zapis do MySQL danych języka #################
###############################################################
if($_GET['action']=="save")
{
if($_POST['password']!=""){$password = ", password = '".$_POST['password']."'";}

$pdo -> exec("
			UPDATE users
			SET name = '".$_POST['name']."', lastname = '".$_POST['lastname']."', email = '".$_POST['email']."', id_users_groups = '".$_POST['groups']."'".$password."
			WHERE id = '".$_GET['id']."'
		");

header("Location: ".PATH_BACKEND."backend_users/ok");
}

####################################################################################
#################################### Delte user ####################################
####################################################################################
if($_GET['action']=="delete") {
	$pdo -> exec("
					DELETE FROM users
					WHERE id = '".$_GET['id']."'
					");
					!empty($_GET['action_id'])?$id="/".$_GET['action_id']:$id="";
					header("Location: ".PATH_BACKEND."backend_users/ok".$id);						
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

#####################################################################################
############# Pobranie z MySQL i przekazanie do SMARTY listy języków ################
#####################################################################################
$query = "
			SELECT *
			FROM users
			WHERE type = 'backend'
";

$pag = new Pagination($backend_settings['pagination'],$query);
$page_number = $_GET['id'];
if($page_number>1)
{
	$offset = $backend_settings['pagination']*($page_number-1);
	$offset = " OFFSET ".$offset;
}
else
{
	$offset = "";
}

$stmt = $pdo -> query("
							SELECT *
							FROM users
							WHERE type = 'backend'
							ORDER BY lastname
							LIMIT ".$backend_settings['pagination'].$offset."
");

foreach($stmt as $row)
{
	$backend_users_list[] = $row;
}
$stmt->closeCursor();
unset($stmt);
$smarty->assign('backend_users_list',$backend_users_list);
$smarty->assign('pag_numbers',$pag->getPagNumbers());


?>