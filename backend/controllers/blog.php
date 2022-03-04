<?php
#####################################################################################
##################### Check if user has a right to view this page####################
#####################################################################################
$p = new PageValidation();
if($p->isSuperUser($result_login_user['id']))
{
	if($p->isPageValid($result_login_user['id'],"modules"))
	{
		header("Location: ".PATH_BACKEND);
	}
}
require_once(ABS_PATH_BACKEND."includes/class/class.upload.php");

############# Funkcja dodawania plik&#55957;&#57251;###############
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
	if($file_size > 5242880){
	  $errors[]='Plik nie mo&#191;e by&#18423;i&#39603;zy ni&#191; 5 MB.';
	}
	$file_name = md5(time()).".".$file_ext;
   if(empty($errors)==true){
      move_uploaded_file($file_tmp,PATH."images/org/".$file_name);
		return $file_name;
   }
   else{
      print_r($errors);
   }

}

}
#################################################################

############# Zapis do MySQL danych kursu ################
if($_GET['action']=="save")
{

$pdo -> exec("
			UPDATE blog
			SET name = '".$_POST['name']."', content = '".$_POST['content']."', data = '".date("Y-m-d", strtotime($_POST['date']))."', budynek = '".$_POST['budynek']."'
			WHERE id_blog = '".$_GET['id']."'
		");

 				$filename = file_upload();

					$foo = new upload(PATH."images/org/".$filename);
					$foo->file_safe_name = false;
				   // save uploaded image with no changes
				   $foo->process(PATH."images/");

				   // save uploaded image with a new name,
				   // resized to 100px wide

				   $foo->image_resize = true;
					$foo->image_ratio_crop = true;
				   $foo->image_x = 560;
				   $foo->image_y = 350;
					$foo->file_safe_name = false;
				   $foo->process(PATH."images/thumb/");

				$pdo -> exec("
					INSERT INTO img
					SET nazwa_pliku = '".$filename."', id_blog = '".$_GET['id']."'
				");


header("Location: blog,ok");

}


#################################################################

############# Usuni&#39081;e z MySQL pojedynczego postu wraz z zdj&#39081;ami ################
if($_GET['action']=="delete") {
	$pdo -> exec("
					DELETE FROM blog
					WHERE id_blog = '".$_GET['id']."'
					");
}
############################################################

############# Usuni&#39081;e z MySQL pojedy&#55371;&#56933;go zdj&#39081;a ################
if($_GET['action']=="delete_img") {
	$stmt = $pdo -> query("
						SELECT *
						FROM img
						WHERE id_img = '".$_GET['id']."'
						");
	$res = $stmt -> fetch();
	unlink(PATH."images/".$res['nazwa_pliku']);
	unlink(PATH."images/org/".$res['nazwa_pliku']);
	unlink(PATH."images/thumb/".$res['nazwa_pliku']);

	$pdo -> exec("
					DELETE FROM img
					WHERE id_img = '".$_GET['id']."'
					");
	$stmt->closeCursor();
	unset($stmt);

}
############################################################

############# Pobranie z MySQL i przekazanie do SMARTY listy u&#191;ytkownik&#55957;&#57251;###############
$stmt = $pdo -> query("
							SELECT *
							FROM blog
							ORDER BY data
");

foreach($stmt as $row)
{
	############# Pobranie z MySQL i przekazanie do SMARTY listy u&#191;ytkownik&#55957;&#57316;o wyskakuj1cego okienka ################
	unset($imgs);
	$stmt3 = $pdo -> query("
									SELECT *
									FROM img
									WHERE id_blog = '".$row['id_blog']."'
	");
	foreach($stmt3 as $row3)
	{
	  $imgs[] = $row3;
	}

	$row['images_list'] = $imgs;
	$stmt3->closeCursor();
	unset($stmt3);
	$blogs[] = $row;
}

$stmt->closeCursor();
unset($stmt);

$smarty->assign('blog',$blogs);
###########################################################################################
?>