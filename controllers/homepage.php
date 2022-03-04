<?php
	$page_content = $page->getPageContent('pages_content',$route['id_pages'],$userLanguage);
	$smarty->assign('content',$page_content);
?>