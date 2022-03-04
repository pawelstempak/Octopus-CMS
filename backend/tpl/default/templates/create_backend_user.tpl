{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
 			<div style="margin:0px auto">
				<form action="{$PATH_BACKEND}create_backend_user" method="post">
					<div class="row">
						<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">manage_accounts</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.create_backend_users_page_title}</h6></div>
						<div class="valign-wrapper right"><button class="btn waves-effect waves-light btn marginr10" type="submit" name="save">{$lang.create_backend_users_save_button}</button><button class="btn waves-effect waves-light" onclick="location='backend_users'">{$lang.create_backend_users_close_button}</button></div>
					</div>
				  <br />
						 <p>{$lang.create_backend_users_star_info}</p>
						 <div class="input-field col s12 m12 l12">
				          <input id="name" name="name" type="text" class="validate" required>
				          <label for="name">{$lang.create_backend_users_name} *</label>
				        </div>
				        <div class="input-field col s12 m12 l12">
				          <input id="lastname" name="lastname" type="text" class="validate" required>
				          <label for="lastname">{$lang.create_backend_users_surname} *</label>
				        </div>
			        <div class="input-field col s12 m12 l12">
			          <input id="email" name="email" type="email" class="validate" required>
			          <label for="email">{$lang.create_backend_users_email} *</label>
			        </div>
			        <div class="input-field col s12 m12 l12">
			          <input id="password" name="password" type="password">
			          <label for="password">{$lang.create_backend_users_password}</label>
			        </div>
						<br />
						<p>{$lang.create_backend_users_info_admin_group}</p>
							<div class="input-field col s12 m12 l12">
							<select name="groups" id="groups">
								{foreach $users_groups as $t}
									<option value="{$t.id_users_groups}">{$t.title}</option>
								{/foreach}
							</select>
							<label for="group"></label>
						</div>
						<br />
					<div class="row">
						<div class="input-field col s12 m12 center">
							<button class="btn waves-effect waves-light" type="submit" name="save">{$lang.create_backend_users_save_button}</button>
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