<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<?php print $this->bep_site->get_metatags(); ?>
	<title><?php print $header.' | '.$this->preference->item('site_name'); ?></title>
	<?php print $this->bep_site->get_variables()?>
	<?php print $this->bep_assets->get_header_assets();?>
	<?php print $this->bep_site->get_js_blocks()?>
        <base href="<?php echo base_url();?>" />
</head>

<body>
<div id="wrapper">
    <div id="topnav">
       <?php
if(count($this->data['mainnav'])){
    echo "\n<ul id='nav'>";

    foreach ($this->data['mainnav'] as $key => $menu){
         if($menu['lang_id']==$this->data['lang_id']){
        echo "\n<li class='menuone'>\n";
        // need to find page uri from id
        // menu /page_uri/lang_id
       
        echo anchor ($this->data['mainmodule']."/pages/".$menu['id'], $menu['name']);
            if (count($menu['children'])){
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
                        }
                    echo "\n</li>";
                    }
                echo "\n</ul>";
            }
            echo "\n</li>\n";
    }
    }
echo "\n</ul>\n";
}
?>
    </div>
