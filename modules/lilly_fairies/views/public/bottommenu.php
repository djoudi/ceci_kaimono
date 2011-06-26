<?php
if(count($submenu)){
    echo "\n<ul id='bottommenu'>";   
    foreach ($submenu as $key => $menu){
        $activeid = $this->uri->segment(3); // for active class
        $method_name = strtolower($this->uri->segment(2)); // some page has method name in the second seg
        $beppages = $this->uri->segment(1); // for BeP pages
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
        if($method_name=='cat' AND $menu['id']==$category_menu_id OR $content_exist OR strtolower($menu['name'])==$method_name){
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
            if($menu['name']=='Lisa' OR $menu['name']=='Annika'OR $menu['name']=='Celine' OR $menu['name']=='Lilly' )
            {
                echo "\n<li class='menuone".$activeclass."'>\n";
                echo anchor ($module."/pages/".$menu['id'], $menu['name']);
                echo "\n</li>\n";
            }
        }
    }
echo "\n</ul>\n";
}
?>