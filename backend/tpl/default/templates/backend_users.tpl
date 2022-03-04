{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="valign-wrapper left"><i class="material-icons grey-text text-darken-2 small">engineering</i><h6 class="grey-text text-darken-2"> &nbsp;{$lang.backend_users_page_title}</h6></div>
			<div class="valign-wrapper right"><a class="waves-effect waves-light btn-small " href="create_backend_user">{$lang.backend_users_add_button}</a></div>
		</div>
		  {if $smarty.get.id=="ok" or $smarty.get.action=="ok"}{include file="inc_info_save.tpl"}{/if}
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header grey darken-2 white-text row row-table">
				 <div class="col s3 m4 l3">{$lang.backend_users_name}</div>
				 <div class="col s3 m4 l3">{$lang.backend_users_surname}</div>
				 <div class="col s6 m4 l6">{$lang.backend_users_email}</div>
			 </div>
			 </li>
		  	 {foreach item=u from=$backend_users_list}
			 <li {if $smarty.get.action_id==$u.id}class="active"{/if}>
	       <div class="collapsible-header row row-table">
				 <div class="col s3 m4 l3">{$u.name}</div>
				 <div class="col s3 m4 l3">{$u.lastname}</div>
				 <div class="col s6 m4 l6">{$u.email}</div>
			 </div>
			 <div class="collapsible-body grey lighten-4">
				    <form class="col s12" action="{$PATH_BACKEND}backend_users/save/{$u.id}" method="post">
						  <div class="row">
						  	<div class="left"><h6 class="grey-text text-darken-2">{$lang.backend_users_edit_info} - <b>{$u.name} {$u.lastname}</b></h6></div>
							<div class="right"><button class="btn-small waves-effect waves-light marginr10" type="submit" name="zapisz">{$lang.backend_users_save_button}</button>{if $users_number > 1}<a href="#modal{$u.id}" class="modal-trigger waves-effect waves-light btn-small">{$lang.backend_users_delete_entry}</a>{/if}</div>
						  </div>
						  <p>{$lang.backend_users_star_info}</p>
					      <div class="row">
					        <div class="input-field col s12 m12 l12">
					          <input id="name" name="name" type="text" value="{$u.name}">
					          <label for="name">{$lang.backend_users_name}</label>
					        </div>
					        <div class="input-field col s12 m12 l12">
					          <input id="lastname" name="lastname" type="text" value="{$u.lastname}">
					          <label for="lastname">{$lang.backend_users_surname}</label>
					        </div>
				        <div class="input-field col s12 m12 l12">
				          <input id="email" name="email" type="email" class="validate" value="{$u.email}" required>
				          <label for="email">{$lang.backend_users_email} *</label>
				        </div>
				        <div class="input-field col s12 m12 l12">
				          <input id="password" name="password" type="password">
				          <label for="password">{$lang.backend_users_password} *</label>
				        </div>
					   </div>
						<p>{$lang.backend_users_info_admin_group}</p>
							<div class="input-field col s12 m12 l12">
							<select name="groups" id="groups">
								{foreach $users_groups as $t}
									<option value="{$t.id_users_groups}"{if $u.id_users_groups == $t.id_users_groups} selected{/if}>{$t.title}</option>
								{/foreach}
							</select>
							<label for="group"></label>
						</div>
						<br />
				      <div class="row">
				        <div class="input-field col s12 m12 center">
				            <button class="btn waves-effect waves-light" type="submit" name="save">{$lang.backend_users_save_button}</button>
				        </div>
				      </div>
				    </form>
			 </div>
			 </li>
			 {include file="inc_info_delete_entry.tpl" page="backend_users" modal="{$u.id}" element="{$u.id}" entry_value="{$u.name} {$u.lastname}"}
			 {/foreach}
			 {* pagination start *}
			 {include file="inc_pagination.tpl" page="backend_users"}
			 {* pagination end *}			 
			 </ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}