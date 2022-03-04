<?php
require 'config.php';
require ABS_PATH.'common/db_con.php';
require ABS_PATH.'common/smarty/libs/Smarty.class.php';
require ABS_PATH.'common/class/Auth.php';
require ABS_PATH.'common/class/class.upload.php';
require ABS_PATH.'common/class/page.validation.php';
require ABS_PATH.'common/class/class.pagination.php';

ob_start();

session_start();

$smarty = new Smarty();
$smarty->debugging = false;
$smarty->caching = false;
$smarty->cache_lifetime = 120;

require ABS_PATH_BACKEND.'core/init.php';
require ABS_PATH_BACKEND.'core/functions.php';
require ABS_PATH_BACKEND.'tpl/'.$backend_template['folder_name'].'/lang/'.$backend_language['code'].'.php';
require ABS_PATH_BACKEND.'core/smarty_plugins.php';

##########################################################
#############smarty's constants definition################
##########################################################
//$smarty->assign('time',time());
$smarty->assign('config',$cfg);
$smarty->assign('lang',$lang);
$smarty->assign('ABS_PATH',ABS_PATH);
$smarty->assign('PATH',PATH);
$smarty->assign('ABS_PATH_BACKEND',ABS_PATH_BACKEND);
$smarty->assign('PATH_BACKEND',PATH_BACKEND);
$smarty->assign('PATH_BACKEND_MODULES',PATH_BACKEND_MODULES);

$tpl_folder_path = PATH_BACKEND.'tpl/'.$backend_template['folder_name'];
$smarty->assign('tpl_folder_path',$tpl_folder_path);

$tpl_folder_absolute_path = ABS_PATH_BACKEND.'tpl/'.$backend_template['folder_name'];
$smarty->assign('tpl_folder_absolute_path',$tpl_folder_absolute_path);

$smarty->setTemplateDir($tpl_folder_absolute_path.'/templates/');
$smarty->setCompileDir($tpl_folder_absolute_path.'/smarty/templates_c/');
$smarty->setConfigDir($tpl_folder_absolute_path.'/smarty/configs/');
$smarty->setCacheDir($tpl_folder_absolute_path.'/smarty/cache/');

$_GET['page']=="backend"?header("Location: ".PATH_BACKEND):NULL;

##########################################################
####downloading template's file an loading tempplate######
#############existing file verification version###########
##########################################################
if(sha1($_SESSION['email'].$hidden_hash_var)==$_SESSION['id_hash'] and $_SESSION['expire']>time()){

	$_SESSION['expire'] = time()+$backend_settings['session_life_time']; // extension of the session

	require ABS_PATH_BACKEND.'core/menu_validation.php';

	if(isset($_GET['page']))
	{
		$_GET['l']=="modules"?$sub_folder="modules/".$_GET['mod']."/":$sub_folder="";

		if(file_exists($tpl_folder_absolute_path.'/templates/'.$sub_folder.$_GET['page'].'.tpl'))
		{
			require 'backend/controllers/'.$sub_folder.$_GET['page'].'.php'; // include controllers file
			$smarty -> display($sub_folder.$_GET['page'].'.tpl'); //loading template file
		}
		else
		{
			$smarty -> display('error404.tpl'); //loading template file
		}
	}
	else
	{
		require 'backend/controllers/dashboard.php'; // include controllers file
		$smarty -> display('dashboard.tpl'); //loading template file
	}
}
else
{
		if($_SESSION)
		{
			$user->user_logout();
		}
		require 'backend/controllers/signin.php'; // include controllers file
		$smarty -> display('signin.tpl'); //loading template file
}
?>