{include file="header_signin.tpl"}
<main>
  <div class="section" id="index-banner">
    <div class="container">
      <div class="row center">
		  <br /><br /><br />
		  {*<div style="font-size:18px;" class="black-text"><img src="{$tpl_folder_path}/img/blogo.png" width="100" /><p class="signin_logo">Octopus</p>
		  <br />*}
		  {* <p><i class="material-icons grey-text text-lighten-3" style="font-size:60px;">lock_outline</i></p> *}
		  </div>
		  <div style="width:300px;margin:0 auto">
		  <div class="signin_nag_background">
				<div class="row">
			  	<div class="col"><img src="{$tpl_folder_path}/img/blogo.png" width="30" /></div>
				<div class="col"><span class="signin_logo">Octopus</span></div>
			   </div>
		  </div>
		  {if $sing_in_result.signin_not_found_error}
			<div class="info card blue-grey lighten-1 white-text">
				<div class="right-align no-pad"><a class="info closeCard"><i class="material-icons grey-text text-lighten-3 tiny">close</i></a></div>
				<div class="error_info"></div>
				<div class="error_info"><h5 class="no-pad">{$lang.signin_error}</h5></div>
				<div class="error_info">{$lang.signin_not_found_error}</div>
				<div class="error_info"></div>
		  </div>
		  {/if}
		  {if $sing_in_result.signin_empty_error}
			<div class="info card blue-grey lighten-1 white-text">
				<div class="right-align no-pad"><a class="info closeCard"><i class="material-icons grey-text text-lighten-3 tiny">close</i></a></div>
				<div class="error_info"><h5 class="no-pad">{$lang.signin_error}</h5></div>
				<div class="error_info">{$lang.signin_empty_error}</div>
				<div class="error_info"></div>
		  </div>
		  {/if}
			  <div class="signin_background">
		        <form action="{$PATH_BACKEND}signin" method="post">
			        <div class="input-field">
			          <input placeholder="{$lang.signin_username}" id="email" type="email" name="email" class="validate">
			          <label for="email">{$lang.signin_username}</label>
			        </div>
					  <br />
			        <div class="input-field">
			          <input placeholder="{$lang.signin_password}" id="password" type="password" name="password" class="validate">
			          <label for="password">{$lang.signin_password}</label>
			        </div>
					  <br />
					  <div class="input-field">
					    <select name="language">
						 	<option value="default" selected>{$lang.signin_language_choose}</option>
						 	{foreach $languages as $l}
					      <option value="{$l.id_language}">{$l.title}{lang_file code=$l.code info=$lang.backend_settings_info}</option>
							{/foreach}
					    </select>
						 <label>{$lang.backend_settings_backend_language}</label>
					  </div>
					  <div>
					   <input type="hidden" name="breadcrumbs" value="{$breadcrumbs}" />
						<br /><br /><button class="btn waves-effect waves-light" type="submit" name="action" value="signin">{$lang.signin_signin}</button>
					  </div>
				  </form>
			  </div>
		  </div>
      </div>
      <br><br>
    </div>
  </div>
</main>
{include file="footer.tpl"}