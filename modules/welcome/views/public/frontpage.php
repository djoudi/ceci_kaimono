<div id="maintop">
    <div id="header">
        <h1><?php echo anchor(site_url(),"<img src=\"assets/images/cecilie/logo.png\" />"); 
       // echo "<img src=\"assets/images/cecilie/logo.png\" />";
            echo "<span class=\"negindent\">". $this->preference->item('site_name')."</span>";
            ?>
   </h1>
    </div>
    <div id="slidecontainer">
<?php 
   
 
/*
echo "<pre>get_class is: ";
print_r($get_class);
echo "</pre>";
echo "<pre>module name is: ";
print_r($module);
echo "</pre>";
echo "<pre>index path is: ";
print_r($index_path);
echo "</pre>";
echo "<pre>cat_parent is: ";
print_r ($this->data['cat_parent']);
echo "</pre>";
echo "<pre>navlist: ";
print_r ($this->data['navlist']);
echo "</pre>";
*/

    if(!empty($slides)){
        echo "<div id=\"slideshow\" class=\"pics\">";
        foreach ($slides as $slide)
        {
            $imageinfo = $slide['image'];
                            $slideimg=convert_image_path($imageinfo);
            echo '<img class="hideme" src="'. $slideimg. '" alt="' . $slide['name'] .
            '" />';

        }
        echo "</div>";
    }
    ?>
    </div><!-- end of slidecontatier -->
    <div id="frontcont">
    <?php
    echo anchor("http://www.licensing.org/",'<img id="lima_logo" src="assets/images/cecilie/lima_logo.png" />', array('target' => '_blank'));
    if(isset($pagecontent['content'])){// this if is for the installation without this it will display an error
        echo "<div id='maincont'>".$pagecontent['content']."</div>";
    }
     ?>
        
        <img id="collection" src="<?php echo base_url()?>assets/images/cecilie/collection.png" />
        
        </div>
</div>


<?php
//print_r ($pagecontent);
?>

