<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * An open source development control panel written in PHP
 *
 * @package		lilly_fairies
 * @author		Shin Okada
 * @copyright	Copyright (c) 2011, Shinichi Okada
 * @license		http://www.gnu.org/licenses/lgpl.html
 * @link		http://www.okadadesign.no/
 * @filesource
 */

class Lilly_fairies extends Public_Controller {
    // moving to shop_controller
     private $langfilename;
     private $module; 
     private $security_method;
     private $security_question;
     private $security_answer;
     private $directory;
     private $submenu;
     private $menu_table;
     private $page_table;

    function  Lilly_fairies(){
        parent::Public_Controller();
        // load the validation library
        $this->load->library('validation');
        $this->module               = strtolower(get_class());
        $this->security_method      = $this->preference->item('security_method');
        $this->security_question    = $this->preference->item('security_question');
        $this->security_answer      = $this->preference->item('security_answer');
        $this->directory            = 'Lilly Fairies';
        $this->page_table           = 'omc_lilly_fairies_pages';
        $this->menu_table           = 'omc_lilly_fairies_menus';
        $parentid = $this->preference->item('lilly_fairies_submenu_id');
        $menutable='omc_lilly_fairies_menus';
        $this->MMenus->generateTree($tree,$parentid,$menutable);
       // $this->MMenus->generateTree($tree,$parentid);
        $this->submenu = $tree;
    }

  
    function index(){
        
        // set submenu
        $data['submenu']= $this->submenu;
        $data['page'] = $this->config->item('backendpro_template_public') . 'frontpage';
        $data['header'] =$this->directory;
        $data['module'] = $this->module;
        $this->load->view($this->_container,$data);
     
  }
  
    function pages(){
        $data['submenu']= $this->submenu;
        // find page_uri from page id
        $menu_id = $this->uri->segment(3);
        //$module='pages';
        $path = $this->MMenus->getMenuwithPage($menu_id,$this->menu_table,$this->page_table);
        $data['path']=$path;
        $path = $path['path']; 
            if($path =='contact_us'){
                   // redirect($this->module.'/contact','refresh');
            }elseif($path =='patterns'){// can be used cat but it is ok for now
                   // redirect($this->module.'/patterns','refresh');
            }else{

        // if session lang is set then pull that language contetnt
        // otherwise pull english
        if($this->session->userdata('lang')=='english' || $this->session->userdata('lang')==''){
            $lang_id =NULL;
            $data['language'] ='english';
            $page = $this->MPages->getPagePath($path,  $this->page_table);
        }  else {
             $language = $this->session->userdata('lang');
            // find lang id
            $lang_id = $this->MLangs->getId($language);
            $lang_id = $lang_id['id'];
            $data['lang_id']=$lang_id;// delete me
            $data['language'] = $this->session->userdata('lang'); // delete me
            $page = $this->MPages->getPagePathLang($path,$lang_id,$this->page_table);
        }
        
        
            //$page = $this->MPages->getPagePath($path);
            if (!empty($page)){//$page will return empty array if there is no page
            $data['pagecontent'] = $page;
            $data['title'] = $this->preference->item('site_name').": ".$page['name'];
            }else{
            // if there is no page redirect
            flashMsg('info',$this->lang->line('kago_no_translation'));
           // redirect($this->module.'/error');
            }
            $data['page'] = $this->config->item('backendpro_template_public') . 'page';
            $data['header'] =$page['name'];
            $data['module'] = $this->module;
            $this->load->view($this->_container,$data);
        }
  }
  
  
}
/* End of file lilly_fairies.php */
/* Location: ./modules/welcome/controllers/lilly_fairies.php */
