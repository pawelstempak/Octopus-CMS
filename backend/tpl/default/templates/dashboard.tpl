{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">dashboard</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.inc_menu_dashboard}</h6></div>
		</div>
			<div class="row">
				<div class="col s12 m12 l6">
			      <div class="card grey lighten-5 no-pad">
			        <div class="card-content black-text">
			          <span class="card-title">{$lang.dashboard_hi} {$signin_user.name}</span>
			          <p>{$lang.dashboard_welcome} {$who_you_are} {$lang.dashboard_welcome1}</p>
			        </div>
			        <div class="card-action">
			          <a href="{$PATH_BACKEND}pages"><i class="material-icons">menu_book</i>{$lang.dashboard_pages_list}</a>
			        </div>
			      </div>
				</div>
				<div class="col s12 m12 l6">
			      <div class="card grey lighten-5 no-pad">
			        <div class="card-content black-text">
			          <span class="card-title">{$lang.dashboard_last_changes}</span>
			          <p>{$lang.dashboard_last_changes1} <b>{$page.content}</b> {$lang.dashboard_last_changes2} {$page.modified} </p>
			        </div>
			        <div class="card-action">
			          <a href="{$PATH_BACKEND}edit_pages/{$page.id_pages}"><i class="material-icons">library_books</i>{$lang.dashboard_continue}</a>
			        </div>
			      </div>
				</div>
				<div class="col s12 m12 l6">
			      <div class="card grey lighten-5 no-pad">
			        <div class="card-content black-text">
			          <span class="card-title">{$lang.dashboard_new_page}</span>
			          <p>{$lang.dashboard_new_page_content}</p>
			        </div>
			        <div class="card-action">
			          <a href="{$PATH_BACKEND}create_pages"><i class="material-icons">library_books</i>{$lang.dashboard_new_page_create}</a>
			        </div>
			      </div>
				</div>
				<div class="col s12 m12 l6">
			      <div class="card grey lighten-5 no-pad">
			        <div class="card-content black-text">
			          <span class="card-title">{$lang.dashboard_new_menu}</span>
			          <p>{$lang.dashboard_new_menu_content}</p>
			        </div>
			        <div class="card-action">
			          <a href="{$PATH_BACKEND}create_menus"><i class="material-icons">menu</i>{$lang.dashboard_new_menu_create}</a>
			        </div>
			      </div>
				</div>
				{*
				<div class="col s12 m12 l6">
			      <div class="card grey lighten-1 no-pad">
						<div class="card-content black-text" style="padding: 15px !important">
							<div class="carousel carousel-slider center">
						    <div class="carousel-fixed-item center">
						      <a class="btn-small waves-effect next">Next hint</a>
						    </div>
						    <div class="carousel-item grey lighten-1 grey-text text-lighten-4" href="#one!">
						      <h2 class="margin20 grey-text text-lighten-4">Hint #1</h2>
						      <p class="white-text">You can create three difrent menus - <a href="{$PATH_BACKEND}menus">Primary</a> (ex. Header), <a href="{$PATH_BACKEND}smenus">Secondary</a> (ex. Footer) and <a href="{$PATH_BACKEND}hmenus">Other</a> (Hidden) </p><br />
						    </div>
						    <div class="carousel-item grey lighten-1 grey-text text-lighten-4" href="#two!">
						      <h2 class="margin20 grey-text text-lighten-4">Hint #2</h2>
						      <p class="white-text">In <a href="{$PATH_BACKEND}settings">Settings</a> section you can change name, language and template of your project. </p><br />
						    </div>
						    <div class="carousel-item grey lighten-1 grey-text text-lighten-4" href="#three!">
						      <h2 class="margin20 grey-text text-lighten-4">Hint #3</h2>
						      <p class="white-text">At the right top corner, there is a menu with <a href="{$PATH_BACKEND}profil">Profil</a> section where you can set your profile details.</p><br />
						    </div>
						    <div class="carousel-item grey lighten-1 grey-text text-lighten-4" href="#four!">
						      <h2 class="margin20 grey-text text-lighten-4">Hint #4</h2>
						      <p class="white-text"><a href="{$PATH_BACKEND}layouts">Layout</a> section allow you create totally different pages look.</p><br />
						    </div>
						  </div>
			        </div>
			      </div>
				</div>*}
			</div>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}