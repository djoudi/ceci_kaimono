<?php

class Lilly_fairies extends Public_Controller {


  function  Lilly_fairies(){
    parent::Public_Controller();
  }

  
  function index(){
    
        // this one is for a visitor changing a language first time through form
        if ($this->input->post('lang')){
            $lang = $this->input->post('lang');
            // set it in session
            // delete session in cart 
            //unset($_SESSION['cart']);
            //unset($_SESSION['totalprice']);
            // currently session is stored in the form of english = english rather than 0 english
            $this->session->set_userdata('lang', $lang);
            // then load that language file
            // for testing language in header
            //$this->lang->load($this->langfilename, $lang);
            // $module is name of folder
            redirect( $this->module.'/index','refresh');
        }
        //$webshop = $module;
        $indexpath = $this->index_path;
        // if session lang is set then pull that language contetnt
        // otherwise pull english
        if($this->language==$this->config->item('language')){
            $page = $this->MPages->getPagePath($indexpath);
        }  else {
          // $language = $this->session->userdata('lang');
            // find lang id
            //$lang_id = $this->MLangs->getId($language);
            //$lang_id = $lang_id['id'];
            //$data['lang_id']=$this->lang_id;
            $page = $this->MPages->getPagePathLang($indexpath,$this->lang_id);
            // if page['content']is empty then use english
            if(empty($page['content'])){
              //  $webshop = $module;
                $page = $this->MPages->getPagePath($indexpath);
            }
        }
   	// you need to change webshop_lang $lang['webshop_folder'] = 'webshop';
        // according to your folder name.
   	//$webshop = $module;
        // feature == front
        //$feature='webshop';
	//$featureimages = $this -> MProducts -> getFrontFeaturebyLang($feature,$this->lang_id);
        //$featureimages = $this -> MProducts -> getFrontFeature($webshop);
	
	// load slideshow preference
	$this->bep_assets->load_asset_group($this->preference->item('webshop_slideshow'));
	
	// slideshow images
	//$catname = "Slideshow";
        $slideimages = $this->MKaimonokago->getAllSimple('slideshow');
	//$slideimages = $this -> MSlideshow -> getAllslideshow();
	$data['slides'] = $slideimages;
	
	//$data['images'] = $featureimages;
    if($page){// in order to prevent an error after installation
        $data['title'] = $this->preference->item('site_name').": ".$page['name'];
        $data['pagecontent'] = $page;
    }else{
        $data['title'] = $this->preference->item('site_name').": ".'Welcome';
        $data['pagecontent'] = '';
    }
    // delete these
    $data['get_class']=  get_class();
    $data['index_path']=$indexpath;
    $data['module']=$this->module;
    $data['myclass']=$this->myclass;
    // delete upto here
    $data['page'] = $this->config->item('backendpro_template_public') . 'frontpage';
    $data['header'] ="HOME";
    $data['module'] = $this->module;
    $this->load->view($this->_container,$data);
     
  }
  
  
}
/* End of file lilly_fairies.php */
/* Location: ./modules/welcome/controllers/lilly_fairies.php */
