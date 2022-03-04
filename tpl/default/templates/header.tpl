<!DOCTYPE html>
<html lang="pl">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>{$settings.title}</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="{$PATH}common/materialize/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="{$tpl_folder_path}/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="{$tpl_folder_path}/css/animista.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Baloo+Tamma+2&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Bai+Jamjuree" rel="stylesheet">
</head>
<body>
  <nav class="light-blue darken-3" role="navigation">
    <div class="nav-wrapper container"><a id="logo-container" href="{$PATH}" class="brand-logo">LOGO</a>
      <ul class="right hide-on-med-and-down">
		{if {if_level type="prime"}}
		  {foreach item=u from=$menus_list}
			  {if {if_parent id_menu=$u.id_menu}}
		        <li><a class="dropdown-trigger" href="#!" data-target="dropdown{$u.id_menu}">{$u.content}<i class="material-icons right">arrow_drop_down</i></a></li>
				  {assign var=parent value=$u.id_menu}
  				  <ul id="dropdown{$parent}" class="dropdown-content">
			  {else}
				  <li><a href="{$PATH}{$u.restful_url}">{$u.content}</a></li>
				  {if {if_last_child parent_id=$parent}==$u.id_menu}</ul>{/if}
			  {/if}
		  {/foreach}
		{/if}
      </ul>
		{if {if_level type="prime"}==false}<div><a href="#" data-target="nav-mobile" class="sidenav-trigger" style="display:block;"><i class="material-icons">menu</i></a></div>{/if}
      <ul id="nav-mobile" class="sidenav">
		  <a href="{$PATH}" class="logo">LOGO</a>
		  {foreach item=u from=$menus_list}
        <li><a href="{$PATH}{$u.restful_url}">{if $u.level > 1}<i class="material-icons" style="font-size:1.2rem;padding-left:{($u.level-1)}0px;">subdirectory_arrow_right</i>{/if}{$u.content}</a></li>
		  {/foreach}
      </ul>
      {if {if_level type="prime"}}<a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>{/if}
    </div>
  </nav>