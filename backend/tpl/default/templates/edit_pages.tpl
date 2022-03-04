{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
				<form action="{$PATH_BACKEND}edit_pages/{$smarty.get.id}" method="post">
					<div class="row">
						<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">library_books</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.edit_pages_edit_page}</h6></div>
						<div class="valign-wrapper right">
							<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save"><i class="material-icons left">edit_note</i>{$lang.edit_pages_save}</button>
							<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save_close"><i class="material-icons left">done</i>{$lang.edit_pages_save_and_close}</button>
							<a class="btn cancel waves-effect waves-light" onclick="location='{$PATH_BACKEND}pages'"><i class="material-icons left">clear</i>{$lang.edit_pages_close}</a>
						</div>
					</div>
					{if $smarty.get.id=="ok" or $smarty.get.action_id=="ok"}{include file="inc_info_save.tpl"}{/if}
					<div class="box">
							<div class="input-field">
								<select name="layouts_id" disabled>
			 					{foreach item=u from=$layouts_list}
								<option value="{$u.id_layouts}"{if $u.id_layouts == $pages.id_layouts or $u.id_layouts == $smarty.post.layouts_id} selected{/if}>{$u.title}</option>
								{/foreach}
								</select>
							<label>{$lang.edit_pages_page_layout}</label>
							</div>
					</div>
						{include file="{$tpl_folder_absolute_path}/templates/layouts/{$pages.tfile}"}
						  {if $smarty.get.page != "create_pages"}
						  <div class="box select-box-pad">
								<div class="row no-pad">
							  		<div class="col s12 m6 l6">
										<div class="input-field">
										<i class="material-icons prefix grey-text">edit_calendar</i>
										<input type="text" name="created" id="created" value="{$page.created}" />
										<label for="created">{$lang.edit_pages_create_date}</label>
										</div>
									</div>
									<div class="col s12 m6 l6">
										<div class="input-field">
										<i class="material-icons prefix grey-text">person</i>
										<input type="text" name="created_by" id="created_by" value="{user id={$page.created_by}}" disabled />
										<label for="created_by">{$lang.edit_pages_created_by}</label>
										</div>
									</div>
							  </div>
						  </div>
						  {/if}
						<div class="row">
							<div class="input-field col s12 m12 center">
								<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save"><i class="material-icons left">edit_note</i>{$lang.edit_pages_save}</button>
								<button class="btn waves-effect waves-light marginr10" type="submit" name="save" value="save_close"><i class="material-icons left">done</i>{$lang.edit_pages_save_and_close}</button>
								<a class="btn cancel waves-effect waves-light" onclick="location='{$PATH_BACKEND}pages'"><i class="material-icons left">clear</i>{$lang.edit_pages_close}</a>
							</div>
						</div>
			</form>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}