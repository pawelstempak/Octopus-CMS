{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
			<div style="margin:0px auto">
				<form action="{$PATH_BACKEND_MODULES}{$module.restful_url}/create_category" method="post">
					<div class="row">
						<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">category</i><h6 class="grey-text text-darken-2"> &nbsp;Dodaj nowa kategorię</h6></h6></div>
						<div class="valign-wrapper right"><button class="btn waves-effect waves-light btn marginr10" type="submit" name="save">{$lang.create_language_save}</button><a class="btn waves-effect waves-light" href="{$PATH_BACKEND_MODULES}{$module.restful_url}/categories">{$lang.create_language_close}</a></div>
					</div>
				  <br />
		        <div class="input-field">
		          <input placeholder="Tu wpisz nazwę kategorii aktualności" id="title" type="text" name="title" class="validate" required>
		          <label for="title">Nazwa kategorii</label>
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