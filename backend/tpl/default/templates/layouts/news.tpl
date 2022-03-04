		        <div class="input-field">
					  		<ul class="tabs">
							  <li class="tab"><a href="#{$first_tab.code}"><img src="{$path}/images/flags/{$first_tab.code}.gif" /> {$first_tab.title}</a></li>
							  {foreach item=l from=$language_list}
					        <li class="tab"><a href="#{$l.code}"><img src="{$path}/images/flags/{$l.code}.gif" /> {$l.title}</a></li>
							  {/foreach}
					      </ul>
							<div class="box select-box-pad">
							 	{assign var="title" value={article_elements id_element=$smarty.get.id id_language=$first_tab.id_language element='pages_title'}}
								<div id="{$first_tab.code}">
									<div class="left">
										<div class="switch">
											<label>
												{$lang.single_page_menus_off}
												<input type="checkbox" onclick="checkbox_hs('element_{$first_tab.code}','lang_{$first_tab.code}','title_{$first_tab.code}','ctitle_{$first_tab.code}')" id="element_{$first_tab.code}"{if $title != ""} checked{elseif $frontend_language.code == $first_tab.code} checked{/if}>
												<span class="lever"></span>
												{$lang.single_page_menus_on}
											</label>
										</div>
									</div>
									<div class="left bold paddingl10" style="padding-top:2px;">
										<img src="{$path}/images/flags/{$first_tab.code}.gif" />&nbsp;{$lang.single_page_edit_language} {$first_tab.title}
							   	</div>
								  <br /><br />
								  <input type="hidden" name="lang_{$first_tab.id_language}" value="{$first_tab.id_language}" />
								  <div class="row{if $title == "" && $frontend_language.code != $first_tab.code} hide_this{/if}" id="lang_{$first_tab.code}">
										  <div class="input-field">
									        <input placeholder="{$lang.single_page_placeholder}" id="title_{$first_tab.code}" type="text" name="langid_{$first_tab.id_language}" class="validate" value="{$title}" required{if $title == "" && $smarty.get.page=="edit_pages"} disabled{elseif $frontend_language.code != $first_tab.code && $smarty.get.page == "create_pages"} disabled{/if}>
									        <label for="title_{$first_tab.code}">{$lang.single_page_page_title}</label>
									     </div>
									  </div>
								</div>
								{foreach item=l from=$language_list}
								{assign var="title" value={article_elements id_element=$smarty.get.id id_language=$l.id_language element='pages_title'}}
								<div id="{$l.code}">
									<div class="left">
										<div class="switch">
											<label>
												{$lang.single_page_menus_off}
												<input type="checkbox" onclick="checkbox_hs('element_{$l.code}','lang_{$l.code}','title_{$l.code}','ctitle_{$l.code}')" id="element_{$l.code}"{if $title != ""} checked{elseif $frontend_language.code == $l.code} checked{/if}>
												<span class="lever"></span>
												{$lang.single_page_menus_on}
											</label>
										</div>
									</div>
									<div class="left bold paddingl10" style="padding-top:2px;">
										<img src="{$path}/images/flags/{$l.code}.gif" />&nbsp;{$lang.single_page_edit_language} {$l.title}
							   	</div>
								  <br /><br />
								  <input type="hidden" name="lang_{$l.id_language}" value="{$l.id_language}" />
								  <div class="row{if $title == "" && $frontend_language.code != $l.code} hide_this{/if}" id="lang_{$l.code}">
										  <div class="input-field">
									        <input placeholder="{$lang.single_page_placeholder}" id="title_{$l.code}" type="text" name="langid_{$l.id_language}" class="validate" value="{$title}" required{if $title == "" && $smarty.get.page=="edit_pages"} disabled{elseif $frontend_language.code != $l.code && $smarty.get.page == "create_pages"} disabled{/if}>
									        <label for="title_{$l.code}">{$lang.single_page_page_title}</label>
									     </div>
									  </div>
								</div>
								{/foreach}
							</div>
							<br />
							<div class="box select-box-pad">
								<div class="bold">
									Połącz z treścią do wyświetlenia
								</div>
								<br />
								<div class="row">
									<div class="col s12 m12 l6">
 										<div class="input-field">
											<select name="mod_cat">
											<option value="0">Wszystkie</option>
											{foreach item=k from=$categories_list}
											<option value="{$k.id_module_cat_news}"{if {mod_cat_page id_pages=$smarty.get.id} == $k.id_module_cat_news} selected{/if}>{$k.title}</option>
											{/foreach}
											</select>
											<label>Wyświetl z kategorii</label>
										</div>
									</div>
								</div>
							</div>
						  </div>
					</div>