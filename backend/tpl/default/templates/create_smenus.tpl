{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
				<form action="{$PATH_BACKEND}create_smenus" method="post">
					<div class="row">
						<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">menu_open</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.create_smenus_add_secondary_menu}</h6></div>
						<div class="valign-wrapper right">
							<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save_close"><i class="material-icons left">done</i>{$lang.create_smenus_save}</button>
							<a class="btn cancel waves-effect waves-light" onclick="location='{$PATH_BACKEND}smenus'"><i class="material-icons left">clear</i>{$lang.create_smenus_close}</a>
						</div>
					</div>
				  <br />
				  <div>
				   <div class="row">
					  <div class="col s12 m12 l12">
					  		<ul class="tabs">
							  {foreach item=l from=$language_list}
					        <li class="tab"><a href="#{$l.code}"{if $l.id_language == $smarty.get.id} class="active"{/if}><img src="{$path}/images/flags/{$l.code}.gif" /> {$l.title}</a></li>
							  {/foreach}
					      </ul>
							<br />
							<div class="box" style="padding:20px;">
							{foreach item=l from=$language_list}
							<div id="{$l.code}">
								<div class="left">
									<div class="switch">
										<label>
											{$lang.create_smenus_off}
											<input type="checkbox" onclick="checkbox_hs('element_{$l.code}','lang_{$l.code}','title_{$l.code}')" id="element_{$l.code}"{if $l.id_language == $smarty.get.id} checked{/if}>
											<span class="lever"></span>
											{$lang.create_smenus_off}
										</label>
									</div>
								</div>
								<div class="left bold paddingl10" style="padding-top:2px;">
									<img src="{$path}/images/flags/{$l.code}.gif" /> {$lang.create_smenus_edit_language} {$l.title}
						   	</div>
							  <br /><br />
							  <div class="row{if $l.id_language != $smarty.get.id} hide_this{/if}" id="lang_{$l.code}">
							     <div class="col s12 m12 12">
									  <div class="input-field">
								        <input placeholder="{$lang.create_smenus_placeholder} - {$l.title}" id="title_{$l.code}" type="text" name="langid_{$l.id_language}" class="validate" required{if $l.id_language != $smarty.get.id} disabled{/if}>
								        <label for="title_{$l.code}">{$lang.create_smenus_label}</label>
								     </div>
								  </div>
							  </div>
							</div>
							{/foreach}
							</div>
							<br />
							<div class="box" style="padding:20px;">
								<div class="bold">
									{$lang.create_smenus_additional_options}
								</div>
								<br />
								  <div class="row">
									  <div class="col s12 m12 l6">
										  <div class="input-field">
												<select name="pages_id">
												<option value="0" selected>{$lang.create_smenus_select_page}</option>
							 					{foreach item=u from=$pages_list}
												<option value="{$u.id_pages}">{$u.content}</option>
												{/foreach}
												</select>
												<label>{$lang.create_smenus_link_page}</label>
										  </div>
									  </div>
									  <div class="col s12 m12 l6">
										  <div class="input-field">
									          <input placeholder="{$lang.create_smenus_restfulurl_placeholder}" id="restful_url" type="text" name="restful_url">
									          <label for="restful_url">{$lang.create_smenus_restful_url}</label>
										  </div>
									  </div>
								  </div>
								  <div class="row">
									  <div class="col s12 m12 l6">
										  <div class="input-field">
										    <select name="parent_id" {if $u.id_menu==1}disabled{/if}>
										      <option value="0">{$lang.create_smenus_none}</option>
												{foreach item=m from=$menus_list}
										      {if $m.id_menu!=1 and $m.id_menu != $smarty.get.id}<option value="{$m.id_menu}"{if $m.id_menu == $u.parent_id} selected{/if}>{if $m.level > 1}&nbsp;{section name=f start=1 loop=$m.level step=1}&#8250;{/section} {/if}{$m.content}</option>{/if}
												{/foreach}
										    </select>
										    <label>{$lang.create_smenus_parent_menu}</label>
										  </div>
									  </div>
									  <div class="col s12 m12 l6">
										  <div class="input-field">
										    <select name="status">
											 	<option value="1">{$lang.create_smenus_display}</option>
										      <option value="0">{$lang.create_smenus_hide}</option>
										    </select>
										    <label>{$lang.create_smenus_hide_in_parent}</label>
										  </div>
									  </div>
								  </div>
								</div>
							</div>
					  </div>
					</div>
					<div class="row">
						<div class="input-field col s12 m12 center">
							<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save_close"><i class="material-icons left">done</i>{$lang.create_smenus_save}</button>
							<a class="btn cancel waves-effect waves-light" onclick="location='{$PATH_BACKEND}smenus'"><i class="material-icons left">clear</i>{$lang.create_smenus_close}</a>
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