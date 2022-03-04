<?php
include('../config.php');

$xmlDoc=new DOMDocument();
$xmlDoc->load(ABS_PATH_BACKEND."xml/pages_livesearch.xml");

$x=$xmlDoc->getElementsByTagName('link');

//get the q parameter from URL
$q=$_GET["q"];

//lookup all links from the xml file if length of q>0
if (strlen($q)>0) {
  $hint="";
  for($i=0; $i<($x->length); $i++) {
    $y=$x->item($i)->getElementsByTagName('title');
    $z=$x->item($i)->getElementsByTagName('id');
	 $code=$x->item($i)->getElementsByTagName('code');
    if ($y->item(0)->nodeType==1) {
      //find a link matching the search text
      if (stristr($y->item(0)->childNodes->item(0)->nodeValue,$q)) {

          $h="<div class='c-header row row-table grey lighten-4 bold'><div class='col s5 m7 l8'><a href='" .
          "edit_".$n."pages/" . $z->item(0)->childNodes->item(0)->nodeValue . "'>" .
          $y->item(0)->childNodes->item(0)->nodeValue . "</a><span class='new badge' data-badge-caption='".strtoupper($code->item(0)->childNodes->item(0)->nodeValue)."'></span></div><div class='col s7 m5 l4 right-align'><a href='edit_".$n."menus/" . $z->item(0)->childNodes->item(0)->nodeValue . "'><span class='material-icons'>edit</span></a></div></div>";

        if ($hint=="") {
		  	$hint = $h;
        } else {
          $hint=$hint . $h;
        }
      }
    }
  }
}

// Set output to "no suggestion" if no hint was found
// or to the correct values
/*
if ($hint=="") {
  $response="&nbsp;&nbsp;Brak wynik&#258;łw do wy&#313;&#8250;wietlenia";
} else {
  $response=$hint;
}
*/
$response="<li>".$hint."</li>";
//output the response
echo $response;
?>