{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">apps</i><h6 class="grey-text text-darken-2"> &nbsp;Moduł {$module.title}</h6></div>
			<div class="valign-wrapper right"><a class="waves-effect waves-light btn-small" href="{$PATH_BACKEND_MODULES}{$module.restful_url}/categories">Menedżer kategorii</a>&nbsp;&nbsp;<a class="waves-effect waves-light btn-small" href="{$PATH_BACKEND_MODULES}{$module.restful_url}/create_news">{$lang.pages_add_new_one}</a></div>
		</div>
		  {if $smarty.get.id=="ok"}{include file="inc_info_save.tpl"}{/if}
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header grey darken-2 white-text row row-table">
				 <div class="col s5 m7 l8 cursor-default">{$lang.pages_name}</div>
				 <div class="col s7 m5 l4 cursor-default right-align">{$lang.pages_edit}</div>
			 </div>
			 </li>
		  	 {foreach item=u from=$module_news}
			 <li>
	       <div class="c-header row row-table">
			 	 <div class="col s5 m7 l8"><a href="{$PATH_BACKEND_MODULES}{$module.restful_url}/edit_news/{$u.id_module_news}">{$u.content}</a>
				 {lang_badges id=$u.id_module_news element="module_news_title" lang=$u.id_language code=$u.code}
				 {*<span class="new badge" data-badge-caption="{$u.code|upper}"></span>*}
				 </div>
				 <div class="col s7 m5 l4 right-align">
				 {if $u.status == 0}
				 	<a href="{$PATH_BACKEND_MODULES}{$module.restful_url}/start/{$u.id_module_news}/show"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="{$lang.pages_show_button}">visibility_off</span></a>
				 {else}
				 	<a href="{$PATH_BACKEND_MODULES}{$module.restful_url}/start/{$u.id_module_news}/hide"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="{$lang.pages_hide_button}">visibility</span></a>
				 {/if}
				 	<a href="{$PATH_BACKEND_MODULES}{$module.restful_url}/edit_news/{$u.id_module_news}"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="{$lang.pages_edit_button}">edit</span></a>
				 	<a href="#modal{$u.id_module_news}" class="modal-trigger"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="{$lang.pages_delete_button}">delete</span></a>
				 </div>
			 </div>
			 </li>
			 {include file="modules/{$module.restful_url}/inc_info_delete_entry.tpl" modal="{$u.id_module_news}" page="start" id_element="{$u.id_module_news}" action_id="{$smarty.get.id}" entry_value="{$u.content}"}
			 {/foreach}
			 {* pagination start *}
			 {include file="../../inc_pagination.tpl" page="start"}
			 {* pagination end *}	
			 </ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}