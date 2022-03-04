<?php
#####################################################################################
##################### Check if user has a right to view this page####################
#####################################################################################
$p = new PageValidation();
if($p->isSuperUser($result_login_user['id']))
{
	if($p->isPageValid($result_login_user['id'],"language"))
	{
		header("Location: ".PATH_BACKEND);
	}
}
############# Zapis do MySQL danych j&#40569;ka ################
if($_GET['action']=="save")
{
$pdo -> exec("
			UPDATE language
			SET title = '".$_POST['title']."', code = '".$_POST['code']."'
			WHERE id_language = '".$_GET['id']."'
		");

header("Location: ".PATH_BACKEND."language/ok");
}
#################################################################

############# Usuni&#39081;e z MySQL pojedynczego postu wraz z zdj&#39081;ami ################
if($_GET['action']=="delete") {

			$stmt = $pdo -> query("
										SELECT COUNT(*) as elements
										FROM language_content
										WHERE id_language = '".$_GET['id']."'
			");
			$if_exist = $stmt->fetch();
			unset($stmt);
			if($if_exist['elements']==0)
			{
				$pdo -> exec("
								DELETE FROM language
								WHERE id_language = '".$_GET['id']."'
								");
			}
					!empty($_GET['action_id'])?$id="/".$_GET['action_id']:$id="";
					header("Location: ".PATH_BACKEND."language/ok".$id);
}
############################################################

############# Pobranie z MySQL i przekazanie do SMARTY listy j&#40569;k&#55957;&#57251;###############
$query = "
			SELECT *
			FROM language
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
							FROM language
							ORDER BY title
							LIMIT ".$backend_settings['pagination'].$offset."
");

foreach($stmt as $row)
{
	$language_list[] = $row;
}
$stmt->closeCursor();
unset($stmt);
$smarty->assign('language_list',$language_list);
$smarty->assign('pag_numbers',$pag->getPagNumbers());
############################################################
?>