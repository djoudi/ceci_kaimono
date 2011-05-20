<div id="maintop">
<?php 
    print displayStatus();
 
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
    <div id="frontcont">
        <img id="lima_logo" src="<?php echo base_url()?>assets/images/cecilie/lima_logo.png" />
    <?php
    if(isset($pagecontent['content'])){// this if is for the installation without this it will display an error
        echo "<div id='maincont'>".$pagecontent['content']."</div>";
    }
     ?>
        <div id="secondcol">
            <p>second language</p>
        
        </div>
        
        <img id="collection" src="<?php echo base_url()?>assets/images/cecilie/collection.png" />
        
        </div>
</div>




