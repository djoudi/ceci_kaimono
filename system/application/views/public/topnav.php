 <div id="topnav">
<?php
if(count($this->data['mainnav'])){
    echo "\n<ul id='nav'>";   
    foreach ($this->data['mainnav'] as $key => $menu){
        $activeid = $this->uri->segment(3); // for active class
        $method_name = strtolower($this->uri->segment(2)); // some page has method name in the second seg
        $beppages = $this->uri->segment(1); // for BeP pages and lilly_fairies pages
        $category_menu_id = $this->preference->item('category_menu_id');
        if(isset($pagecontent)){// this is needed if there is no pagecontent such as BeP pages
            if($pagecontent['name']==$menu['name']){
                $content_exist=TRUE;
            }else{// this part is for front-end
                $content_exist=FALSE;
            }
        }else{// this part is for the auth pages
                $content_exist=FALSE;
            }
 
            
        // if segment 2 is cat(category) and $menu['id']==$this->preference->item('cateory_menu_id ') should have active
        //OR strtolower($menu['name'])==$method_name part for contact, paaterns etc
        // OR $content_exist part for home
        if($beppages=="lilly_fairies"){
            $activeclass="";
        }elseif($method_name=='cat' AND $menu['id']==$category_menu_id OR $content_exist OR strtolower($menu['name'])==$method_name){
            $activeclass=" active";
        }  elseif ($method_name=='pages') {// this is needed not to add active to main menu pages/17 when cat/17 is in url 
            if($menu['id']==$activeid){//second one is for homepage
            $activeclass=" active";
        }elseif($beppages=="auth"){
            $activeclass="";
        }else{
            $activeclass="";
        }
        }else{
            $activeclass="";
        }

         if($menu['lang_id']==$this->data['lang_id']){
        echo "\n<li class='menuone".$activeclass."'>\n";
        // need to find page uri from id
        // menu /page_uri/lang_id
        echo anchor ($this->data['mainmodule']."/pages/".$menu['id'], $menu['name']);
        $category_menu_id = $this->preference->item('category_menu_id');
        if($menu['id'] == $category_menu_id){// if activeid is the same as other work id then show category list
            
            echo "\n<ul id='catnav'>";
            foreach ($this->data['navlist'] as $key => $menu){
                    echo "\n<li class='menuone'>\n";
                    echo anchor ($this->data['mainmodule']."/cat/".$key, $menu);
                    echo "\n</li>\n";
            }
            echo "\n</ul>\n";
        }elseif (count($menu['children'])){
                echo "\n<ul>";
                    foreach ($menu['children'] as $subkey => $submenu){
                    echo "\n<li class='menutwo'>\n";
                    echo anchor($this->data['mainmodule']."/pages/".$submenu['id'],$submenu['name']);         
                    if (count($submenu['children'])){
                        echo "\n<ul>";
                        foreach ($submenu['children'] as $subkey => $subsubname){
                        echo "\n<li class='menuthree'>\n";
                        echo anchor($this->data['mainmodule']."/cat/",$subsubname['name']);
                        echo "\n</li>";
                        }
                        echo "\n</ul>";
                        }// end of count ($subment...
                    echo "\n</li>";
                    }
                echo "\n</ul>";
            }// end of elseif
            
            
            
            echo "\n</li>\n";
    }
    }
echo "\n</ul>\n";
}
?>
    </div><!-- end of topnav -->