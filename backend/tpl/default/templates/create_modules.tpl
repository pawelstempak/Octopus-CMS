{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
				<form action="{$PATH_BACKEND}create_modules" method="post">
					<div class="row">
						<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">menu</i><h6 class="grey-text text-darken-2"> &nbsp;Dodaj nowy moduł</h6></div>
						<div class="valign-wrapper right">
							<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save_close"><i class="material-icons left">done</i>{$lang.create_menus_save}</button>
							<a class="btn cancel waves-effect waves-light" onclick="location='{$PATH_BACKEND}modules'"><i class="material-icons left">clear</i>{$lang.create_menus_close}</a>
						</div>
					</div>
				  <br />
				  <div>
				   <div class="row">
					  <div class="col s12 m12 l12">
							<div class="box">
							<div class="input-field">
								<input placeholder="Wpisz nazwę modułu" type="text" name="title" class="validate" required>
								<label for="title">Nazwa modułu</label>
							</div>
							</div>
							<br />
							<div class="box" style="padding:20px;">
								<div class="bold">
									{$lang.create_menus_additional_options}
								</div>
								<br />
								<div>
									<label>
										<input name="layout" value="1" type="checkbox" class="filled-in" />
										<span>Dodaj moduł do Układu stron</span>
									</label>
								</div>
							</div>
					  </div>
					</div>
					<div class="row">
						<div class="input-field col s12 m12 center">
							<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save_close"><i class="material-icons left">done</i>{$lang.create_menus_save}</button>
							<a class="btn cancel waves-effect waves-light" onclick="location='{$PATH_BACKEND}modules'"><i class="material-icons left">clear</i>{$lang.create_menus_close}</a>
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