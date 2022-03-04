{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
  			<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">category</i><h6 class="grey-text text-darken-2">&nbsp;{$module.title}</h6></div>
			<div class="valign-wrapper right"><a class="waves-effect waves-light btn-small" href="{$PATH_BACKEND_MODULES}{$module.restful_url}/create_category">{$lang.pages_add_new_one}</a>&nbsp;&nbsp;<a class="waves-effect waves-light btn-small" href="{$PATH_BACKEND_MODULES}{$module.restful_url}/start">Zamknij</a></div>
		</div>
		  {if $smarty.get.id=="ok"}{include file="inc_info_save.tpl"}{/if}
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header grey darken-2 white-text row row-table">
				 <div class="col">Nazwa kategorii</div>
			 </div>
			 </li>
		  	 {foreach item=u from=$module_news}
			 <li>
	       <div class="collapsible-header row row-table">
				 <div class="col s12 m12 l12">{$u.title}</div>
			 </div>
			 <div class="collapsible-body grey lighten-4">
				    <form class="col s12" action="{$PATH_BACKEND_MODULES}{$module.restful_url}/categories/{$u.id_module_cat_news}/save" method="post">
						  <div class="row">
						  	<div class="left"><h6 class="grey-text text-darken-2">Edytuj wybraną kategorię - <b>{$u.title}</b></h6></div>
							<div class="right"><button class="btn-small waves-effect waves-light marginr10" type="submit" name="zapisz">{$lang.languages_save}</button><a href="#modal{$u.id_module_cat_news}" class="modal-trigger waves-effect waves-light btn-small">{$lang.languages_delete}</a></div>
						  </div>
				      <div class="row">
				        <div class="input-field col s12 m12 l12">
				          <input id="title" name="title" type="text" class="validate" value="{$u.title}" required>
				          <label for="title">Nazwa kategorii</label>
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
			 {include file="modules/{$module.restful_url}/inc_info_delete_entry.tpl" page="categories" modal="{$u.id_module_cat_news}" id_element="{$u.id_module_cat_news}" action_id="{$smarty.get.id}" entry_value="{$u.title} - {$u.code}"}
			 {/foreach}
			 {* pagination start *}
			 {include file="inc_pagination.tpl" page="categories"}
			 {* pagination end *}				 
			 </ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}