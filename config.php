<?php
#####################################################################################
########################### Configuration config.php file ###########################
#####################################################################################
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
ini_set('display_errors', 'On' );
error_reporting( E_ALL ^ E_NOTICE);

DEFINE('ABS_PATH',__DIR__.'/');
DEFINE('ABS_PATH_BACKEND',__DIR__.'/backend/');
isset($_SERVER['HTTPS'])?$server_path='https://'.$_SERVER['SERVER_NAME'].'/':$server_path='http://'.$_SERVER['SERVER_NAME'].'/';
DEFINE('PATH',$server_path);
DEFINE('PATH_BACKEND',PATH.'backend/');
DEFINE('PATH_BACKEND_MODULES',PATH.'modules/');

require_once 'db.php';

$cfg['email'] = "pawelstempak@gmail.com";
$cfg['email_admin'] = "pawelstempak@gmail.com";
$cfg['title'] = "Octopus";
$cfg['project_title'] = "Octopus CMS";
$cfg['full_project_title'] = "Octopus - Content Managment System";
$cfg['ver']='0.0.9.9'; //wersja

date_default_timezone_set('Europe/Warsaw');

$hidden_hash_var='&9Jnd3kdf650emk&*9fmdk97883(*8hnK)';

?>