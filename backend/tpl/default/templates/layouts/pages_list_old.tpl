		        <div class="input-field">
					  		<ul class="tabs">
							  {foreach item=l from=$language_list}
					        <li class="tab"><a href="#{$l.code}"><img src="{$path}/images/flags/{$l.code}.gif" /> {$l.title}</a></li>
							  {/foreach}
					      </ul>
							<div class="box select-box-pad">
							{foreach item=l from=$language_list}
							{assign var="title" value={article_elements id_element=$smarty.get.id id_language=$l.id_language element='pages_title'}}
							<div id="{$l.code}">
								<div class="left">
									<div class="switch">
										<label>
											{$lang.pages_list_menus_off}
											<input type="checkbox" onclick="checkbox_hs('element_{$l.code}','lang_{$l.code}','title_{$l.code}','ctitle_{$l.code}')" id="element_{$l.code}"{if $title != ""} checked{elseif $default_language.code == $l.code} checked{/if}>
											<span class="lever"></span>
											{$lang.pages_list_menus_on}
										</label>
									</div>
								</div>
								<div class="left bold paddingl10" style="padding-top:2px;">
									<img src="{$path}/images/flags/{$l.code}.gif" />&nbsp;{$lang.pages_list_edit_language} {$l.title}
						   	</div>
							  <br /><br />
							  <input type="hidden" name="lang_{$l.id_language}" value="{$l.id_language}" />
							  <div class="row{if $title == "" && $default_language.code != $l.code} hide_this{/if}" id="lang_{$l.code}">
									  <div class="input-field">
								        <input placeholder="{$lang.pages_list_placeholder}" id="title_{$l.code}" type="text" name="langid_{$l.id_language}" class="validate" value="{$title}" required{if $title == "" && $smarty.get.page=="edit_pages"} disabled{elseif $default_language.code != $l.code && $smarty.get.page == "create_pages"} disabled{/if}>
								        <label for="title_{$l.code}">{$lang.pages_list_page_title}</label>
								     </div>
									 <div class="input-field">
										 <ul>
										 {if $smarty.get.page == "edit_pages"}
										 <li>
											<div class="p-header grey lighten-2 grey-text row row-table">
												<div class="col s12 m12 l12">{$lang.pages_list_select_pages}</div>
											</div>
										 </li>
									  	 {foreach item=u from=$pages_list}
											 {if $l.id_language==$u.id_language}
											 <li>
										       <div class="c-header row row-table pages_list">
												 	 <div class="col s5 m7 l8"><a href="{$PATH_BACKEND}edit_pages/{$u.id_pages}">{$u.content}</a></div>
													 <div class="col s7 m5 l4 right-align">
													 {if {if_page_list id=$smarty.get.id action_id=$u.id_pages action=$u.id_language}==$u.id_pages}<a href="{$PATH_BACKEND}edit_pages/{$u.id_language}/{$smarty.get.id}/{$u.id_pages}">{$lang.pages_list_delete_button}</a>{else}<a href="{$PATH_BACKEND}edit_pages/{$u.id_language}/{$smarty.get.id}/{$u.id_pages}">{$lang.pages_list_add_button}</a>{/if}
													 </div>
												 </div>
											 </li>
											 {/if}
										 {/foreach}
										 {/if}
										 </ul>
									 </div>
									 {if $smarty.get.page != "create_pages"}
									  <div>
										  <div class="right grey-text">
										  		{$lang.single_page_last_modify} {$page.modified} {$lang.single_page_by} {user id={$page.modified_by}}
										  </div>
									  </div>
									  {/if}
							  </div>
							</div>
							{/foreach}
							</div>
					</div>