{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">supervised_user_circle</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.users_groups_header}</h6></div>
			<div class="valign-wrapper right"><a class="waves-effect waves-light btn-small" href="{$PATH_BACKEND}create_backend_users_groups">{$lang.users_groups_add_new_one}</a></div>
		</div>
		  {if $smarty.get.id=="ok" or $smarty.get.action=="ok"}{include file="inc_info_save.tpl"}{/if}
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header grey darken-2 white-text row row-table">
				 <div class="col s6 m4 l2">{$lang.users_groups_col_name}</div>
				 <div class="col s6 m8 l10">{$lang.users_groups_col_backend_pages}</div>
			 </div>
			 </li>
		  	 {foreach item=u from=$backend_users_group_list}
			 <li {if $smarty.get.action_id==$u.id_users_groups}class="active"{/if}>
	       <div class="collapsible-header row row-table row_icons">
				 <div class="col s6 m4 l2">{$u.title}</div>
				 <div class="col s6 m8 l10">
				 {if $u.menus=="1"}<i class="material-icons tooltipped" data-position="bottom" data-tooltip="Menu strony">menu_book</i>{/if}
				 {if $u.pages=="1"}<i class="material-icons tooltipped" data-position="bottom" data-tooltip="Strony">library_books</i>{/if}
				 {if $u.layouts=="1"}<i class="material-icons tooltipped" data-position="bottom" data-tooltip="Układ stron">view_sidebar</i>{/if}
				 {if $u.modules=="1"}<i class="material-icons tooltipped" data-position="bottom" data-tooltip="Moduły">apps</i>{/if}
				 {if $u.widgets=="1"}<i class="material-icons tooltipped" data-position="bottom" data-tooltip="Widgety">widgets</i>{/if}
				 {if $u.templates=="1"}<i class="material-icons tooltipped" data-position="bottom" data-tooltip="Szablony">layers</i>{/if}
				 {if $u.language=="1"}<i class="material-icons tooltipped" data-position="bottom" data-tooltip="Języki">language</i>{/if}
				 {if $u.settings=="1"}<i class="material-icons tooltipped" data-position="bottom" data-tooltip="Ustawienia strony">settings</i>{/if}
				 {if $u.backend_users=="1"}<i class="material-icons tooltipped" data-position="bottom" data-tooltip="Administratorzy">manage_accounts</i>{/if}
				 {if $u.backend_settings=="1"}<i class="material-icons tooltipped" data-position="bottom" data-tooltip="Ustawienia zaplecza">build_circle</i>{/if}
				 </div>
			 </div>
			 <div class="collapsible-body grey lighten-4">
				    <form class="col s12" action="{$PATH_BACKEND}backend_users_groups/save/{$u.id_users_groups}" method="post">
						  <div class="row">
						  	<div class="left"><h6 class="grey-text text-darken-2">{$lang.users_groups_edit_curent} - <b>{$u.title}</b></h6></div>
							<div class="right"><button class="btn-small waves-effect waves-light marginr10" type="submit" name="zapisz">{$lang.users_groups_save}</button><a href="#modal{$u.id_users_groups}" class="modal-trigger waves-effect waves-light btn-small">{$lang.users_groups_delete}</a></div>
						  </div>
				      <div class="row">
				        <div class="input-field col s12 m12 l12">
				          <input id="title" name="title" type="text" value="{$u.title}">
				          <label for="title">{$lang.users_groups_name}</label>
				        </div>
						</div>
						<div class="row">
						  <div class="col s12 m12 l12">{$lang.users_groups_info}</div>
				        <div class="input-field col s12 m4 l3 center">
						      <label>
						        <input name="menus" value="1" type="checkbox" class="filled-in"{if $u.menus=="1"} checked{/if} />
						        <span>{$lang.users_groups_page_menu}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
							   <label>
						        <input name="pages" value="1" type="checkbox" class="filled-in"{if $u.pages=="1"} checked{/if} />
						        <span>{$lang.users_groups_pages}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
						      <label>
						        <input name="layouts" value="1" type="checkbox" class="filled-in"{if $u.layouts=="1"} checked{/if} />
						        <span>{$lang.users_groups_layouts}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
						      <label>
						        <input name="modules" value="1" type="checkbox" class="filled-in"{if $u.modules=="1"} checked{/if} />
						        <span>{$lang.users_groups_modules}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
							   <label>
						        <input name="widgets" value="1" type="checkbox" class="filled-in"{if $u.widgets=="1"} checked{/if} />
						        <span>{$lang.users_groups_widgets}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
						      <label>
						        <input name="templates" type="checkbox" value="1" class="filled-in"{if $u.templates=="1"} checked{/if} />
						        <span>{$lang.users_groups_templates}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
							   <label>
						        <input name="language" type="checkbox" value="1" class="filled-in"{if $u.language=="1"} checked{/if} />
						        <span>{$lang.users_groups_languages}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
						      <label>
						        <input name="settings" type="checkbox" value="1" class="filled-in"{if $u.settings=="1"} checked{/if} />
						        <span>{$lang.users_groups_settings}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
							   <label>
						        <input name="backend_users" type="checkbox" value="1" class="filled-in"{if $u.backend_users=="1"} checked{/if} />
						        <span>{$lang.users_groups_admins}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
						      <label>
						        <input name="backend_settings" type="checkbox" value="1" class="filled-in"{if $u.backend_settings=="1"} checked{/if} />
						        <span>{$lang.users_groups_backend_settings}</span>
						      </label>
					     </div>
						</div>
						<br />
				      <div class="row">
				        <div class="input-field col s12 m12 center">
				            <button class="btn waves-effect waves-light" type="submit" name="save">{$lang.users_groups_save}</button>
				        </div>
				      </div>
				    </form>
			 </div>
			 </li>
			 {include file="inc_info_delete_entry.tpl" page="backend_users_groups" modal="{$u.id_users_groups}" entry_value="{$u.title}" element = "{$u.id_users_groups}" language="{$default_language.id_language}"}
			 {/foreach}
			 {* pagination start *}
			 {include file="inc_pagination.tpl" page="backend_users_groups"}
			{* pagination end *}			 
			 </ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}