{include file="header.tpl"}
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
	   <br /><br />
        <div class="page_header">{$title.content}</div>
		  <br />
		  {foreach item=u from=$pages_list}
		  <div class="divider1" /></div>
		  <br />
		  <br />
		  <div><a href="{$PATH}{$u.restful_url}">{$u.content}</a></div>
		  <br />
		  <br />
		  {/foreach}
		  <div class="divider1" /></div>
		  <br />
		  <br />
    </div>
  </div>
{include file="footer.tpl"}