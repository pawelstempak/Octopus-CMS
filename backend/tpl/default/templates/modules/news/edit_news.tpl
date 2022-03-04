 {include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
				<form action="{$PATH_BACKEND_MODULES}{$module.restful_url}/edit_news/{$news.id_module_news}" method="post" enctype="multipart/form-data">
					<div class="row">
						<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">apps</i><h6 class="grey-text text-darken-2"> &nbsp;Edytuj wpis</h6></div>
						<div class="valign-wrapper right">
							<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save"><i class="material-icons left">edit_note</i>{$lang.create_pages_save_button}</button>
							<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save_close"><i class="material-icons left">done</i>{$lang.edit_pages_save_and_close}</button>
							<a class="btn cancel waves-effect waves-light" onclick="location='{$PATH_BACKEND_MODULES}{$module.restful_url}/start'"><i class="material-icons left">clear</i>Zamknij</a>
						</div>
					</div>
					{if $smarty.get.action=="ok"}{include file="inc_info_save.tpl"}{/if}
					<div class="box select-box-pad">
						<div class="input-field">
							<select name="id_cat_news">
		 					{foreach item=u from=$module_news}
							<option value="{$u.id_module_cat_news}"{if $news.id_module_cat_news == $u.id_module_cat_news} selected{/if}>{$u.title}</option>
							{/foreach}
							</select>
						<label>Kategoria wpisu</label>
						</div>
					</div>
		        <div class="input-field">
					  		<ul class="tabs">
							  <li class="tab"><a href="#{$first_tab.code}"><img src="{$path}/images/flags/{$first_tab.code}.gif" /> {$first_tab.title}</a></li>
							  {foreach item=l from=$language_list}
					        <li class="tab"><a href="#{$l.code}"><img src="{$path}/images/flags/{$l.code}.gif" /> {$l.title}</a></li>
							  {/foreach}
					      </ul>
							<div class="box select-box-pad">
							 	{assign var="title" value={article_elements id_element=$smarty.get.id id_language=$first_tab.id_language element='module_news_title'}}
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
									        <input placeholder="Tu wpisz tytuł wpisu" id="title_{$first_tab.code}" type="text" name="langid_{$first_tab.id_language}" class="validate" value="{$title}" required{if $title == "" && $smarty.get.page=="edit_news"} disabled{elseif $frontend_language.code != $first_tab.code && $smarty.get.page == "create_news"} disabled{/if}*}>
									        <label for="title_{$first_tab.code}">Tytuł wpisu</label>
									     </div>
										  <div class="textarea-label">Treść wpisu</div>
										  <div class="input-field">
										  		<textarea name="clangid_{$first_tab.id_language}" class="myeditablediv validate" id="ctitle_{$first_tab.code}"{if $frontend_language.code != $first_tab.code && $smarty.get.page == "create_news"} disabled{/if}>{article_elements id_element=$smarty.get.id id_language=$first_tab.id_language element='module_news_content'}</textarea>
									     </div>
										  <div>
											  <div class="right grey-text">
											  		{$lang.single_page_last_modify} {$news.modified} {$lang.single_page_by} {user id={$news.modified_by}}
											  </div>
										  </div>
									  </div>
								</div>
								{foreach item=l from=$language_list}
								{assign var="title" value={article_elements id_element=$smarty.get.id id_language=$l.id_language element='module_news_title'}}
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
									        <input placeholder="Tu wpisz tytuł wpisu" id="title_{$l.code}" type="text" name="langid_{$l.id_language}" class="validate" value="{$title}" required{if $title == "" && $smarty.get.page=="edit_news"} disabled{elseif $frontend_language.code != $l.code && $smarty.get.page == "create_news"} disabled{/if}>
									        <label for="title_{$l.code}">Tytuł wpisu</label>
									     </div>
										  <div class="textarea-label">Treść wpisu</div>
										  <div class="input-field">
										  		<textarea name="clangid_{$l.id_language}" class="myeditablediv validate" id="ctitle_{$l.code}"{if $frontend_language.code != $l.code && $smarty.get.page == "create_news"} disabled{/if}>{article_elements id_element=$smarty.get.id id_language=$l.id_language element='module_news_content'}</textarea>
									     </div>
										  <div>
											  <div class="right grey-text">
											  		{$lang.single_page_last_modify} {$news.modified} {$lang.single_page_by} {user id={$news.modified_by}}
											  </div>
										  </div>
									  </div>
								</div>
								{/foreach}
							</div>
					</div>
					<div class="box">
				      <div class="textarea-label">Galeria</div>
						<div class="file-field input-field">
							<div class="btn">
								<span>Dodaj zdjęcie</span>
								<input type="file" size="32" name="gallery_file" value="">
							</div>
							<div class="file-path-wrapper">
								<input class="file-path validate" type="text" name="gallery_file">
							</div>
						</div>
						{foreach item=im from=$images_list}
						<div class="fixed-action-btn" style="display:inline-block;position:relative;padding:30px 30px 0px 30px">
						  <img src="{$PATH}images/{$module.restful_url}/thumb/{$im.filename}" class="responsive-img circle">
						  <ul>
						    <li><a class="btn-floating grey darken-2" href="{$PATH_BACKEND_MODULES}{$module.restful_url}/edit_news/{$smarty.get.id}/delete/{$im.id_module_img_news}"><i class="material-icons">delete</i></a></li>
						    <li><a class="btn-floating grey darken-2" href="{$PATH}images/{$module.restful_url}/{$im.filename}"><i class="material-icons">preview</i></a></li>
						  </ul>
						</div>
						{/foreach}
					</div>
					<br />
						  <div class="box select-box-pad">
								<div class="row no-pad">
							  		<div class="col s12 m6 l6">
										<div class="input-field">
										<i class="material-icons prefix grey-text">edit_calendar</i>
										<input type="text" name="created" id="created" value="{$news.created}" />
										<label for="created">{$lang.edit_pages_create_date}</label>
										</div>
									</div>
									<div class="col s12 m6 l6">
										<div class="input-field">
										<i class="material-icons prefix grey-text">person</i>
										<input type="text" name="created_by" id="created_by" value="{user id={$news.created_by}}" disabled />
										<label for="created_by">{$lang.edit_pages_created_by}</label>
										</div>
									</div>
							  </div>
						  </div>
						<div class="row">
							<div class="input-field col s12 m12 center">
								<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save"><i class="material-icons left">edit_note</i>{$lang.create_pages_save_button}</button>
								<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save_close"><i class="material-icons left">done</i>{$lang.edit_pages_save_and_close}</button>
								<a class="btn cancel waves-effect waves-light" onclick="location='{$PATH_BACKEND_MODULES}{$module.restful_url}/start'"><i class="material-icons left">clear</i>Zamknij</a></div>
							</div>
						</div>
			</form>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}