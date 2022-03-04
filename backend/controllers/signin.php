<?php
##########################################################
###################### Current URL #######################
##########################################################
if (isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on") {
    $pro = 'https';
} else {
    $pro = 'http';
}
$port = ($_SERVER["SERVER_PORT"] == "80") ? "" : (":".$_SERVER["SERVER_PORT"]);
$current_url =  $pro."://".$_SERVER['SERVER_NAME'].$port.$_POST['breadcrumbs'];

##########################################################
##################### sign in method #####################
##########################################################

			if($_POST['action']=="signin")
			{
				$sing_in_result=$user->authorization($_POST['email'],$_POST['password'],$_POST['language'],$backend_settings['session_life_time']);
				if($sing_in_result['status']){
					($_POST['breadcrumbs']!="/backend/signin")?header('Location: '.$current_url):header('Location: '.PATH_BACKEND);
				}
			}
			$smarty->assign('sing_in_result',$sing_in_result);
$current_url;
##########################################################
##################define languages list###################
##########################################################

$stmt=$pdo->query("
						SELECT id_language, title, code
						FROM language
						");
foreach($stmt as $row)
{
	$languages[] = $row;
}
$stmt->closeCursor();
unset($stmt);
$smarty->assign('languages',$languages);

$smarty->assign("breadcrumbs",$_SERVER['REQUEST_URI']);
?>