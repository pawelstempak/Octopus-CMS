{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">layers</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.templates_header}</h6></div>
			<div class="valign-wrapper right"><a class="waves-effect waves-light btn-small " href="{$PATH_BACKEND}create_template">{$lang.templates_add_new_one}</a></div>
		</div>
		  {if $smarty.get.id=="ok" or $smarty.get.action=="ok"}{include file="inc_info_save.tpl"}{/if}
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header grey darken-2 white-text row row-table">
				 <div class="col s3 m4 l3">{$lang.templates_col_name}</div>
				 <div class="col s3 m4 l3">{$lang.templates_col_folder}</div>
				 <div class="col s6 m4 l6">{$lang.templates_col_desc}</div>
			 </div>
			 </li>
		  	 {foreach item=u from=$templates_list}
			 <li {if $smarty.get.action_id==$u.id_templates}class="active"{/if}>
	       <div class="collapsible-header row row-table">
				 <div class="col s3 m4 l3">{$u.title}</div>
				 <div class="col s3 m4 l3">{$u.folder_name}</div>
				 <div class="col s6 m4 l6">{$u.description}</div>
			 </div>
			 <div class="collapsible-body grey lighten-4">
				    <form class="col s12" action="{$PATH_BACKEND}templates/save/{$u.id_templates}" method="post">
						  <div class="row">
						  	<div class="left"><h6 class="grey-text text-darken-2">{$lang.templates_edit_header} - <b>{$u.title}</b></h6></div>
							<div class="right"><button class="btn-small waves-effect waves-light marginr10" type="submit" name="zapisz">{$lang.templates_save}</button>{if $u.id_templates!="1"}<a href="#modal{$u.id_templates}" class="modal-trigger waves-effect waves-light btn-small">{$lang.templates_delete}</a>{/if}</div>
						  </div>
				      <div class="row">
				        <div class="input-field col s12 m12 l12">
				          <input id="title" name="title" type="text" value="{$u.title}">
				          <label for="title">{$lang.templates_edit_name}</label>
				        </div>
						</div>
				      <div class="row">
				        <div class="input-field col s12 m12 l12">
				          <input id="folder_name" name="folder_name" type="text" value="{$u.folder_name}">
				          <label for="folder_name">{$lang.templates_edit_folder_name}</label>
				        </div>
						</div>
				      <div class="row">
				        <div class="input-field col s12 m12 l12">
				          <input id="description" name="description" type="text" value="{$u.description}">
				          <label for="description">{$lang.templates_edit_desc}</label>
				        </div>
						</div>
				      <div class="row">
				        <div class="input-field col s12 m12 center">
				            <button class="btn waves-effect waves-light" type="submit" name="save">{$lang.templates_save}</button>
				        </div>
				      </div>
				    </form>
			 </div>
			 </li>
			  {include file="inc_info_delete_entry.tpl" page="templates" modal="{$u.id_templates}" element="{$u.id_templates}" entry_value="{$u.title}"}
			 {/foreach}
			 {* pagination start *}
			 {include file="inc_pagination.tpl" page="templates"}
			{* pagination end *}
			 </ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}