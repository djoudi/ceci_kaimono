<div id="pat_content"> 
<div id="header">
<h1>
<?php 
    echo anchor(site_url(),"<img src=\"assets/images/cecilie/logo.png\" />\n"); 
    echo "\n<h1 class=\"negindent\">\n". $this->preference->item('site_name')."\n</h1>\n";//for SEO, but not showing sitename 
?>
</h1>
    </div><!-- end of id header -->	
<?php
echo "<div id=\"catdesc\">\n";
//echo "<h1>".$category['name']."</h1>\n";
echo "<h2>".$category['shortdesc'] . "</h2>\n";
echo $category['longdesc'] . "\n";
echo "</div><!-- end of catdesc -->\n";
if(isset($items)){
    if($this->uri->segment(3)==$this->preference->item('quicksand_colorbox_cat_id')){
        echo "<ul class='splitter'>\n<li><span class='minimal'>Filter by type:</span>\n<ul>\n";
        echo '<li class="segment-0 selected-1 clean-gray"><a href="#" data-value="all">Everything</a></li>';
        $num = count($illust_categories);
        foreach($illust_categories as $key => $illust_category){
            $key = $key +1;
            echo "\n<li class='segment-".$key." clean-gray'><a href='#' data-value='".strtolower($illust_category['name'])."'>"
            .$illust_category['name'];
            echo "</a></li>";
        }//end of foreach
        echo "\n</ul>\n</li>\n";
        echo "<li><span class='minimal'>Sort by:</span>\n
	    <ul>\n
                <li class=\"segment-2 selected-1 clean-gray\"><a href=\"#\" data-value=\"desc\">Random</a></li>\n
	      <li class=\"segment-1 clean-gray\"><a href=\"#\" data-value=\"name\">Name</a></li>\n
	      
	    </ul>\n
	  </li>\n";
        echo "</ul>";
    }// end of if statement to show top filter
    
    if($this->uri->segment(3)==$this->preference->item('quicksand_colorbox_cat_id')){
        echo "\n<ul id=\"list\" class=\"image-grid\" >\n\n";
        foreach($items as $key => $item){// for quicksand +  colorbox
            // if segment(3) == $this->preference->item('quicksand_colorbox_cat_id') then use Quicksand and colorbox

            $imageinfo = $item['thumbnail'];
            $thumbnail=convert_image_path($imageinfo);
            $imageinfo = $item['image'];
            $image=convert_image_path($imageinfo);
            $key = $key +1;
            echo "<li data-id='id-".$key."' class=\"".$item['class']."\" >\n";
                //<img src=\"". $thumbnail."\" alt=\"".$item['name']. "\" width=\"144\" height=\"207\" />\n";
            //echo "<div class=\"productdesc\">\n";
            echo "<a title=\"".$item['name']."\" rel=\"imagebox\" href=\"".$image."\">\n";
            echo "<img src=\"". $thumbnail."\" alt=\"".$item['name']. "\" width=\"77\" height=\"105\" />\n";
            echo "</a><br />\n";
            echo "<strong>$item[name]</strong>\n";
            echo "<span>$item[shortdesc]</span>\n";
            //echo "</div>\n";
            echo "</li>\n\n";	
        }//end of foreach        
        echo "</ul><!-- end of ul list -->\n";
        
        
    }else{
        echo "<ul id=\"patterns\">\n\n";
        foreach($items as $item){
            // if segment(3) == $this->preference->item('quicksand_colorbox_cat_id') then use Quicksand and colorbox

            $imageinfo = $item['thumbnail'];
            $thumbnail=convert_image_path($imageinfo);
            $imageinfo = $item['image'];
            $image=convert_image_path($imageinfo);

            echo "<li class=\"".$item['class']."\" >\n<img src=\"". 
            $thumbnail."\" alt=\"".$item['name']. "\" width=\"144\" height=\"207\" />\n";
            echo "<div class=\"productdesc\">\n";
            echo "<a title=\"".$item['name']." ".$item['longdesc']."\" rel=\"imagebox\" href=\"".$image."\">\n<span class=\"magnifying\">See more details</span>\n</a><br />\n";
            echo "<p>$item[name]</p>\n";
            echo "</div>\n";
            echo "</li>\n\n";	
        }//end of foreach
        echo "</ul><!-- end of ul patterns -->\n";
    }// end of else
        
}// end of isset($items)

?>
 <img id="pat_collection" src="<?php echo base_url()?>assets/images/cecilie/collection.png" />
    
</div><!-- end of pat_content -->

<?php
/*
echo "<pre>category: ";
print_r($category);
echo "</pre>";
*/
 /*
echo "<pre>menu";
print_r ($menu);
echo "</pre>";
 
echo "<pre>items: ";
print_r ($items);
echo "</pre>";
* 
 */
/*
echo "<pre>items: ";
print_r($items);
echo "</pre>";
*/
?>