<?php
function CheckLevel($id_menu)
{
	global $pdo;
	$level = 0;
	do {
			$stmt=$pdo->query("
								SELECT parent_id
								FROM menus
								WHERE id_menu = '".$id_menu."'
								");
			$m = $stmt->fetch();
			$stmt->closeCursor();
			unset($stmt);
			$id_menu = $m['parent_id'];
			$level = $level+1;

	} while ($id_menu > 0);

	return $level;
}

function PrimeMenu($id_lang, $id_menu = '0')
{
	global $pdo, $menus;

	$stmt=$pdo->query("
						SELECT m.id_menu, l.content, m.restful_url, m.status, m.parent_id, m.sort
						FROM menus m, language_content l
						WHERE m.id_menu = l.id_element and m.type = 'prime' and l.id_language = '".$id_lang."' and l.element = 'menus' and m.parent_id = '".$id_menu."' and m.status = '1'
						ORDER BY m.sort
						");
	$m = $stmt->fetchAll();
	$stmt->closeCursor();
	unset($stmt);

	foreach($m as $value => $data)
	{
		$data['level'] = CheckLevel($data['id_menu']);
		$menus[] = $data;
		PrimeMenu($id_lang, $data['id_menu']);
	}

	return $menus;
}

function SecondMenu($id_lang, $id_menu = '0')
{
	global $pdo, $second_menus;

	$stmt=$pdo->query("
						SELECT m.id_menu, l.content, m.restful_url, m.status, m.parent_id, m.sort
						FROM menus m, language_content l
						WHERE m.id_menu = l.id_element and m.type = 'second' and l.id_language = '".$id_lang."' and l.element = 'menus' and m.parent_id = '".$id_menu."' and m.status = '1'
						ORDER BY m.sort
						");
	$m = $stmt->fetchAll();
	$stmt->closeCursor();
	unset($stmt);

	foreach($m as $value => $data)
	{
		$data['level'] = CheckLevel($data['id_menu']);
		$second_menus[] = $data;
		SecondMenu($id_lang, $data['id_menu']);
	}

	return $second_menus;
}
?>