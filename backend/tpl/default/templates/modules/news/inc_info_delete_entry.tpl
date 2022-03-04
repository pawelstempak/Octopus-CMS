			  <div id="modal{$id_element}" class="modal">
			    <div class="modal-content center"><br /><br />
			      <h4>{$lang.inc_info_delete_entry_info1}</h4>
					<p><b>"{$entry_value}"</b></p>
			      <p>{$lang.inc_info_delete_entry_info2}</p><br /><a href="{$PATH_BACKEND_MODULES}{$module.restful_url}/{$page}/{$id_element}/delete{if $smarty.get.id and $smarty.get.id!="ok"}/{$smarty.get.id}{/if}"><button class="btn waves-effect waves-light">{$lang.inc_info_delete_entry_delete}</button></a>
			    </div>
			    <div class="modal-footer">
			      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat"><b>{$lang.inc_info_delete_entry_back}</b></a>
			    </div>
			  </div>