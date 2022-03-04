<?php
	$page_title = $page->getPageContent('pages_title',$route['id_pages'],$userLanguage);
	$smarty->assign('title',$page_title);

	$stmt = $pdo -> query("
								SELECT lc.content, lc.id_element as id_pages, m.restful_url
								FROM pages_list pl, language_content lc, menus m
								WHERE pl.id_list = '".$page->getPageId($_GET['page'])."' and pl.id_pages = lc.id_element and lc.id_language = '".$userLanguage."' and lc.element = 'pages_title' and m.id_pages = pl.id_pages
								");
	$pages_list = $stmt->fetchAll();
	$smarty->assign('pages_list',$pages_list);


?>