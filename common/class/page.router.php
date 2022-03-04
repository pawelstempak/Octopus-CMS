<?php
class PageRouter
{

	public function getRoute($get_page)
	{
		global $pdo;

		$stmt = $pdo->query("
									SELECT restful_url
									FROM menus
									WHERE home = '1'
									");
		$h = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);
		$home_link = $h['restful_url'];

		$get_page!=""?$route_page=$get_page:$route_page=$home_link;

		$stmt = $pdo->query("
						SELECT l.tfile, l.cfile, m.id_pages
						FROM menus m, pages p, layouts l
						WHERE m.id_pages = p.id_pages and p.id_layouts = l.id_layouts and p.status = '1' and m.restful_url = '".$route_page."'
		");
		$res = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);
		$result['id_pages']=$res['id_pages'];
		if($res['tfile'] != "")
		{
			$result['controller'] = $res['cfile'];
			$result['template'] = $res['tfile'];
		}
		else
		{
			$result['template'] = "error404.tpl";
		}

		return $result;
	}

	function getPageContent($element,$id_pages,$id_language)
	{
		global $pdo;

		$stmt = $pdo->query("
						SELECT *
						FROM language_content
						WHERE id_element = '".$id_pages."' and element = '".$element."' and id_language = '".$id_language."'
		");
		$page_content = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);

		return $page_content;
	}

	function getPageId($restful_url)
	{
		global $pdo;

		$stmt = $pdo->query("
						SELECT id_pages
						FROM menus
						WHERE restful_url = '".$restful_url."'
		");
		$id_page = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);

		return $id_page['id_pages'];
	}

	function getPageURL($id)
	{
		global $pdo;

		$stmt = $pdo->query("
						SELECT restful_url
						FROM menus
						WHERE id_menus = '".$id."'
		");
		$resful_url = $stmt->fetch();
		$stmt->closeCursor();
		unset($stmt);

		return $resful_url['resful_url'];
	}
}
?>