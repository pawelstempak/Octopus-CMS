{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
			<div style="margin:0px auto">
				<form action="{$PATH_BACKEND}create_language" method="post">
					<div class="row">
						<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">language</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.create_language_add_new_one}</h6></div>
						<div class="valign-wrapper right"><button class="btn waves-effect waves-light btn marginr10" type="submit" name="save">{$lang.create_language_save}</button><a class="btn waves-effect waves-light" href="{$PATH_BACKEND}language">{$lang.create_language_close}</a></div>
					</div>
				  <div class="card-panel">
				    <span class="grey-text text-darken-2">{$lang.create_language_info}</span>
				  </div>
				  <br />
		        <div class="input-field">
		          <input placeholder="{$lang.create_language_placeholder_language_name}" id="title" type="text" name="title" class="validate" required>
		          <label for="title">{$lang.create_language_new_language_name}</label>
		        </div>
		        <div class="input-field">
				    <input placeholder="{$lang.create_language_placeholder_language_code}" id="code" name="code" type="text" class="validate" required data-length="2">
				    <label for="code">{$lang.create_language_new_language_code}</label>
		        </div>
					<div class="row">
						<div class="input-field col s12 m12 center">
							<button class="btn waves-effect waves-light" type="submit" name="save">{$lang.create_language_save}</button>
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