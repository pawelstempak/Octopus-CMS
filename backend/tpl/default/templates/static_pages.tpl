{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">description</i><h6 class="grey-text text-darken-2"> &nbsp;Strony</h6></div>
			<div class="valign-wrapper right"><a class="waves-effect waves-light btn-small" href="{$PATH_BACKEND}create_pages">Dodaj nową</a></div>
		</div>
		  {if $smarty.get.id=="ok"}
				<div class="info row card-panel grey lighten-4">
				<div class="col s6 m6 l6"><h6>Dane w przesłanym formularzu zostały zapisane.</h6></div>
			   <div class="col s6 m6 l6 right-align"><a class="btn closeCard green  white-text">Zamknij</a></div>
				</div>
		  {/if}
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header grey darken-2 white-text row row-table">
				 <div class="col s5 m7 l8 cursor-default">Nazwa</div>
				 <div class="col s7 m5 l4 cursor-default right-align">Edycja</div>
			 </div>
			 </li>
		  	 {foreach item=u from=$pages_list}
			 <li>
	       <div class="c-header row row-table">
			 	 <div class="col s5 m7 l8"><a href="{$PATH_BACKEND}edit_pages/{$u.id_pages}">{$u.content}</a></div>
				 <div class="col s7 m5 l4 right-align">
				 {if $u.status == 0}
				 	<a href="{$PATH_BACKEND}pages/show/{$u.id_pages}"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="Pokaż">visibility_off</span></a>
				 {else}
				 	<a href="{$PATH_BACKEND}pages/hide/{$u.id_pages}"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="Ukryj">visibility</span></a>
				 {/if}
				 	<a href="{$PATH_BACKEND}edit_pages/{$u.id_pages}"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="Edytuj">edit</span></a>
				 	<a href="#modal{$u.id_pages}" class="modal-trigger"><span class="material-icons tooltipped" data-position="bottom" data-tooltip="Usuń">delete</span></a>
				 </div>
			 </div>
			 </li>
			  <div id="modal{$u.id_pages}" class="modal">
			    <div class="modal-content center"><br /><br />
			      <h4>Czy na pewno chcesz usunąć tą stronę?</h4>
					<p><b>"{$u.content}"</b></p>
			      <p>Strona zostanie usunięta.</p><br /><a href="{$PATH_BACKEND}pages/delete/{$u.id_pages}"><button class="btn waves-effect waves-light">Tak, usuń tą stronę</button></a>
			    </div>
			    <div class="modal-footer">
			      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat"><b>Nie kasuj</b></a>
			    </div>
			  </div>
			 {/foreach}
			 </ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}