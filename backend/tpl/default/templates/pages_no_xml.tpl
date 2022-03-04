{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">description</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.pages_pages}</h6></div>
			<div class="valign-wrapper right"><a class="waves-effect waves-light btn-small" href="{$PATH_BACKEND}create_pages">{$lang.pages_add_new_one}</a></div>
		</div>
		  {if $smarty.get.id=="ok"}{include file="inc_info_save.tpl"}{/if}
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header grey darken-2 white-text row row-table">
				 <div class="col s9 m9 l8 xl10 cursor-default">{$lang.pages_name}</div>
				 <div class="col s3 m3 l4 xl2 cursor-default right-align">{$lang.pages_edit}</div>
			 </div>
			 </li>
		  	 {foreach item=u from=$pages_list}
			 <li>
	       <div class="c-header row row-table">
			 	 <div class="col s9 m9 l8 xl10">{page_category id=$u.id_pages lang=$u.id_language element="menus" type="prime"} <a href="{$PATH_BACKEND}edit_pages/{$u.id_pages}">{$u.content}</a>
				 <span class="hide-on-small-only">{lang_badges id=$u.id_pages element="pages_title" lang=$u.id_language code=$u.code}</span>
				 </div>
				 <div class="col s3 m3 l4 xl2 right-align">
				 {if $u.status == 0}
				 	<a href="{$PATH_BACKEND}pages/show/{if $smarty.get.id}{$smarty.get.id}{else}1{/if}/{$u.id_pages}"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="{$lang.pages_show_button}">visibility_off</span></a>
				 {else}
				 	<a href="{$PATH_BACKEND}pages/hide/{if $smarty.get.id}{$smarty.get.id}{else}1{/if}/{$u.id_pages}"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="{$lang.pages_hide_button}">visibility</span></a>
				 {/if}
				 	<a href="{$PATH_BACKEND}edit_pages/{$u.id_pages}" class="hide-on-small-only"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="{$lang.pages_edit_button}">edit</span></a>
				 	<a href="#modal{$u.id_language_content}" class="modal-trigger"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="{$lang.pages_delete_button}">delete</span></a>
				 </div>
			 </div>
			 </li>
			 {include file="inc_info_delete_entry.tpl" page="pages" modal="{$u.id_language_content}" element = "{$u.id_element}" entry_value="{$u.content}"}
			 {/foreach}
			 {* pagination start *}
			 {include file="inc_pagination.tpl" page="pages"}
			 {* pagination end *}			
			</ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}