{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
			<div style="margin:0px auto">
				<form action="{$PATH_BACKEND}create_layouts" method="post">
					<div class="row">
						<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">view_sidebar</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.create_layouts_header}</h6></div>
						<div class="valign-wrapper right"><button class="btn waves-effect waves-light btn marginr10" type="submit" name="save">{$lang.create_layouts_save}</button><a class="btn waves-effect waves-light" onclick="location='{$PATH_BACKEND}layouts'">{$lang.create_layouts_close}</a></div>
					</div>
					<br />
		        <div class="input-field">
				    <input placeholder="{$lang.create_layouts_placeholder_layout_name}" id="title" name="title" type="text" class="validate" required>
				    <label for="title">{$lang.create_layouts_new_layout_name}</label>
 				  </div>
				  <br />
		        <div class="input-field">
				    <input placeholder="{$lang.create_layouts_placeholder_layout_file}" id="tfile" name="tfile" type="text" class="validate" required>
				    <label for="tfile">{$lang.create_layouts_layout_file}</label>
		        </div>
				  <br />
		        <div class="input-field">
				    <input placeholder="{$lang.create_layouts_placeholder_controller_file}" id="cfile" name="cfile" type="text" class="validate" required>
				    <label for="cfile">{$lang.create_layouts_controller_file}</label>
		        </div>
					<div class="row">
						<div class="input-field col s12 m12 center">
							<button class="btn waves-effect waves-light" type="submit" name="save">{$lang.create_layouts_save}</button>
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