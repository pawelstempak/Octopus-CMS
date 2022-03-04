{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
				<form action="{$PATH_BACKEND}create_pages" method="post">
					<div class="row">
						<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">library_books</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.create_pages_add_new_page}</h6></div>
						<div class="valign-wrapper right">
							{if $smarty.post.layouts_id}<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save_close"><i class="material-icons left">done</i>{$lang.create_pages_save_button}</button>{/if}
							<a class="btn cancel waves-effect waves-light" onclick="location='{$PATH_BACKEND}pages'"><i class="material-icons left">clear</i>{$lang.create_pages_cancel}</a>
						</div>
					</div>
					<br />
					<div class="box select-box-pad">
						<div class="input-field">
							<select name="layouts_id" onchange="this.form.submit()">
							<option value="" disabled selected>{$lang.create_pages_select_page_layout}</option>
		 					{foreach item=u from=$layouts_list}
							<option value="{$u.id_layouts}"{if $u.id_layouts == $smarty.post.layouts_id} selected{/if}>{$u.title}</option>
							{/foreach}
							</select>
						<label>{$lang.create_pages_page_layout}</label>
						</div>
					</div>
						<br />
						{if $layout.tfile!=""}{include file="{$tpl_folder_absolute_path}/templates/layouts/{$layout.tfile}"}{/if}
						<div class="row">
							<div class="input-field col s12 m12 center">
								{if $smarty.post.layouts_id}<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save_close"><i class="material-icons left">done</i>{$lang.create_pages_save_button}</button>
								<a class="btn cancel waves-effect waves-light" onclick="location='{$PATH_BACKEND}pages'"><i class="material-icons left">clear</i>{$lang.create_pages_cancel}</a></div>{/if}
							</div>
						</div>
			</form>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}