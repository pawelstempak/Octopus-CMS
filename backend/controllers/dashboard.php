<?php
##############################################
### Set permission name of the signin user ###
##############################################
$who = new PageValidation();
$access = $who->whoYouAre($result_login_user['id']);
$smarty->assign("who_you_are",$access);

##############################################
############# last modified page #############
##############################################
$stmt = $pdo -> prepare("
							SELECT l.content, p.modified, p.id_pages
							FROM pages p, language_content l
							WHERE p.id_pages = l.id_element and l.element = 'pages_title'
							ORDER BY p.modified DESC
							LIMIT 1
");
$stmt->execute();
$page = $stmt->fetch();
$stmt->closeCursor();
unset($stmt);
$smarty->assign('page',$page);

?>