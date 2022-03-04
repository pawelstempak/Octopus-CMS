{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
		<div class="row">
			<div class="col s12 m12 l12 valign-wrapper"><h4 class="grey-text text-darken-2">Lista wpisów dziennika</h4></div>
		</div>
					 	  {if $smarty.get.id=="ok"}
								<div class="info row card-panel grey lighten-4">
								<div class="col s6 m6 l6"><h6>Dane w przesłanym formularzu zostały zapisane.</h6></div>
							   <div class="col s6 m6 l6 right-align"><a class="btn closeCard white-text">Zamknij</a></div>
								</div>
						  {/if}
			 <ul class="collapsible" data-collapsible="accordion">
			 <li>
	       <div class="collapsible-header green white-text">
				 <div style="font-weight:bold;width:80%;">Tytuł wpisu</div>
				 <div style="font-weight:bold;width:10%;text-align:center">Data</div>
				 <div style="font-weight:bold;width:10%;text-align:center">Budynek</div>
			 </div>
			 </li>
		  	 {foreach item=u from=$blog}
			 <li {if $smarty.get.action_id==$u.id_blog}class="active"{/if}>
	       <div class="collapsible-header">
				 <div style="width:80%">{$u.name}</div>
				 <div style="width:10%;text-align:center">{$u.data|date_format:"%d-%m-%Y"}</div>
				 <div style="width:10%;text-align:center">{if $u.budynek=="1"}BP1{elseif $u.budynek=="2"}BP2{elseif $u.budynek=="3"}BP3{else}BI{/if}</div>
			 </div>
			 <div class="collapsible-body grey lighten-4">
				    <form class="col s12" action="{$PATH_BACKEND}blog/save/{$u.id_blog}" method="post" enctype="multipart/form-data">
						  <div class="row">
						  	<div class="col s6 m6 l6"><h5 class="head grey-text text-darken-2">Edytuj wpis dziennika</h5></div>
							<div class="col s6 m6 l6"><a href="#modal{$u.id_blog}" class="modal-trigger waves-effect waves-light btn-small right">Usuń wpis</a><button class="btn-small waves-effect waves-light right" type="submit" name="zapisz">Zapisz</button></div>
						  </div>
		        <div class="input-field">
		          <input id="date" type="text" class="datepicker" name="date" value="{$u.data|date_format:"%d-%m-%Y"}">
		          <label for="date">Wybierz datę</label>
		        </div>
				  <div class="input-field">
				    <select name="budynek">
				      <option value="0"{if $u.budynek=="0"} selected{/if}>Budynek BI</option>
						<option value="1"{if $u.budynek=="1"} selected{/if}>Budynek BP1</option>
				      <option value="2"{if $u.budynek=="2"} selected{/if}>Budynek BP2</option>
						<option value="3"{if $u.budynek=="3"} selected{/if}>Budynek BP3</option>
						</select>
				    <label>Wybierz budynek</label>
				  </div>
				      <div class="row">
				        <div class="input-field col s12 m12 l12">
				          <input id="name" name="name" type="text" class="validate" value="{$u.name}" required>
				          <label for="name">Tytuł posta</label>
				        </div>
						</div>
					<div class="file-field input-field">
						<div class="btn">
							<span>Dodaj zdjęcie</span>
							<input type="file" name="attachment">
						</div>
						<div class="file-path-wrapper">
							<input class="file-path validate" type="text" name="attachment">
						</div>
					</div>
			        <div class="input-field">
				          <textarea name="content" class="myeditablediv" id="textarea{$u.id_blog}">{$u.content}</textarea>
			        </div>
				      <div class="row">
				        <div class="input-field col s12 m12 center">
				            <button class="btn waves-effect waves-light" type="submit" name="zapisz">Zapisz</button>
				        </div>
				      </div>
			      <h5>Galeria</h5>
					<div class="row">
					{foreach item=im from=$u.images_list}
					<div class="col s12 m3 l2"><a href="../images/{$im.nazwa_pliku}" target="_blank"><img src="../images/thumb/{$im.nazwa_pliku}" class="responsive-img"></a><br /><a href="blog,delete_img,{$im.id_img}">Usuń</a></div>
					{/foreach}
					</div>
				    </form>
			 </div>
			 </li>
			  <div id="modal{$u.id_blog}" class="modal">
			    <div class="modal-content center"><br /><br />
			      <h4>Czy na pewno chcesz usunąć ten wpis?</h4>
					<p><b>"{$u.name}"</b></p>
			      <p>Wszelkie informacje o tym wpisie zostaną usunięte.</p><br /><a href="blog,delete,{$u.id_blog}" class="white-text"><button class="btn waves-effect waves-light red">Tak, usuń ten wpis</button></a>
			    </div>
			    <div class="modal-footer">
			      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat green-text">Nie kasuj</a>
			    </div>
			  </div>
			 {/foreach}
			 </ul>
		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}