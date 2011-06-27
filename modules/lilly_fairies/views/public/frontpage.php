<?php 
// get the first four letters of page and put it as id for styling, i.e background image
$segtwo=$this->uri->segment(2);
$content_id = substr($segtwo, 0,4);
echo "<div id='".$content_id."'>";

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

echo anchor (site_url()."/lilly_fairies/index", "<img id='lilly_logo' src=\"assets/images/lilly_logo.png\" />");
$this->load->view( 'public/submenu');


/*
echo "<pre>submenu";
print_r ($submenu);
echo "</pre>";
*/
$this->load->view('public/bottommenu');
echo "</div><!-- end of id=lillycont -->";
?>
        
</div><!-- end of id with first 4 letters of uri seg -->



