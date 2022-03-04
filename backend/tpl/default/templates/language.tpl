{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">language</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.languages_header}</h6></div>
			<div class="valign-wrapper right"><a class="waves-effect waves-light btn-small " href="{$PATH_BACKEND}create_language">{$lang.languages_add_new_one}</a></div>
		</div>
		  {if $smarty.get.id=="ok" or $smarty.get.action=="ok"}{include file="inc_info_save.tpl"}{/if}
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header grey darken-2 white-text row row-table">
				 <div class="col s8 m9 l10">{$lang.languages_name}</div>
				 <div class="col s4 m3 l2">{$lang.languages_code}</div>
			 </div>
			 </li>
		  	 {foreach item=u from=$language_list}
			 <li {if $smarty.get.action_id==$u.id_language}class="active"{/if}>
	       <div class="collapsible-header row row-table">
				 <div class="col s8 m9 l10">{$u.title}</div>
				 <div class="col s4 m3 l2">{$u.code}</div>
			 </div>
			 <div class="collapsible-body grey lighten-4">
				    <form class="col s12" action="{$PATH_BACKEND}language/save/{$u.id_language}" method="post">
						  <div class="row">
						  	<div class="left"><h6 class="grey-text text-darken-2">Edytuj wybrany język - <b>{$u.title}</b></h6></div>
							<div class="right"><button class="btn-small waves-effect waves-light marginr10" type="submit" name="zapisz">{$lang.languages_save}</button><a href="#modal{$u.id_language}" class="modal-trigger waves-effect waves-light btn-small">{$lang.languages_delete}</a></div>
						  </div>
				      <div class="row">
				        <div class="input-field col s12 m12 l12">
				          <input id="title" name="title" type="text" class="validate" value="{$u.title}" required>
				          <label for="title">{$lang.languages_edit_name}</label>
				        </div>
						</div>
				      <div class="row">
				        <div class="input-field col s12 m12 l12">
				          <input id="code" name="code" type="text" class="validate" value="{$u.code}" required data-length="2">
				          <label for="code">{$lang.languages_edit_code}</label>
				        </div>
						</div>
				      <div class="row">
				        <div class="input-field col s12 m12 center">
				            <button class="btn waves-effect waves-light" type="submit" name="save">{$lang.languages_save}</button>
				        </div>
				      </div>
				    </form>
			 </div>
			 </li>
			 {include file="inc_info_delete_entry.tpl" page="language" modal="{$u.id_language}" element="{$u.id_language}" entry_value="{$u.title} - {$u.code}"}
			 {/foreach}
			 {* pagination start *}
			 {include file="inc_pagination.tpl" page="language"}
			{* pagination end *}
			 </ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}