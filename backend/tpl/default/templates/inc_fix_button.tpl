	  {*<div class="fixed-action-btn">
	    <a class="btn-floating btn-large red" href="new_{$smarty.get.page}">
	      <i class="large material-icons">question</i>
	    </a>
	    <ul>
	      <li><a class="btn-floating red waves-effect waves-light modal-trigger" href="new_article"><i class="material-icons">add</i></a></li>
	      <li><a class="btn-floating red waves-effect waves-light modal-trigger" href="#modal_add_cat"><i class="material-icons">create_new_folder</i></a></li>
			<li><a class="btn-floating red waves-effect waves-light modal-trigger" href="/{if $smarty.get.page=="items"}eitems{if $smarty.get.id!=""},{$smarty.get.id}{/if}{else}ecat{/if}"><i class="material-icons">mode_edit</i></a></li>
	    </ul>
	  </div>*}
{*
	  <div id="modal_add" class="modal" style="max-width:400px;width:95%">
	    <div class="modal-content">
	      <h6>Add new Url</h6>
			<form action="index.php" method="post">
			  <div class="input-field">
			    <select id="cat" name="cat">
				 	{foreach item=cat from=$catalog}
			      <option value="{$cat.id_cat}"{if $smarty.get.id==$cat.id_cat} selected{/if}>{$cat.name}</option>
					{/foreach}
			    </select>
			    <label for="cat">Select catalog</label>
			  </div>
				<div class="input-field">
		          <input id="url" type="text" class="validate" name="url">
		          <label for="url">Url</label>
				</div>
				<div class="input-field center">
				{if $smarty.get.id!=""}
				<input type="hidden" name="id" value="{$smarty.get.id}" />
				{/if}
					<button class="btn waves-effect waves-light green accent-4" type="submit" name="add_action">Save</button>
				</div>
			</form>
	    </div>
	  </div>
	  <div id="modal_add_cat" class="modal" style="max-width:400px;width:95%">
	    <div class="modal-content">
	      <h6>Add new catalog</h6>
			<form action="index.php" method="post">
			  <div class="input-field">
			    <select id="color" name="color">
				 	<option value="" disabled selected>Pick a color</option>
			      <option value="f44336" data-icon="img/red.png" class="left">Red</option>
					<option value="e91e63" data-icon="img/pink.png" class="left">Pink</option>
					<option value="9c27b0" data-icon="img/purple.png" class="left">Purple</option>
			      <option value="673ab7" data-icon="img/deep-purple.png" class="left">Deep-purple</option>
					<option value="3f51b5" data-icon="img/indigo.png" class="left">Indigo</option>
					<option value="2196f3" data-icon="img/blue.png" class="left">Blue</option>
					<option value="03a9f4" data-icon="img/light-blue.png" class="left">Light-blue</option>
					<option value="00bcd4" data-icon="img/cyan.png" class="left">Cyan</option>
					<option value="009688" data-icon="img/teal.png" class="left">Teal</option>
					<option value="4caf50" data-icon="img/green.png" class="left">Green</option>
					<option value="8bc34a" data-icon="img/light-green.png" class="left">Light-green</option>
			      <option value="cddc39" data-icon="img/lime.png" class="left">Lime</option>
					<option value="ffeb3b" data-icon="img/yellow.png" class="left">Yellow</option>
					<option value="ffc107" data-icon="img/amber.png" class="left">Amber</option>
					<option value="ff9800" data-icon="img/orange.png" class="left">Orange</option>
					<option value="ff5722" data-icon="img/deep-orange.png" class="left">Deep-orange</option>
					<option value="795548" data-icon="img/brown.png" class="left">Brown</option>
			    </select>
			    <label for="color">Catalog color</label>
			  </div>
				<div class="input-field">
		          <input id="cat_name" type="text" class="validate" name="cat_name">
		          <label for="cat_name">Catalog name</label>
				</div>
				<div class="input-field center">
					<button class="btn waves-effect waves-light green accent-4" type="submit" name="add_cat_action">Save</button>
				</div>
			</form>
	    </div>
	  </div>
	  *}