<?php
	$page_title = $page->getPageContent('pages_title',$route['id_pages'],$userLanguage);
	$smarty->assign('title',$page_title);

	$page_content = $page->getPageContent('pages_content',$route['id_pages'],$userLanguage);
	$smarty->assign('content',$page_content);
?>