<?php 
// get the first four letters of page and put it as id for styling, i.e background image
$content_name = strtolower($pagecontent['name']);
$content_id = str_replace('the ', '', $content_name);
$content_id = substr($content_id, 0,4);
echo "<div id='".$content_id."'>\n";

?>
<div id="header">
<h1><?php echo anchor(site_url(),"<img src=\"assets/images/cecilie/logo.png\" />"); 
// echo "<img src=\"assets/images/cecilie/logo.png\" />";
    echo "<span class=\"negindent\">". $this->preference->item('site_name')."</span>";
    ?>
</h1>
</div><!-- end of id header -->
    
<?php
echo "<div id='lillycont'>";

echo "<img id='lilly_logo' src=\"assets/images/lilly_logo.png\" />";
$this->load->view( 'public/submenu');


echo "<h2>".$pagecontent['description']."</h2>";
$prefix="../";
$pagecontent = str_replace($prefix, "", $pagecontent['content']);
echo $pagecontent;
/*
echo "<pre>submenu";
print_r ($submenu);
echo "</pre>";
*/

echo "</div><!-- end of id=lillycont -->";

$this->load->view('public/bottommenu');
?>
        
</div><!-- end of id with first 4 letters of uri seg -->







