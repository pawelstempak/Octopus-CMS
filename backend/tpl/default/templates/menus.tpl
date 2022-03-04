{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">menu</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.menus_primary_menu}</h6></div>
			<div class="valign-wrapper right"><a class="waves-effect waves-light btn-small " href="{$PATH_BACKEND}create_menus/{$menu_lang}">{$lang.menus_add_new_one}</a></div>
		</div>
		  {if $smarty.get.id=="ok"}{include file="inc_info_save.tpl"}{/if}
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header grey darken-2 white-text row row-table">
				 <div class="col s5 m7 l8 cursor-default">{$lang.menus_menu_name}</div>
				 <div class="col s7 m5 l4 cursor-default right-align">{$lang.menus_edit}</div>
			 </div>
			 </li>
			 <li>
		 	 <form action="menus" method="post">
	       <div class="collapsible-header row row-table">
				 <div class="col cursor-default">
				    	<div class="row valign-wrapper row-table">
						<div class="col">{$lang.menus_language}</div>
						<div class="col no-pad">
						 <select class="browser-default min-select" name="language_list" onchange="this.form.submit()">
						  {foreach item=l from=$lang_list}
					      <option value="{$l.id_language}"{if $menu_lang == $l.id_language} selected{/if}>{$l.title}</option>
						   {/foreach}
					    </select>
						 </div>
					 	</div>
				 </div>
				 <div class="col cursor-default">
				    	<div class="row valign-wrapper row-table">
						<div class="col" style="margin-left:10px">{$lang.menus_or}</div>
						<div class="col">
							<input id="search" placeholder="{$lang.menus_search_info}" type="search" class="browser-default min-input" name="search" onkeyup="ShowSearchResult(this.value,'{$PATH_BACKEND}','prime')">
						</div>
					 	</div>
				 </div>
			 </div>
		 	 </form>
			 </li>
			 <div id="livesearch"></div>
			 <div id="result">
		  	 {foreach item=u from=$menus_list}
			 <li>
	       <div class="c-header row row-table{if $u.parent_id ==0} grey lighten-4 bold{/if}">
			 	 <div class="col s5 m7 l8">{if $u.level > 1}<i class="material-icons" style="font-size:1.2rem;padding-left:{($u.level-2)*2}0px;">subdirectory_arrow_right</i>{/if}<a href="{$PATH_BACKEND}edit_menus/{$u.id_language}/{$u.id_menu}">{$u.content}</a>
				 {lang_badges id=$u.id_menu element="menus" lang=$u.id_language code=$u.code}
				 </div>
				 <div class="col s7 m5 l4 right-align">
				 {if $u.home == 1}<span class="material-icons tooltipped green-text text-lighten-2" data-position="bottom" data-tooltip="{$lang.menus_main_menu}">star</span>{else}<a href="{$PATH_BACKEND}menus/set_home_link/{$u.id_menu}"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="{$lang.menus_set_main_menu}">star</span></a>{/if}
				 {if $u.status == 0}<span class="material-icons grey-text text-darken-2">visibility_off</span>{/if}
						{if $u.sort != {check_max parent_id=$u.parent_id type="prime"}}<a href="{$PATH_BACKEND}menus/lower/{$u.id_menu}"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="{$lang.menus_lower_button}">expand_more</span></a>{else}<span class="material-icons grey-text text-lighten-2">expand_more</span>{/if}
						{if $u.sort != {check_min parent_id=$u.parent_id type="prime"}}<a href="{$PATH_BACKEND}menus/upper/{$u.id_menu}"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="{$lang.menus_higher_button}">expand_less</span></a>{else}<span class="material-icons grey-text text-lighten-2">expand_less</span>{/if}
				 	<a href="{$PATH_BACKEND}edit_menus/{$u.id_language}/{$u.id_menu}"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="{$lang.menus_edit_button}">edit</span></a>
				 	<a href="#modal{$u.id_menu}" class="modal-trigger"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="{$lang.menus_delete_button}">delete</span></a>
				 </div>
			 </div>
			 </li>
			  {include file="inc_info_delete_entry.tpl" page="menus" modal="{$u.id_menu}" entry_value="{$u.content}" element = "{$u.id_element}" language="{$u.id_language}"}
			 {/foreach}
			 </div>
			 </ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}