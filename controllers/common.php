<?php
##########################################################
###################menus list definition##################
##########################################################

$menus_list = PrimeMenu($userLanguage);
$smarty->assign("menus_list",$menus_list);

$second_menus_list = SecondMenu($userLanguage);
$smarty->assign("second_menus_list",$second_menus_list);

$smarty->assign("footer_pl","Jest responsywny, skalowalny i prosty w obsłudze. Idealny dla końcowego użytkownika i skierowany do Full Stack Deweloperów. Octopus to narzędzie łączące w sobie cechy systemu CMS oraz frameworków frontendowych.");
$smarty->assign("footer_en","Jest responsywny, skalowalny i prosty w obsłudze. Idealny dla końcowego użytkownika i skierowany do Full Stack Deweloperów. Octopus to narzędzie łączące w sobie cechy systemu CMS oraz frameworków frontendowych.");
$smarty->assign("footer_de","Jest responsywny, skalowalny i prosty w obsłudze. Idealny dla końcowego użytkownika i skierowany do Full Stack Deweloperów. Octopus to narzędzie łączące w sobie cechy systemu CMS oraz frameworków frontendowych.");
$smarty->assign("footer_it","Jest responsywny, skalowalny i prosty w obsłudze. Idealny dla końcowego użytkownika i skierowany do Full Stack Deweloperów. Octopus to narzędzie łączące w sobie cechy systemu CMS oraz frameworków frontendowych.");

$smarty->assign("footer_setlang_pl","Ustaw język");
$smarty->assign("footer_setlang_en","Set language");
$smarty->assign("footer_setlang_de","Ustaw język");
$smarty->assign("footer_setlang_it","Ustaw język");
?>