{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
			<div style="margin:0px auto">
				<form action="{$PATH_BACKEND}create_backend_users_groups" method="post">
					<div class="row">
						<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">groups</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.create_users_groups_header}</h6></div>
						<div class="valign-wrapper right"><button class="btn waves-effect waves-light btn marginr10" type="submit" name="save">{$lang.create_users_groups_save}</button><a class="btn waves-effect waves-light" href="{$BACKEND_PATH}backend_users_groups">{$lang.create_users_groups_close}</a></div>
					</div>
				  <br />
				      <div class="row">
				        <div class="col s12 m12 l12">
					        <div class="input-field">
					          <input placeholder="{$lang.create_users_groups_placeholder_name}" id="title" type="text" name="title" class="validate" required>
					          <label for="title">{$lang.create_users_groups_name}</label>
					        </div>
						  </div>
						</div>
						<div class="row">
						  <div class="col s12 m12 l12">{$lang.create_users_groups_info}	</div>
				        <div class="input-field col s12 m4 l3 center">
						      <label>
						        <input name="menus" value="1" type="checkbox" class="filled-in"{if $u.menus=="1"} checked{/if} />
						        <span>{$lang.create_users_groups_page_menu}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
							   <label>
						        <input name="pages" value="1" type="checkbox" class="filled-in"{if $u.pages=="1"} checked{/if} />
						        <span>{$lang.create_users_groups_pages}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
						      <label>
						        <input name="layouts" value="1" type="checkbox" class="filled-in"{if $u.layouts=="1"} checked{/if} />
						        <span>{$lang.users_groups_layouts}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
						      <label>
						        <input name="modules" value="1" type="checkbox" class="filled-in"{if $u.modules=="1"} checked{/if} />
						        <span>{$lang.users_groups_modules}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
							   <label>
						        <input name="widgets" value="1" type="checkbox" class="filled-in"{if $u.widgets=="1"} checked{/if} />
						        <span>{$lang.users_groups_widgets}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
						      <label>
						        <input name="templates" type="checkbox" value="1" class="filled-in"{if $u.templates=="1"} checked{/if} />
						        <span>{$lang.users_groups_templates}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
							   <label>
						        <input name="language" type="checkbox" value="1" class="filled-in"{if $u.language=="1"} checked{/if} />
						        <span>{$lang.users_groups_languages}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
						      <label>
						        <input name="settings" type="checkbox" value="1" class="filled-in"{if $u.settings=="1"} checked{/if} />
						        <span>{$lang.users_groups_settings}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
							   <label>
						        <input name="backend_users" type="checkbox" value="1" class="filled-in"{if $u.backend_users=="1"} checked{/if} />
						        <span>{$lang.users_groups_admins}</span>
						      </label>
						  </div>
						  <div class="input-field col s12 m4 l3 center">
						      <label>
						        <input name="backend_settings" type="checkbox" value="1" class="filled-in"{if $u.backend_settings=="1"} checked{/if} />
						        <span>{$lang.create_users_groups_backend_settings}</span>
						      </label>
					     </div>
						</div>
						<br />
					<div class="row">
						<div class="input-field col s12 m12 center">
							<button class="btn waves-effect waves-light" type="submit" name="save">{$lang.create_users_groups_save}</button>
						</div>
					</div>
			</form>
			</div>

		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}