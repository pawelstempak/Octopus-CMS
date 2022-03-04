{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
			<div style="margin:0px auto">
				<form action="{$PATH_BACKEND}create_template" method="post">
					<div class="row">
						<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">layers</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.create_layouts_header}</h6></div>
						<div class="valign-wrapper right"><button class="btn waves-effect waves-light btn marginr10" type="submit" name="save">{$lang.create_templates_save}</button><a class="btn waves-effect waves-light" href="{$PATH_BACKEND}templates">{$lang.create_templates_close}</a></div>
					</div>
				  <div class="card-panel">
				    <span class="grey-text text-darken-2">{$lang.create_templates_info}</span>
				  </div>
				  <br />
		        <div class="input-field">
		          <input placeholder="{$lang.create_templates_placeholder_layout_name}" id="title" type="text" name="title" class="validate" required>
		          <label for="title">{$lang.create_templates_new_layout_name}</label>
		        </div>
		        <div class="input-field">
				    <input placeholder="{$lang.create_templates_placeholder_template_file}" id="folder_name" name="folder_name" type="text" class="validate" required>
				    <label for="code">{$lang.create_templates_template_file}</label>
		        </div>
		        <div class="input-field">
				    <input placeholder="{$lang.create_templates_placeholder_desc}" id="description" name="description" type="text" class="validate" required>
				    <label for="description">{$lang.create_templates_desc}</label>
		        </div>
					<div class="row">
						<div class="input-field col s12 m12 center">
							<button class="btn waves-effect waves-light" type="submit" name="save">{$lang.create_templates_save}</button>
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