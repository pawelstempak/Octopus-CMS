<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>{$config.project_title} - {$lang.inc_header_title_info}</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="{$PATH}common/materialize/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="{$tpl_folder_path}/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Bai+Jamjuree" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">

  <script src="{$PATH}common/tinymce/js/tinymce/tinymce.min.js" referrerpolicy="origin"></script>
  <script src="{$tpl_folder_path}/js/functions.js"></script>
	<script>	  tinymce.init({
    selector: '.myeditablediv',
	 height: 500,
	 menubar: false,
    plugins: [
      'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
      'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
      'save table directionality emoticons template paste code'
    ],
    toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons | code',
	 images_upload_url: '{$PATH_BACKEND}core/post_uppload.php',
	 images_upload_base_path: '{$PATH}images/',
	 images_upload_credentials: true
  });
  </script>
  </head>
<body>
<header>
<div id="loader-wrapper">
    <div class="load">

		  <div class="preloader-wrapper big active">
		    <div class="spinner-layer spinner-grey-only">
		      <div class="circle-clipper left">
		        <div class="circle"></div>
		      </div><div class="gap-patch">
		        <div class="circle"></div>
		      </div><div class="circle-clipper right">
		        <div class="circle"></div>
		      </div>
		    </div>
		  </div>

    </div>
</div>
	<ul id="dropdown1" class="dropdown-content">
	  <li><a href="{$PATH_BACKEND}profil" class="black-text"><i class="material-icons grey-text text-darken-3" style="float:left">account_circle</i>{$lang.inc_header_button_profile}</a></li>
	  <li><a href="{$PATH_BACKEND}logout" title="Logout" class="black-text"><i class="material-icons grey-text text-darken-3" style="float:left">power_settings_new</i>{$lang.inc_header_button_signout}</a></li>
	</ul>
  <nav class="black lighten-1" role="navigation">
    <div class="nav-wrapper">
      <ul class="right">
		  <li>
		  		<a class="white-text dropdown-trigger" data-target="dropdown1"><i class="material-icons white-text" style="float:left">account_circle</i>
				&nbsp;&nbsp;<span class="hide-on-med-and-up">{$signin_user.name|truncate:15:"..."}</span>
				<span class="hide-on-small-only">{$signin_user.name} {$signin_user.lastname}</span>
		  <i class="material-icons right">arrow_drop_down</i></a></li>
		  {if $pbackend_settings != 1}<li><a href="{$PATH_BACKEND}backend_settings" class="white-text"><i class="material-icons white-text tooltipped" data-position="bottom" data-tooltip="{$lang.backend_settings_backend_settings}" style="float:left">build_circle</i></a></li>{/if}
		  <li><a href="{$PATH_BACKEND}help" class="white-text"><i class="material-icons white-text tooltipped" data-position="bottom" data-tooltip="{$lang.inc_menu_help}" style="float:left">help</i></a></li>
		  <li><a href="{$PATH_BACKEND}logout" class="white-text"><i class="material-icons white-text tooltipped" data-position="bottom" data-tooltip="{$lang.inc_menu_signout}" style="float:left">power_settings_new</i></a></li>
      </ul>
		{include file="inc_menu.tpl"}
	   </div>
  </nav>
</header>