<?php
try
{
	$pdo = new PDO('mysql:host='.$cfg['database_url'].';dbname='.$cfg['database_name'], $cfg['database_login'], $cfg['database_password'], array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
}
catch(PDOException $e)
{
   echo 'Połączenie nie mogło zostać utworzone: ' . $e->getMessage();
}
?>