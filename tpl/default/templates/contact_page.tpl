{include file="header.tpl"}
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
	   <br /><br />
      <div class="row">
				<div class="col s12 m6 l6">
					<div>{$content.content}</div>
				</div>
				<div class="col s12 m6 l6">
					<h4 class="blue-text text-darken-3">Wyślij wiadomość</h4>
					  <div class="row">
					    <form class="col s12" method="POST" action="{$PATH}contact">
					      <div class="row">
					        <div class="input-field col s6">
					          <input id="name" name="name" type="text" class="validate" required="required">
					          <label for="name">Imię i nazwisko</label>
					        </div>
					        <div class="input-field col s6">
					          <input id="tel" name="tel" type="text" class="validate">
					          <label for="tel">Numer telefonu</label>
					        </div>
					      </div>
					      <div class="row">
					        <div class="input-field col s12">
					          <input id="email" name="email" type="email" class="validate" required="required">
					          <label for="email">Email</label>
					        </div>
					      </div>
					      <div class="row">
					        <div class="input-field col s12">
					          <textarea id="tresc" name="tresc" class="materialize-textarea" style="background-color:#F8F8F8"></textarea>
					          <label for="tresc">Treść twojego pytania</label>
					        </div>
					      </div>
							<div class="center">
							  <button class="btn-small waves-effect waves-light grey" type="submit" name="action">Wyślij</button>
							</div>
							<br />
						  <div>
					        <label>
							  <input type="checkbox" name="rodo" />
							  <span>Wyrażam zgodę na przetwarzanie moich danych osobowych podanych w niniejszym formularzu przez Company Inc. w celu marketingu produktów lub usług  Company Inc. <a href="privacy_policy">Zapoznaj się także z naszą polityką prywatności</a></span>
							  </label>
						  </div>
						  </form>
					  </div>
					  <br />
				</div>
      </div>
    </div>
  </div>
{include file="footer.tpl"}