  <footer class="page-footer light-blue darken-3">
    <div class="container">
      <div class="row">
        <div class="col l6 s12">
          <div class="white-text logo">LOGO</div>
          <div style="width:70%">
			 	<p class="grey-text text-lighten-4">{$footer_{$UserLanguageCode}}</p>
			 </div>
        </div>
        <div class="col l3 s12">
		  <ul>
		  {foreach item=k from=$second_menus_list}
		  		{if {parent_menu id=$k.id_menu}}
					<h5 class="white-text">{$k.content}</h5>
				{else}
				  <li><a class="white-text" href="{$PATH}{$k.restful_url}">{$k.content}</a></li>
				{/if}
		  {/foreach}
		  </ul>
        </div>
        <div class="col l3 s12">
          <h5 class="white-text">{$footer_setlang_{$UserLanguageCode}}</h5>
          <ul>
			 	{foreach item=l from=$language}
            <li><img src="{$PATH}images/flags/{$l.code}.gif" /> <a class="white-text" href="{$PATH}language/{$l.id_language}">{$l.title}</a></li>
				{/foreach}
          </ul>
        </div>
      </div>
    </div>
    <div class="footer-copyright">
      <div class="container">
      	<div class="left">{$settings.title}</div>
			<div class="right">{$config.title}&nbsp;&nbsp;{$config.ver}</div>
      </div>
    </div>
  </footer>


  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="{$PATH}common/materialize/js/materialize.min.js"></script>
  <script src="{$tpl_folder_path}/js/init.js"></script>

  </body>
</html>