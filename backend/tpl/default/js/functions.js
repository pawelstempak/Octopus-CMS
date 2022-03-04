function checkbox_hs(id_checkbox,id_language, id_title, id_content_title) {
  // Get the checkbox
  var checkBox = document.getElementById(id_checkbox);
  // Get the output text
  var id_language = document.getElementById(id_language);
  var id_title = document.getElementById(id_title);
  var id_content_title = document.getElementById(id_content_title);

  // If the checkbox is checked, display the output text
  if (checkBox.checked == true){
    id_language.style.display = "block";
	 id_title.disabled = false;
	 id_content_title.disabled = false;
  } else {
    id_language.style.display = "none";
	 id_title.disabled = true;
	 id_content_title.disabled = true;
  }
}

function ShowSearchResult(str,path_backend,typ) {

  if (str.length==0) {
    document.getElementById("livesearch").innerHTML="";
    document.getElementById("livesearch").style.border="0px";
	 document.getElementById("result").style.display="block";
    return;
  }
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else {  // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
      document.getElementById("livesearch").innerHTML=this.responseText;
      document.getElementById("livesearch").style.border="0px";
		document.getElementById("result").style.display="none";
    }
  }
  xmlhttp.open("GET",path_backend+"menu_livesearch.php?p="+typ+"&q="+str,true);
  xmlhttp.send();
}

function ShowSearchPagesResult(str,path_backend) {

  if (str.length==0) {
    document.getElementById("livesearch_pages").innerHTML="";
    document.getElementById("livesearch_pages").style.border="0px";
	 document.getElementById("result_pages").style.display="block";
    return;
  }
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else {  // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
      document.getElementById("livesearch_pages").innerHTML=this.responseText;
      document.getElementById("livesearch_pages").style.border="0px";
		document.getElementById("result_pages").style.display="none";
    }
  }
  xmlhttp.open("GET",path_backend+"pages_livesearch.php?q="+str,true);
  xmlhttp.send();
}