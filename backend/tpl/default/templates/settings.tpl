{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div>
			<div class="valign-wrapper"><i class="material-icons grey-text text-darken-2 small">settings</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.settings_page_settings}</h6></div>
		</div>
		  <div class="row">
		    <form class="col s12" action="{$PATH_BACKEND}settings" method="post">
			 	  {if $smarty.get.id=="ok"}{include file="inc_info_save.tpl"}{/if}
				  <br />
		      <div class="row">
		        <div class="input-field col s12 m12">
		          <input id="title" name="title" type="text" value="{$settings.title}">
		          <label for="title">{$lang.settings_page_title}</label>
		        </div>
		        <div class="input-field col s12 m12">
				    <select name="language">
					 	{foreach $languages as $l}
				      <option value="{$l.id_language}"{if $settings.id_language == $l.id_language} selected{/if}>{$l.title}</option>
						{/foreach}
				    </select>
					 <label>{$lang.settings_default_language}</label>
		        </div>
		        <div class="input-field col s12 m12">
				    <select name="templates">
					 	{foreach $templates as $t}
				      <option value="{$t.id_templates}"{if $settings.id_templates == $t.id_templates} selected{/if}>{$t.title}</option>
						{/foreach}
				    </select>
					 <label>{$lang.settings_default_template}</label>
		        </div>
		      </div>
		      <div class="row">
		        <div class="input-field col s12 m12 center">
				  		<input type="hidden" name="action" value="save" />
		            <button class="btn waves-effect waves-light" type="submit">{$lang.settings_save}</button>
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