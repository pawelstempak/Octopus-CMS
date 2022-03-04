<?php
#####################################################################################
##################### Check if user has a right to view this page####################
#####################################################################################
$p = new PageValidation();
if($p->isSuperUser($result_login_user['id']))
{
	if($p->isPageValid($result_login_user['id'],"templates"))
	{
		header("Location: ".PATH_BACKEND);
	}
}
############# Zapis do MySQL danych j&#40569;ka ################
if($_GET['action']=="save")
{
$pdo -> exec("
			UPDATE templates
			SET title = '".$_POST['title']."', folder_name = '".$_POST['folder_name']."', description = '".$_POST['description']."'
			WHERE id_templates = '".$_GET['id']."'
		");

header("Location: ".PATH_BACKEND."templates/ok");
}
#################################################################

############# Usuni&#39081;e z MySQL pojedynczego postu wraz z zdj&#39081;ami ################
if($_GET['action']=="delete") {
	$pdo -> exec("
					DELETE FROM templates
					WHERE id_templates = '".$_GET['id']."'
					");
					!empty($_GET['action_id'])?$id="/".$_GET['action_id']:$id="";
					header("Location: ".PATH_BACKEND."templates/ok".$id);
}
############################################################

############# Pobranie z MySQL i przekazanie do SMARTY listy j&#40569;k&#55957;&#57251;###############
$query = "
			SELECT *
			FROM templates
			WHERE type = 'frontend'
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
							FROM templates
							WHERE type = 'frontend'
							ORDER BY title
							LIMIT ".$backend_settings['pagination'].$offset."
");

foreach($stmt as $row)
{
	$templates_list[] = $row;
}
$stmt->closeCursor();
unset($stmt);
$smarty->assign('templates_list',$templates_list);
$smarty->assign('pag_numbers',$pag->getPagNumbers());
############################################################
?>