<?php
require 'config.php';
require ABS_PATH.'common/db_con.php';
require ABS_PATH.'common/smarty/libs/Smarty.class.php';
require ABS_PATH.'common/class/class.upload.php';
require ABS_PATH.'common/class/page.router.php';

ob_start();

session_start();

$smarty = new Smarty();
$smarty->debugging = false;
$smarty->caching = false;
$smarty->cache_lifetime = 120;

require ABS_PATH.'core/functions.php';
require ABS_PATH.'core/init.php';

##########################################################
#############smarty's constants definition################
##########################################################
$smarty->assign('config',$cfg);
$smarty->assign('ABS_PATH',ABS_PATH);
$smarty->assign('PATH',PATH);

$tpl_folder_path = PATH.'tpl/'.$template['folder_name'];
$smarty->assign('tpl_folder_path',$tpl_folder_path);

$tpl_folder_absolute_path = ABS_PATH.'tpl/'.$template['folder_name'];
$smarty->setTemplateDir($tpl_folder_absolute_path.'/templates/');
$smarty->setCompileDir($tpl_folder_absolute_path.'/smarty/templates_c/');
$smarty->setConfigDir($tpl_folder_absolute_path.'/smarty/configs/');
$smarty->setCacheDir($tpl_folder_absolute_path.'/smarty/cache/');

##########################################################
####downloading template's file an loading tempplate######
#############existing file verification version###########
##########################################################
require ABS_PATH.'controllers/common.php'; // include home controllers file
require $tpl_folder_absolute_path.'/smarty/plugins/smarty_functions.php'; // include home controllers file

$page = new PageRouter();
$route = $page->getRoute($_GET['page']);
if($route['controller']!=""){require ABS_PATH.'controllers/'.$route['controller'];}
$smarty -> display($route['template']);


?>