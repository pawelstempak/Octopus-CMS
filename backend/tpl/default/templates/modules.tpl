{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">apps</i><h6 class="grey-text text-darken-2"> &nbsp;Moduły</h6></div>
			<div class="valign-wrapper right"><a class="waves-effect waves-light btn-small" href="create_modules">Dodaj nowy</a></div>
		</div>
		  {if $smarty.get.id=="ok" or $smarty.get.action=="ok"}{include file="inc_info_save.tpl"}{/if}
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header grey darken-2 white-text row row-table">
				 <div class="col s3 m4 l3">Nazwa</div>
				 <div class="col s3 m4 l3">Folder</div>
				 <div class="col s6 m4 l6">Opis</div>
			 </div>
			 </li>
		  	 {foreach item=u from=$modules_list}
			 <li {if $smarty.get.action_id==$u.id_modules}class="active"{/if}>
	       <div class="collapsible-header row row-table">
				 <div class="col s3 m4 l3">{$u.title}</div>
				 <div class="col s3 m4 l3">{$u.tfile}</div>
				 <div class="col s6 m4 l6">{$u.cfile}</div>
			 </div>
			 <div class="collapsible-body grey lighten-4">
				    <form class="col s12" action="{$PATH_BACKEND}templates/save/{$u.id_templates}" method="post">
						  <div class="row">
						  	<div class="left"><h6 class="grey-text text-darken-2">Edytuj wybrany moduł - <b>{$u.title}</b></h6></div>
							<div class="right"><button class="btn-small waves-effect waves-light marginr10" type="submit" name="zapisz">Zapisz</button><a href="#modal{$u.id_modules}" class="modal-trigger waves-effect waves-light btn-small">Usuń wpis</a></div>
						  </div>
				      <div class="row">
				        <div class="input-field col s12 m12 l12">
				          <input id="title" name="title" type="text" value="{$u.title}">
				          <label for="title">Nazwa modułu</label>
				        </div>
						</div>
				      <div class="row">
				        <div class="input-field col s12 m12 center">
				            <button class="btn waves-effect waves-light" type="submit" name="save">Zapisz</button>
				        </div>
				      </div>
				    </form>
			 </div>
			 </li>
			  {include file="inc_info_delete_entry.tpl" page="modules" modal="{$u.id_modules}" entry_value="{$u.title}" element="{$u.id_modules}"}
			 {/foreach}
			 {* pagination start *}
			 {include file="inc_pagination.tpl" page="modules"}
			 {* pagination end *}
			 </ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}