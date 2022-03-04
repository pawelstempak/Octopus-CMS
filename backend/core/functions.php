<?php
function POST2LangId($arr,$indx)
{
	$arr_keys = array_keys($arr);
	foreach ($arr_keys as $key => $value)
	{
		if(strstr($value,$indx))
		{
			$result = explode("_",$value);
			$result[0]==$indx?$id[] = $result[1]:"";
		}
	}
	return $id;
}

function clear_signs($string)
{
	 $wynik = str_replace('&#8222;', '"',$string);
	 $wynik = str_replace('&#8221;', '"',$wynik);
	 $wynik = str_replace('&#8211;', '-',$wynik);
	 $wynik = str_replace('&#8230;', '...',$wynik);
    return $wynik;
}

function ClearPolishSigns($text)
{
     $ReplacePolishSign = array(
         'ą' => 'a', 'Ą' => 'A', 'ę' => 'ę', 'Ę' => 'E',
         'ć' => 'c', 'Ć' => 'C', 'ń' => 'n', 'Ń' => 'N', 'ł' => 'l',
         'Ł' => 'L', 'ś' => 's', 'Ś' => 'S', 'ż' => 'z',
         'Ż' => 'Z', 'ź' => 'z', 'Ź' => 'Z', 'ó' => 'o', 'Ó' => 'o'
         );

     return str_replace(array_keys($ReplacePolishSign), array_values($ReplacePolishSign), $text);
}

function restful_url($text,$menu,$id=0)
{
	 global $pdo;

    $text = ClearPolishSigns($text);

    $text = strtolower($text);

    $text = str_replace(' ', '-', $text);

    $text = preg_replace('/[^0-9a-z\-]+/', '', $text);

    $text = preg_replace('/[\-]+/', '-', $text);

    $text = trim($text, '-');

		$stmt=$pdo->query("
					SELECT id_menu
					FROM menus
					WHERE restful_url = '".$text."' and type = '".$menu."' and id_menu != '".$id."'
					");
		$url = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);
		if($url['id_menu']!="")
		{
			$text = $text."1";
			$text = restful_url($text,$menu);
		}

    return $text;
}

function SafeModuleName($text)
{

    $text = ClearPolishSigns($text);

    $text = strtolower($text);

    $text = str_replace(' ', '-', $text);

    $text = preg_replace('/[^0-9a-z\-]+/', '', $text);

    $text = preg_replace('/[\-]+/', '-', $text);

    $text = trim($text, '-');

    return $text;
}

