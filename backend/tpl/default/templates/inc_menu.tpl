		<ul id="nav-mobile" class="grey darken-4 sidenav sidenav-fixed">
				<li class="logo"><a href="{$PATH_BACKEND}"><img src="{$tpl_folder_path}/img/mlogo.png" /><span class="white-text">&nbsp;<b style="font-size:20px">Octopus</b></span></a></li>
				<li class="divider"></li>
            <li {if $smarty.get.page=="dashboard"}class="active"{/if}>
				<a class="white-text" href="{$PATH_BACKEND}dashboard"><i class="material-icons white-text">dashboard</i>{$lang.inc_menu_dashboard}</a>
				</li>
				{if $pmenus != 1}
				<li class="divider"></li>
		        <ul class="collapsible collapsible-accordion">
		          <li {if $smarty.get.page=="menus" or $smarty.get.page=="create_menus" or $smarty.get.page=="edit_menus" or $smarty.get.page=="smenus" or $smarty.get.page=="create_smenus" or $smarty.get.page=="edit_smenus" or $smarty.get.page=="hmenus" or $smarty.get.page=="create_hmenus" or $smarty.get.page=="edit_hmenus"}class="active"{/if}>
		            <a class="collapsible-header white-text"><i class="material-icons white-text">menu_book</i>{$lang.inc_menu_page_menu}</a>
		            <div class="collapsible-body white-text">
		              <ul>
								<li {if $smarty.get.page=="menus" or $smarty.get.page=="create_menus" or $smarty.get.page=="edit_menus"}class="active"{/if}><a href="{$PATH_BACKEND}menus"><i class="material-icons">menu</i>{$lang.inc_menu_primary}</a></li>
								<li class="divider" style="margin-top:0px;"></li>
								<li {if $smarty.get.page=="smenus" or $smarty.get.page=="create_smenus" or $smarty.get.page=="edit_smenus"}class="active"{/if}><a href="{$PATH_BACKEND}smenus"><i class="material-icons">menu_open</i>{$lang.inc_menu_secondary}</a></li>
								<li class="divider" style="margin-top:0px;"></li>
								<li {if $smarty.get.page=="hmenus" or $smarty.get.page=="create_hmenus" or $smarty.get.page=="edit_hmenus"}class="active"{/if}><a href="{$PATH_BACKEND}hmenus"><i class="material-icons">clear_all</i>{$lang.inc_menu_others}</a></li>
		              </ul>
		            </div>
		          </li>
		        </ul>
				{/if}
				{if $ppages != 1}
				<li class="divider"></li>
            <li {if $smarty.get.page=="pages"}class="active"{/if}>
				<a class="white-text" href="{$PATH_BACKEND}pages"><i class="material-icons white-text">library_books</i>{$lang.inc_menu_pages}</a>
				</li>
				{/if}
				{if $playouts != 1}
				<li class="divider"></li>
            <li {if $smarty.get.page=="layouts"}class="active"{/if}>
				<a class="white-text" href="{$PATH_BACKEND}layouts"><i class="material-icons white-text">view_sidebar</i>{$lang.inc_menu_layouts}</a>
				</li>
				{/if}
				{if $pmodules != 1}

				<li class="divider"></li>
		        <ul class="collapsible collapsible-accordion">
		          <li {if $smarty.get.page=="modules" or $smarty.get.mod}class="active"{/if}>
		            <a class="collapsible-header white-text"><i class="material-icons white-text">apps</i>{$lang.inc_menu_modules}</a>
		            <div class="collapsible-body white-text">
		              <ul>
						  		{foreach item=u from=$modules}
								<li {if $smarty.get.mod==$u.restful_url}class="active"{/if}><a href="{$PATH_BACKEND_MODULES}{$u.restful_url}/start"><i class="material-icons">apps</i>{$u.title}</a></li>
								<li class="divider"></li>
								{/foreach}
								<li {if $smarty.get.page=="modules"}class="active"{/if}><a href="{$PATH_BACKEND}modules"><i class="material-icons">app_registration</i>{$lang.inc_menu_modules_manager}</a></li>
		              </ul>
		            </div>
		          </li>
		        </ul>
				{/if}
				{if $pwidgets != 1}
				<li class="divider"></li>
            <li {if $smarty.get.page=="widgets"}class="active"{/if}>
				<a class="white-text" href="{$PATH_BACKEND}widgets"><i class="material-icons white-text">widgets</i>{$lang.inc_menu_widgets}</a>
				</li>
				{/if}
				{if $ptemplates != 1}
				<li class="divider"></li>
            <li {if $smarty.get.page=="templates"}class="active"{/if}>
				<a class="white-text" href="{$PATH_BACKEND}templates"><i class="material-icons white-text">layers</i>{$lang.inc_menu_templates}</a>
				</li>
				{/if}
				{if $planguage != 1}
				<li class="divider"></li>
            <li {if $smarty.get.page=="language"}class="active"{/if}>
				<a class="white-text" href="{$PATH_BACKEND}language"><i class="material-icons white-text">language</i>{$lang.inc_menu_languages}</a>
				</li>
				{/if}
				{if $psettings != 1}
				<li class="divider"></li>
            <li {if $smarty.get.page=="settings"}class="active"{/if}>
				<a class="white-text" href="{$PATH_BACKEND}settings"><i class="material-icons white-text">settings_application</i>{$lang.inc_menu_settings}</a>
				</li>
				{/if}
				{if $pbackend_users != 1}
				<li class="divider"></li>
		        <ul class="collapsible collapsible-accordion">
		          <li {if $smarty.get.page=="backend_users" or $smarty.get.page=="backend_users_groups"}class="active"{/if}>
		            <a class="collapsible-header white-text"><i class="material-icons white-text"><span class="material-icons">engineering </span></i>{$lang.inc_menu_administrators}</a>
		            <div class="collapsible-body white-text">
		              <ul>
								<li class="divider" style="margin-top:0px;"></li>
								<li {if $smarty.get.page=="backend_users_groups"}class="active"{/if}><a href="{$PATH_BACKEND}backend_users_groups"><i class="material-icons">groups</i>{$lang.inc_menu_groups}</a></li>
								<li class="divider" style="margin-top:0px;"></li>
								<li {if $smarty.get.page=="backend_users"}class="active"{/if}><a href="{$PATH_BACKEND}backend_users"><i class="material-icons">manage_accounts</i>{$lang.inc_menu_users}</a></li>
		              </ul>
		            </div>
		          </li>
		        </ul>
				{/if}
				{*<li class="divider"></li>
            <li {if $smarty.get.page=="help"}class="active"{/if}>
				<a class="white-text" href="{$PATH_BACKEND}help"><i class="material-icons white-text">help</i>{$lang.inc_menu_help}</a>
				</li>
				<li class="divider"></li>
            <li>
				<a class="white-text" href="{$PATH_BACKEND}logout"><i class="material-icons white-text">power_settings_new</i>{$lang.inc_menu_signout}</a>
				</li>*}
				<li class="divider"></li>
		</ul>
      <a href="#" data-target="nav-mobile" class="sidenav-trigger hide-on-large-only"><i class="material-icons">menu</i></a>