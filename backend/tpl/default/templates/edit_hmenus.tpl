{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
				<form action="{$PATH_BACKEND}edit_hmenus/{$smarty.get.id}" method="post">
					<div class="row">
						<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">menu</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.edit_hmenus_edit_primary_menu}</h6></div>
						<div class="valign-wrapper right">
							<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save"><i class="material-icons left">edit_note</i>{$lang.edit_hmenus_save}</button>
							<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save_close"><i class="material-icons left">done</i>{$lang.edit_hmenus_save_and_close}</button>
							<a class="btn cancel waves-effect waves-light" onclick="location='{$PATH_BACKEND}hmenus'"><i class="material-icons left">clear</i>{$lang.edit_hmenus_close}</a>
						</div>
					</div>
			  {if $smarty.post.save == "ok"}
					{include file="inc_info_save.tpl"}
			  {/if}
				  <br />
				  <div>
				   <div class="row">
					  <div class="col s12 m12 l12">
					  		<ul class="tabs">
							  {foreach item=l from=$language_list}
					        <li class="tab"><a href="#{$l.code}"{if $l.id_language == $smarty.get.action} class="active"{/if}><img src="{$path}/images/flags/{$l.code}.gif" /> {$l.title}</a></li>
							  {/foreach}
					      </ul>
							<br />
							<div class="box" style="padding:20px;">
							{foreach item=l from=$language_list}
							<div id="{$l.code}">
								<div class="left">
									<div class="switch">
										<label>
											{$lang.edit_hmenus_off}
											<input type="checkbox" onclick="checkbox_hs('element_{$l.code}','lang_{$l.code}','title_{$l.code}')" id="element_{$l.code}" {menu_check_name id_menu=$u.id_menu id_language=$l.id_language}>
											<span class="lever"></span>
											{$lang.edit_hmenus_on}
										</label>
									</div>
								</div>
								<div class="left bold paddingl10" style="padding-top:2px;">
									<img src="{$path}/images/flags/{$l.code}.gif" /> {$lang.edit_hmenus_edit_language} {$l.title}
						   	</div>
							  <br /><br />
							  <div class="row {menu_hide_name id_menu=$u.id_menu id_language=$l.id_language}" id="lang_{$l.code}">
							     <div class="col s12 m12 12">
									  <div class="input-field">
								        <input placeholder="{$lang.edit_smenus_placeholder} - {$l.title}" id="title_{$l.code}" type="text" name="langid_{$l.id_language}" class="validate" required {menu_lang_name id_menu=$u.id_menu id_language=$l.id_language}>
								        <label for="title_{$l.code}">{$lnag.edit_smenus_label}</label>
								     </div>
								  </div>
							  </div>
							</div>
							{/foreach}
							</div>
							<br />
							<div class="box" style="padding:20px;">
								<div class="bold">
									{$lang.edit_hmenus_additional_options}
								</div>
								<br />
								  <div class="row">
								  	  <div class="col s12 m12 l6">
										<div class="input-field">
											<select name="pages_id">
											<option value="0"{if $u.id_pages == 0} selected{/if}>{$lang.edit_hmenus_parent_none}</option>
						 					{foreach item=k from=$pages_list}
											<option value="{$k.id_pages}"{if $u.id_pages == $k.id_pages} selected{/if}>{page_category id=$k.id_pages lang=$u.id_language element="menus" type="prime"} {$k.content}</option>
											{/foreach}
											</select>
										<label>{$lang.edit_hmenus_link_page}</label>
										</div>
									  </div>
									  <div class="col s12 m12 l6">
										  <div class="input-field">
									          <input placeholder="{$lang.edit_hmenus_restfulurl_placeholder}" id="restful_url" type="text" name="restful_url" value="{$u.restful_url}" {if $u.id_menu==1}disabled{/if}>
									          <label for="restful_url">{$lang.edit_hmenus_restful_url}</label>
										  </div>
									  </div>
								  </div>
								  <div class="row">
									  <div class="col s12 m12 l6">
										  <div class="input-field">
										    <select name="parent_id" {if $u.id_menu==1}disabled{/if}>
										      <option value="0">{$lang.edit_hmenus_none}</option>
												{foreach item=m from=$menus_list}
										      {if $m.id_menu!=1 and $m.id_menu != $smarty.get.id}<option value="{$m.id_menu}"{if $m.id_menu == $u.parent_id} selected{/if}>{if $m.level > 1}&nbsp;{section name=f start=1 loop=$m.level step=1}&#8250;{/section} {/if}{$m.content}</option>{/if}
												{/foreach}
										    </select>
										    <label>{$lang.edit_hmenus_parent_menu}</label>
										  </div>
									  </div>
									  <div class="col s12 m12 l6">
										  <div class="input-field">
										    <select name="status">
											 	<option value="1"{if $u.status == 1} selected{/if}>{$lang.edit_hmenus_display}</option>
										      <option value="0"{if $u.status == 0} selected{/if}>{$lang.edit_hmenus_hide}</option>
										    </select>
										    <label>{$lang.edit_hmenus_hide_in_parent}</label>
										  </div>
									  </div>
								</div>
							</div>
					  </div>
					</div>
					<div class="row">
						<div class="input-field col s12 m12 center">
							<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save"><i class="material-icons left">edit_note</i>{$lang.edit_hmenus_save}</button>
							<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save_close"><i class="material-icons left">done</i>{$lang.edit_hmenus_save_and_close}</button>
							<a class="btn cancel waves-effect waves-light" onclick="location='{$PATH_BACKEND}hmenus'"><i class="material-icons left">clear</i>{$lang.edit_hmenus_close}</a>
						</div>
					</div>
				  </div>
			</form>

		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}