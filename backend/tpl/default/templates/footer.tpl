  <footer class="page-footer grey">
    <div class="footer-copyright">
      <div class="container center">
    	<a href="https://octopus-cms.net" class="link_footer"><b>{$config.title}</b>&nbsp;&nbsp;<span>ver. {$config.ver}</span></a>&nbsp;&nbsp; - &nbsp;&nbsp;<a href="{$PATH}" target="_blank">{$frontend_settings.title}</a>
      </div>
    </div>
  </footer>

  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="{$PATH}common/materialize/js/materialize.min.js"></script>
  <script src="{$tpl_folder_path}/js/init.js"></script>
  	<script>

	$(window).ready(function() {
	    $("#loader-wrapper").fadeOut(300);
	});

	</script>
  </body>
</html>