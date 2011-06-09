   <div id="header">
        <h1><?php echo anchor(site_url(),"<img src=\"assets/images/cecilie/logo.png\" />"); 
       // echo "<img src=\"assets/images/cecilie/logo.png\" />";
            echo "<span class=\"negindent\">". $this->preference->item('site_name')."</span>";
            ?>
   </h1>
    </div>

<?php
/*
if(isset ($lang_id)){
    echo "<br />lang_id: ";
print_r ($lang_id);
}
echo "<br />session lang is ";
echo $this->session->userdata('lang');
echo "<br />Language is ";
print_r ($language);


echo "<pre>";
print_r($pagecontent);
echo "</pre>";
 * 
 */

$mystring = strtolower($pagecontent['path']);
$findme   = 'about';
$pos = strpos($mystring, $findme);

// The !== operator can also be used.  Using != would not work as expected
// because the position of 'a' is 0. The statement (0 != false) evaluates 
// to false.
if ($pos !== false) {
     echo "<div id=\"aboutpage\">";
} else {
     echo "<div id=\"commonpage\">";
}
echo "<h2>".$pagecontent['name']."</h2>";
$prefix="../";
$pagecontent = str_replace($prefix, "", $pagecontent['content']);
echo $pagecontent;
echo "</div>";


?>