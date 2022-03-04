{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">view_sidebar</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.layouts_header}</h6></div>
			<div class="valign-wrapper right"><a class="waves-effect waves-light btn-small" href="{$PATH_BACKEND}create_layouts">{$lang.layouts_add_new_one}</a></div>
		</div>
		  {if $smarty.get.id=="ok"}{include file="inc_info_save.tpl"}{/if}
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header grey darken-2 white-text row row-table">
				 <div class="col">{$lang.layouts_layouts_list}</div>
			 </div>
			 </li>
		  	 {foreach item=u from=$layouts_list}
			 <li {if $smarty.get.action_id==$u.id_layouts}class="active"{/if}>
	       <div class="collapsible-header row row-table">
				 <div class="col">{$u.title}</div>
			 </div>
			 <div class="collapsible-body grey lighten-4">
				    <form class="col s12" action="{$PATH_BACKEND}layouts/save/{$u.id_layouts}" method="post">
						  <div class="row">
						  	<div class="left"><h6 class="grey-text text-darken-2">{$lang.layouts_edit} - <b>{$u.title}</b></h6></div>
							<div class="right"><button class="btn-small waves-effect waves-light marginr10" type="submit" name="zapisz">{$lang.layouts_save}</button><a href="#modal{$u.id_layouts}" class="modal-trigger waves-effect waves-light btn-small">{$lang.layouts_delete_entry}</a></div>
						  </div>
				      <div class="row">
				        <div class="input-field col s12 m12 l12">
				          <input id="title" name="title" type="text" value="{$u.title}">
				          <label for="title">{$lang.layouts_new_layout_name}</label>
				        </div>
						</div>
				      <div class="row">
				        <div class="input-field col s12 m12 l12">
				          <input id="tfile" name="tfile" type="text" value="{$u.tfile}">
				          <label for="tfile">{$lang.layouts_template_file}</label>
				        </div>
						</div>
				      <div class="row">
				        <div class="input-field col s12 m12 l12">
				          <input id="cfile" name="cfile" type="text" value="{$u.cfile}">
				          <label for="cfile">{$lang.layouts_controller_file}</label>
				        </div>
						</div>
				      <div class="row">
				        <div class="input-field col s12 m12 center">
				            <button class="btn waves-effect waves-light" type="submit" name="save">{$lang.layouts_save}</button>
				        </div>
				      </div>
				    </form>
			 </div>
			 </li>
			 {include file="inc_info_delete_entry.tpl" page="layouts" modal="{$u.id_layouts}" entry_value="{$u.title}" element="{$u.id_layouts}"}
			 {/foreach}
			 {* pagination start *}
			 {include file="inc_pagination.tpl" page="layouts"}
			 {* pagination end *}				 
			 </ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}