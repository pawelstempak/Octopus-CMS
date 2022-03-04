<?php
function file_upload() {

 if(isset($_FILES['attachment'])){
       $errors= array();
           $file_name = $_FILES['attachment']['name'];
           $file_size =$_FILES['attachment']['size'];
           $file_tmp =$_FILES['attachment']['tmp_name'];
           $file_type=$_FILES['attachment']['type'];
	$extensions= array("jpeg","jpg","png","pdf","doc","xls","docx","xlsx","ppt");

   $file_ext=strtolower(end(explode('.',$_FILES['attachment']['name'])));
	if(in_array($file_ext,$extensions)=== false){
	  $errors[]="Rozszerzenie niedozwolone.";
	}
	if($file_size > 2097152){
	  $errors[]='Plik nie mo&#191;e by&#18423;i&#39603;zy ni&#191; 2 MB.';
	}
	$file_name = time()."_".$file_name;
   if(empty($errors)==true){
      move_uploaded_file($file_tmp,TATARSKA_ABSOLUTE_PATH."images/".$file_name);

		return $file_name;
   }
   else{
      print_r($errors);
   }

}

}

############# Zapis do MySQL danych kursu ################
if(isset($_POST['save']) or isset($_POST['save_close']))
{
		$pdo -> exec("
			INSERT INTO blog (name, content, budynek, data)
			VALUES ('".$_POST['name']."', '".$_POST['content']."', '".$_POST['budynek']."', '".date("Y-m-d", strtotime($_POST['date']))."')
		");

		$stmt = $pdo -> query("
							SELECT id_blog
							FROM blog
							WHERE id_blog = LAST_INSERT_ID();
		");
		$last_id = $stmt -> fetch();

		$stmt->closeCursor();
		unset($stmt);

		/*
		if(isset($_POST['attachment']) and $_POST['attachment']!="")
		{
			$filename = file_upload();
				$pdo -> exec("
					INSERT INTO attachment
					SET filename = '".$filename."', id_lesson = '".$last_id['id_lesson']."'
				");

		}
		*/
	if(isset($_POST['save'])){header("Location: ".PATH_BACKEND."blog/ok");}

}

$stmt = $pdo -> query("
							SELECT *
							FROM blog
							ORDER BY data
");
foreach($stmt as $row)
{
	$blogs[] = $row;
}

$stmt->closeCursor();
unset($stmt);

$smarty->assign('blog',$blogs);
?>