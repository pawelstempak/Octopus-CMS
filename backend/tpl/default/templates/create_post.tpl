{include file="header.tpl"}
<main>
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
		<div class="section">
					 	  {if $smarty.get.action=="save"}
								<div class="info row card-panel grey lighten-4">
								<div class="col s6 m6 l6"><h6>Zmiany zostały zapisane.</h6></div>
							   <div class="col s6 m6 l6 right-align"><a class="btn closeCard white-text grey">Zamknij</a></div>
								</div>
						  {/if}
			<div style="margin:0px auto">
			<form action="{$PATH_WWW}create_post" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col l6">
				<h4 class="grey-text text-darken-2">Utwórz nowy wpis</h4>
				</div>
				<div class="col l6 right-align">
				<div class="right"><button class="btn waves-effect waves-light btn red" onclick="location='{$PATH_BACKEND}blog'">Zamknij</button></div>
				<div><button class="btn waves-effect waves-light btn" type="submit" name="save">Zapisz</button></div>
				</div>
			</div>
		        <div class="input-field">
		          <input id="date" type="text" class="datepicker" name="date" value="{$time|date_format:"%d-%m-%Y"}">
		          <label for="date">Wybierz datę</label>
		        </div>
				  <div class="input-field">
				    <select name="budynek">
				      <option value="0">Budynek BI</option>
						<option value="1">Budynek BP1</option>
				      <option value="2">Budynek BP2</option>
						<option value="3">Budynek BP3</option>
						</select>
				    <label>Wybierz budynek</label>
				  </div>
		        <div class="input-field">
		          <input id="name" type="text" name="name" class="validate" required>
		          <label for="name">Tu wpisz tytuł posta</label>
		        </div>
		        <div class="input-field">
			          <textarea name="content" class="myeditablediv" id="tinymcetextarea"></textarea>
		        </div>
			</form>
			</div>

		</div>
    </div>
	{include file="inc_fix_button.tpl"}
  </div>
</main>
{include file="footer.tpl"}