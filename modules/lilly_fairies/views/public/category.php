<div id="pat_content"> 
<div id="header">
        <h1><?php echo anchor(site_url(),"<img src=\"assets/images/cecilie/logo.png\" />"); 
       // echo "<img src=\"assets/images/cecilie/logo.png\" />";
            echo "<span class=\"negindent\">". $this->preference->item('site_name')."</span>";
            ?>
   </h1>
    </div>	
<?php
echo "<pre>category: ";
print_r($category);
echo "</pre>";

echo "<div id=\"catdesc\">";
//echo "<h1>".$category['name']."</h1>\n";
echo "<h2>".$category['shortdesc'] . "</h2>\n";
echo $category['longdesc'] . "\n";
echo "</div>";
 /*
echo "<pre>menu";
print_r ($menu);
echo "</pre>";

echo "<pre>";
print_r ($items);
echo "</pre>";
 * 
 */
if(isset($items)){
echo "<ul id=\"patterns\">\n";
foreach($items as $item){
    $imageinfo = $item['thumbnail'];
    $thumbnail=convert_image_path($imageinfo);
    $imageinfo = $item['image'];
    $image=convert_image_path($imageinfo);

    echo "<li class=\"".$item['class']."\" >\n<img src=\"". 
    $thumbnail."\" alt=\"".$item['name']. "\" width=\"144\" height=\"207\" />\n";
    echo "<div class=\"productdesc\">\n";
    echo "<a title=\"".$item['name']."\" rel=\"imagebox\" href=\"".$image."\">\n<span class=\"magnifying\">See more details</span></a><br />\n";
    echo "<p>$item[name]</p>\n";
    echo "</div>\n";
    echo "</li>\n";	
}
echo "</ul>";
}

?>
 <img id="pat_collection" src="<?php echo base_url()?>assets/images/cecilie/collection.png" />
    
</div>

<?php
/*
echo "<pre>items: ";
print_r($items);
echo "</pre>";
*/
?>