{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div>
			<div class="valign-wrapper"><i class="material-icons grey-text text-darken-2 small">account_circle</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.profil_my_profil}</h6></div>
		</div>
		  <div class="row">
		    <form class="col s12" action="{$PATH_BACKEND}profil" method="post">
			 	  {if $smarty.get.id=="ok"}{include file="inc_info_save.tpl"}{/if}
				  <br />
		      <div class="row">
		        <div class="input-field col s12 m6">
		          <input id="name" name="name" type="text" class="validate" value="{$signin_user.name}" required>
		          <label for="name">{$lang.profil_name} </label>
		        </div>
		        <div class="input-field col s12 m6">
		          <input id="lastname" name="lastname" type="text" class="validate" value="{$signin_user.lastname}" required>
		          <label for="lastname">{$lang.profil_lastname} </label>
		        </div>
		      </div>
		      <div class="row">
		        <div class="input-field col s12 m6">
		          <input id="email" name="email" type="email" class="validate" value="{$signin_user.email}" required>
		          <label for="email">{$lang.profil_email} </label>
		        </div>
		        <div class="input-field col s12 m6">
		          <input id="password" name="password" type="password">
		          <label for="password">{$lang.profil_password} </label>
		        </div>
		      </div>
		      <div class="row">
		        <div class="input-field col s12 m12 center">
		            <button class="btn waves-effect waves-light" type="submit" name="zapisz">{$lang.profil_save}</button>
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