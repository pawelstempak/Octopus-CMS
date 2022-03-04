{include file="layouts/single_page.tpl"}
{*
				  {if $smarty.get.page != "create_pages"}
				  <div class="box select-box-pad">
						<div class="row">
					  		<div class="col s12 m6 l6">
								<div class="input-field">
								<i class="material-icons prefix grey-text">edit_calendar</i>
								<input type="text" name="created" id="created" value="{$page.created}" />
								<label for="created">Data utworzenia</label>
								</div>
							</div>
							<div class="col s12 m6 l6">
								<div class="input-field">
								<i class="material-icons prefix grey-text">person</i>
								<input type="text" name="created_by" id="created_by" value="{user id={$page.created_by}}" disabled />
								<label for="created_by">Utworzone przez</label>
								</div>
							</div>
					  </div>
				  </div>
				  {/if}
		        <div class="input-field">
					  		<ul class="tabs">
							  {foreach item=l from=$language_list}
					        <li class="tab"><a href="#{$l.code}"><img src="{$path}/images/flags/{$l.code}.gif" /> {$l.title}</a></li>
							  {/foreach}
					      </ul>
							<br />
							<div class="box select-box-pad">
							{foreach item=l from=$language_list}
							{assign var="title" value={article_elements id_element=$smarty.get.id id_language=$l.id_language element='pages_title'}}
							<div id="{$l.code}">
								<div class="left">
									<div class="switch">
										<label>
											Wył
											<input type="checkbox" onclick="checkbox_hs('element_{$l.code}','lang_{$l.code}','title_{$l.code}','ctitle_{$l.code}')" id="element_{$l.code}"{if $title != ""} checked{elseif $default_language.code == $l.code} checked{/if}>
											<span class="lever"></span>
											Wł
										</label>
									</div>
								</div>
								<div class="left bold paddingl10" style="padding-top:2px;">
									<img src="{$path}/images/flags/{$l.code}.gif" /> Edytuj język {$l.title}
						   	</div>
							  <br /><br />
							  <input type="hidden" name="lang_{$l.id_language}" value="{$l.id_language}" />
							  <div class="row{if $title == "" && $default_language.code != $l.code} hide_this{/if}" id="lang_{$l.code}">
							     <div class="col s12 m12 12">
									  <div class="input-field">
								        <input placeholder="Tu wpisz tytuł strony" id="title_{$l.code}" type="text" name="langid_{$l.id_language}" class="validate" value="{$title}" required{if $title == "" && $smarty.get.page=="edit_pages"} disabled{elseif $default_language.code != $l.code && $smarty.get.page == "create_pages"} disabled{/if}>
								        <label for="title_{$l.code}">Tytuł strony</label>
								     </div>
									  <div class="textarea-label">Treść strony</div>
									  <div class="input-field">
									  		<textarea name="clangid_{$l.id_language}" class="myeditablediv validate" id="ctitle_{$l.code}"{if $default_language.code != $l.code && $smarty.get.page == "create_pages"} disabled{/if}>{article_elements id_element=$smarty.get.id id_language=$l.id_language element='pages_content'}</textarea>
								     </div>
									  {if $smarty.get.page != "create_pages"}
									  <div>
										  <div class="right grey-text">
										  		Ostatnio zmodyfikowany {$page.modified} przez {user id={$page.modified_by}}
										  </div>
									  </div>
									  {/if}
								  </div>
							  </div>
							</div>
							{/foreach}
							</div>
					</div>
*}