function up($id,$type)
{

		global $pdo;

		$stmt=$pdo->query("
							SELECT *
							FROM menus
							WHERE id_menu = '".$id."'
							");
		$m = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);
		// pozycja wyżej
		$p1 = $m['sort'];
		$stmt=$pdo->query("
							SELECT MAX(sort)
							FROM menus
							WHERE type='".$type."' and parent_id = '".$m['parent_id']."' and sort < '".$p1."'
							");
		$n = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);
		$p2 = $n['MAX(sort)'];
		$stmt=$pdo->query("
							SELECT id_menu
							FROM menus
							WHERE type='".$type."' and parent_id = '".$m['parent_id']."' and sort = '".$p2."'
							");
		$o = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);
		$id_min_sort = $o['id_menu'];
		// pozycja niżej
		$pdo -> exec("
							UPDATE menus
							SET sort = '".$p1."'
							WHERE id_menu = '".$id_min_sort."'
		");
		$pdo -> exec("
							UPDATE menus
							SET sort = '".$p2."'
							WHERE id_menu = '".$m['id_menu']."'
		");

}

function down($id,$type)
{

		global $pdo;

		$stmt=$pdo->query("
							SELECT *
							FROM menus
							WHERE id_menu = '".$id."'
							");
		$m = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);
		// pozycja wyżej
		$p1 = $m['sort'];
		$stmt=$pdo->query("
							SELECT MIN(sort)
							FROM menus
							WHERE type='".$type."' and parent_id = '".$m['parent_id']."' and sort > '".$p1."'
							");
		$n = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);
		$p2 = $n['MIN(sort)'];
		$stmt=$pdo->query("
							SELECT id_menu
							FROM menus
							WHERE type='".$type."' and parent_id = '".$m['parent_id']."' and sort = '".$p2."'
							");
		$o = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);
		$id_min_sort = $o['id_menu'];
		// pozycja niżej
		$pdo -> exec("
							UPDATE menus
							SET sort = '".$p1."'
							WHERE id_menu = '".$id_min_sort."'
		");
		$pdo -> exec("
							UPDATE menus
							SET sort = '".$p2."'
							WHERE id_menu = '".$m['id_menu']."'
		");

}

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

function CheckParentID($id_lang, $type, $element, $id_menu = '0')
{
	global $pdo, $menus;

	$stmt=$pdo->query("
						SELECT m.id_menu, l.content, m.restful_url, m.status, m.parent_id, m.sort, m.type, l.id_language, l.id_element, m.home, lang.code
						FROM menus m, language_content l, language lang
						WHERE m.id_menu = l.id_element and m.type = '".$type."' and l.id_language = '".$id_lang."' and l.id_language = lang.id_language and l.element = '".$element."' and m.parent_id = '".$id_menu."'
						ORDER BY m.sort
						");
	$m = $stmt->fetchAll();
	$stmt->closeCursor();
	unset($stmt);

	foreach($m as $value => $data)
	{
		$data['level'] = CheckLevel($data['id_menu']);
		$menus[] = $data;
		CheckParentID($id_lang, $type, $element, $data['id_menu']);
	}

	return $menus;
}
function CreateXMLSearchFile($type, $element, $id_menu = '0')
{
	global $pdo, $menus;

	$stmt=$pdo->query("
						SELECT m.id_menu, l.content, m.restful_url, m.status, m.parent_id, m.sort, m.type, lang.code
						FROM menus m, language_content l, language lang
						WHERE m.id_menu = l.id_element and m.type = '".$type."' and l.element = '".$element."' and m.parent_id = '".$id_menu."' and lang.id_language = l.id_language
						ORDER BY m.sort
						");
	$oplik=fopen(ABS_PATH_BACKEND."xml/".$type."_livesearch.xml","w");
	fputs($oplik,"<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<menu>
	");
	foreach($stmt as $row)
	{
	fputs($oplik,"<link>");
	fputs($oplik,"<id>".$row['id_menu']."</id>");
	$tytul=preg_replace('/&(?!#?[a-z0-9]+;)/', '&amp;', $row['content']);
	fputs($oplik,"<title>".$tytul."</title>");
	fputs($oplik,"<code>".$row['code']."</code>");
	fputs($oplik,"</link>");
	}
	fputs($oplik,"</menu>");
	fclose($oplik);
}

function CreateXMLSearchPagesFile($element)
{
	global $pdo;

	$stmt=$pdo->query("
						SELECT p.id_pages, l.content, p.status, lang.code
						FROM pages p, language_content l, language lang
						WHERE p.id_pages = l.id_element and l.element = '".$element."' and lang.id_language = l.id_language
						ORDER BY l.content
						");
	$oplik=fopen(ABS_PATH_BACKEND."xml/pages_livesearch.xml","w");
	fputs($oplik,"<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<menu>
	");
	foreach($stmt as $row)
	{
	fputs($oplik,"<link>");
	fputs($oplik,"<id>".$row['id_pages']."</id>");
	$tytul=preg_replace('/&(?!#?[a-z0-9]+;)/', '&amp;', $row['content']);
	fputs($oplik,"<title>".$tytul."</title>");
	fputs($oplik,"<code>".$row['code']."</code>");
	fputs($oplik,"</link>");
	}
	fputs($oplik,"</menu>");
	fclose($oplik);
}

function pasek($rekordow,$na_stronie,$na_pasku,$skrypt,$s) {
  if($na_stronie>0)
  {
  $stron = ceil($rekordow/$na_stronie);
  }
  if ($s<1) $s=1;
  if ($s>$stron) $s=$stron;
  $koniec = $s+$na_pasku;
  if ($s<=$na_pasku) $koniec = $na_pasku*2+1;
  if ($koniec>$stron) $koniec = $stron;
  $start = $koniec-$na_pasku*2;
  if ($start<1) $start=1;
  if ($s>1) $p = "<li class='waves-effect'><a href='".($s-1)."$skrypt'><i class='material-icons'>chevron_left</i></a></li>";
  else $p = "<li class='disabled'><a href='!#'><i class='material-icons'>chevron_left</i></a></li>";
  if ($s<$stron) $n = "<li class='waves-effect'><a href='".($s+1)."$skrypt'><i class='material-icons'>chevron_right</i></a></li>";
  else $n = "<li class='disabled'><a href='!#'><i class='material-icons'>chevron_right</i></a></li>";
  for ($i=$start; $i<=$koniec; $i++) {
    if ($i==$s) $l .= "<li class='active'><a href='$i$skrypt'>$i</a></li>";
    else $l .= "<li class='waves-effect'><a href='$i$skrypt'>$i</a></li>";
  }
  if ($rekordow<1) $wynik = "";
  //else $wynik = "$s/$stron<br />";
  if ($stron>1) $wynik .= "$p $l $n";
  return $wynik;
}
?>