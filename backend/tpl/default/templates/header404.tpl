<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Octopus ver {$config.ver}</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="{$PATH}common/materialize/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="{$tpl_folder_path}/css/style_unauthorized.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Bai+Jamjuree" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
</head>
<body>
<header>
	<ul id="dropdown1" class="dropdown-content">
	  <li><a href="settings" class="black-text"><i class="material-icons grey-text text-darken-3" style="float:left">settings</i>Ustawienia</a></li>
	  <li><a href="logout" title="Logout" class="black-text"><i class="material-icons grey-text text-darken-3" style="float:left">power_settings_new</i>Wyloguj</a></li>
	</ul>
  <nav class="black lighten-1" role="navigation">
    <div class="nav-wrapper container">
      <ul class="right">
		  <li><a class="white-text dropdown-trigger" data-target="dropdown1"><i class="material-icons white-text text-darken-4" style="float:left">account_circle</i> &nbsp;&nbsp;{$signin_user.name} {$signin_user.lastname}<i class="material-icons right">arrow_drop_down</i></a></li>
      </ul>
	   </div>
  </nav>
</header>