{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div>
			<div class="valign-wrapper"><i class="material-icons grey-text text-darken-2 small">build_circle</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.backend_settings_backend_settings}</h6></div>
		</div>
		  <div class="row">
		  	 <br />
		    <form class="col s12" action="{$PATH_BACKEND}backend_settings" method="post">
					{if $smarty.get.id=="ok"}{include file="inc_info_save.tpl"}{/if}
				  <br />
		      <div class="row">
		        <div class="input-field col s12 m12">
				    <select name="language">
					 	{foreach $languages as $l}
				      <option value="{$l.id_language}"{if $settings.id_language == $l.id_language} selected{/if}>{$l.title}{lang_file code=$l.code info=$lang.backend_settings_info}</option>
						{/foreach}
				    </select>
					 <label>{$lang.backend_settings_backend_language}</label>
		        </div>
		        <div class="input-field col s12 m12">
				    <select name="templates">
					 	{foreach $templates as $t}
				      <option value="{$t.id_templates}"{if $settings.id_templates == $t.id_templates} selected{/if}>{$t.title}</option>
						{/foreach}
				    </select>
					 <label>{$lang.backend_settings_default_backend_template}</label>
		        </div>
		        <div class="input-field col s12 m12">
					<input id="pagination" type="text" class="validate" name="pagination" value="{$settings.pagination}">
					<label for="pagination">{$lang.backend_settings_pagination_label}</label>
		        </div>				
		        <div class="input-field col s12 m12 l12">
					 <span class="label">{$lang.backend_settings_session_life_time} (1 - 30 minutes)</span>
				    <input type="range" name="session_life_time" min="1" max="30" value="{$settings.session_life_time/60}" />
		        </div>
		      </div>
		      <div class="row">
		        <div class="input-field col s12 m12 center">
				  		<input type="hidden" name="action" value="save" />
		            <button class="btn waves-effect waves-light" type="submit">{$lang.backend_settings_save_button}</button>
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