			 <li class="center">
	       		<div class="header grey lighten-3" style="padding:10px;">
				<ul class="pagination">
			 		{if $smarty.get.id == 1 || $smarty.get.id == ''}
						<li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
					{else}
						{assign var=prev value=$smarty.get.id}
						<li class="waves-effect"><a href="{$PATH_BACKEND}{$page}/{$prev-1}"><i class="material-icons">chevron_left</i></a></li>
					{/if}
					{for $page_number = 1 to $pag_numbers}
					<li class="{if $page_number == $smarty.get.id || $page_number == 1 && $smarty.get.id == ''}active{else}waves-effect{/if}"><a href="{$PATH_BACKEND}{$page}/{$page_number}">{$page_number}</a></li>
					{/for}
					{if $smarty.get.id}
						{if $smarty.get.id != $pag_numbers}
							{assign var=next value=$smarty.get.id}
							<li class="waves-effect"><a href="{$PATH_BACKEND}{$page}/{$next+1}"><i class="material-icons">chevron_right</i></a></li>
						{else}
							<li class="disabled"><a href="#"><i class="material-icons">chevron_right</i></a></li>
						{/if}
					{elseif  $pag_numbers != 1}
						<li class="waves-effect"><a href="{$PATH_BACKEND}{$page}/2"><i class="material-icons">chevron_right</i></a></li>
					{else}
						<li class="disabled"><a href="#"><i class="material-icons">chevron_right</i></a></li>
					{/if}
				</ul>
			 	</div>
			</li>