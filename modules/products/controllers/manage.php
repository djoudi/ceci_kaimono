<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * modules/category/controllers/manage.php
 * Author   Shin Okada
 * Contact okada.shin@gmail.com
 * version: 1.1.4 beta
 *
 *
 */

class Manage extends Shop_Admin_Controller {

private $module;


    function Manage(){
        parent::Shop_Admin_Controller();
        // Check for access permission
        check('Products');
        $this->load->module_model('Category','MCats');
        //$this->load->module_model('Products','MProducts');
        $this->load->model('MProducts');
        $this->module=basename(dirname(dirname(__FILE__)));
        //$this->module='category';
        // Set breadcrumb
        //$this->bep_site->set_crumb('Manage '.$this->lang->line('backendpro_products'),$this->module.'/admin');
        mb_internal_encoding('UTF-8');
        }


    function index(){
        
        if($this->uri->segment(4)){
            $catid = $this->uri->segment(4);
            $data['products']= $this->MProducts->getAllProductsByCategory($catid);
            $category = $this->MCats->getCategory($catid);
            $category_name = $category['name'];
            /*
            $fields = array('id', 'name','order','parentid','status','table_id','lang_id');
            $orderby = array('lang_id','parentid','order','table_id');
            //$data['categories'] = $this->MCats->getAllCategories();
            $data['categories'] = $this->MKaimonokago->getAll($this->module,$fields, $orderby);
            */
            $data['title'] = 'Manage '.$this->lang->line('kago_product'). " of ".$category_name;
            $data['header'] = $this->lang->line('backendpro_access_control');
            $data['page'] =  "manage/admin_product_home";
            $this->bep_site->set_crumb('Manage '.$this->lang->line('backendpro_products'). " of ".$category_name,$this->module.'/admin/'.$catid);
            $data['module'] = $this->module;
            $this->load->view($this->_container,$data);           
        }else{
            flashMsg('warning','Category is not selected.');
            redirect('/admin/','refresh');
        }
    }

     function _field(){
        $data = array(
            'name'              => db_clean($_POST['name']),
            'shortdesc' 	=> db_clean($_POST['shortdesc']),
            'longdesc' 		=> db_clean($_POST['longdesc'],5000),
            'thumbnail'		=> db_clean($_POST['thumbnail']),
            'image'		=> db_clean($_POST['image']),
            'product_order'     => db_clean($_POST['product_order']),
            'class' 		=> db_clean($_POST['class'],30),
            'grouping' 		=> db_clean($_POST['grouping'],16),
            'status' 		=> db_clean($_POST['status'],8),
            'category_id' 	=> id_clean($_POST['category_id']),
            'featured' 		=> db_clean($_POST['featured'],20),
            'other_feature'     => db_clean($_POST['other_feature'],20),
            'price' 		=> db_clean($_POST['price'],16),
            'lang_id'           => db_clean($_POST['lang_id']),
            'table_id'          => db_clean($_POST['table_id']),
        );
        return $data;
    }


    function create(){
        // we are using TinyMCE in this page, so load it
        $this->bep_assets->load_asset_group('TINYMCE');
        $category_id = $this->uri->segment(4);
        $category = $this->MCats->getCategory($category_id);
        $category_name = $category['name'];
        if ($this->input->post('name')){
            $data = $this->_field();
            $this->MKaimonokago->addItem($this->module,$data);
            // fields are filled up so do the followings
            //$this->MProducts->insertProduct();
            // CI way to set flashdata, but we are not using it
            // $this->session->set_flashdata('message','Product created');
            // we are using Bep function for flash msg
            flashMsg('success','Product created');
            redirect($this->module.'/manage/index/'.$category_id,'refresh');
        }else{
            // this must be the first time, so set variables
            $data['title'] = "Create Product in ".$category_name;
            // get categories by lang_id
            // $data['categories'] = $this->MCats->getCategoriesDropDown();
            $lang_id = '0';
            $data['categories'] = $this->MCats->getCategoriesDropDownbyLang($lang_id);
            // loading this for giving some instructions.
            $data['right'] = 'admin/product_right';
            // Set breadcrumb
            $this->bep_site->set_crumb('Manage '.$this->lang->line('backendpro_products'). " of ".$category_name,$this->module.'/manage/index/'.$category_id);
            $this->bep_site->set_crumb($this->lang->line('kago_create'),$this->module.'/manage/create');
            $data['header'] = $this->lang->line('backendpro_access_control');
            $data['page'] = "manage/admin_product_create";
            $data['cancel_link']= $this->module."/manage/index/".$category_id;
            $data['module'] = $this->module;
            $this->load->view($this->_container,$data);
        }
    }


    function edit($id=0){
    // we are using TinyMCE in edit as well
        $this->bep_assets->load_asset_group('TINYMCE');
        $multilang = $this->preference->item('multi_language');
        $data['multilang']=$multilang;
        $product = $this->MKaimonokago->getInfo($this->module, $id);
        $data['product'] = $product;
        $category_id = $product['category_id'];
        $category = $this->MCats->getCategory($category_id);
        $category_name = $category['name'];
        if ($this->input->post('name')){
            // fields filled up so,
            $data = $this->_field();
            $this->MKaimonokago->updateItem($this->module,$data);
            //$this->MProducts->new_updateProduct();
            // CI way to set flashdata, but we are not using it
            // $this->session->set_flashdata('message','Product updated');
            // we are using Bep function for flash msg
            flashMsg('success','Product updated');
            redirect($this->module.'/manage/index/'.$category_id,'refresh');
        }else{
            // similar to category
            //$id = $this->uri->segment(4);
            $data['title'] = $this->lang->line('kago_edit')." ".$this->lang->line('kago_product');
            // get all the languages
            $data['languages'] =$this->MLangs->getLangDropDownWithId();
            // get translated languages
            // For other languages segment 4 is omc_products.table_id, table_id is id of english(original), omc_menu.id
            // for english is omc_products.id
            // $table_id is used to find translated languages and it is used to get info of english menu
            $table_id = $this->uri->segment(4);
            $data['translanguages'] =$this->MLangs->getTransLang($this->module,$table_id);
            $data['module']=$this->module;
            $data['page'] =  "manage/admin_product_edit";
            // get categories by lang
            $lang_id = $product['lang_id'];
            $data['categories'] = $this->MCats->getCategoriesDropDownbyLang($lang_id);
            // I am not using colors and sizes any more. But they are available if you want to use them.
            $data['assigned_colors'] = $this->MProducts->getAssignedColors($id);
            $data['assigned_sizes'] = $this->MProducts->getAssignedSizes($id);
            // I am loading product_right here which gives instructions.
            $data['right'] = 'admin/product_right';
            if (!count($data['product'])){
                redirect($this->module.'/admin/index','refresh');
            }
            // 	Set breadcrumb
            $this->bep_site->set_crumb('Manage '.$this->lang->line('backendpro_products'). " of ".$category_name,$this->module.'/manage/index/'.$category_id);
            $this->bep_site->set_crumb($this->lang->line('kago_edit'),$this->module.'/manage/edit');
            $data['header'] = $this->lang->line('backendpro_access_control');
            $data['cancel_link']= $this->module."/manage/index/".$category_id;
            $data['module'] = $this->module;
            $this->load->view($this->_container,$data);
        }
    }


    function langcreate(){
        $this->bep_assets->load_asset_group('TINYMCE');
        if ($this->input->post('name')){
            // info is filled out, so the followings
            $data = $this->_field();
            $this->MKaimonokago->addItem($this->module,$data);
            //$this->MProducts->insertProduct();
            // This is CI way to show flashdata
            // $this->session->set_flashdata('message','Page updated');
            // But here we use Bep way to display flash msg
            flashMsg('success',$this->lang->line('kago_translation_added'));
            redirect($this->module.'/admin/index','refresh');
        }else{

            // segment 4 is cat_id
            $table_id = $this->uri->segment(4);
            // need to send it to a view for cat_id
            $data['table_id']=$table_id;
            $lang_id = $this->uri->segment(5);
            $data['lang_id']=$lang_id;
            // no need for menu path
            //$path = $this->uri->segment(6);
            // check if there is no translation with this lang
            // this can use a model as well
            //$checktrans = $this->MKaimonokago->checktrans($this->module, $id, $lang_id);
            //if (count($checktrans)){
            // there is translation of this language
            //redirect with warning
            //flashMsg('warning',$this->lang->line('kago_translation_exists'));
            //redirect('menus/admin/index','refresh');
            //}
            // do normal thing
            // get all the languages
            $data['languages'] =$this->MLangs->getLangDropDownWithId();
            // get all the translated languages
            //$id =
            //$data['translanguages'] =$this->MLangs->getTransLang($this->module,$id);

            $data['translanguages'] =$this->MLangs->getTransLang($this->module,$table_id);
            //$data['translanguages'] =$this->MLangs->getTransLang($this->module,$page_uri_id);
            // get language info, langname. This will be used in Title
            $table ='languages';
            $selected_lang = $this->MKaimonokago->getinfo($table,$lang_id);
            $data['selected_lang']=  $selected_lang;
            // this must pull only pages where the segment 6 which is lang id
            // then use dropdown to select page
            // then use dropdown to select page
            //$data['pages'] = $this->MPages->getIdwithnone();
        /*
            $data['pages'] = $this->MPages->getIdwithnoneLang($lang_id);
            $lang_id = $this->uri->segment(6);
            $data['menus'] = $this->MMenus->getAllMenusDisplayByLang($lang_id);
        */          //$data['category'] = $this->MCats->getCategory($cat_id);
            $product =  $this->MKaimonokago->getInfo($this->module, $table_id);

            $data['product'] = $product;
            // get category by lang
            $data['categories'] = $this->MCats->getCategoriesDropDownbyLang($lang_id);
            // set variables here
            $data['title'] = $this->lang->line('kago_add_translation').ucwords($selected_lang['langname']);
            $data['page'] = $this->config->item('backendpro_template_admin') . "admin_lang_create";
            $data['right'] = 'admin/product_right';
            // send the parent(English) field data to use it for other languages
            //$data['menu'] = $this->MMenus->getMenu($id);
            //if (!count($data['menu'])){
                // if page is not specified redirect to index
              //  flashMsg('warning',$this->lang->line('kago_no_exists'));
              //  redirect('menus/admin/index','refresh');
            //}
            $selected_lang=ucfirst($selected_lang['langname']);// using this in bread crumb
            //$data['menus'] = $this->MMenus->getAllMenusDisplay();
            // Set breadcrumb
            $this->bep_site->set_crumb($this->lang->line('kago_add_translation').$selected_lang,$this->module.'/admin/index/');
            //$this->bep_site->set_crumb($this->lang->line('kago_add_translation').$selected_lang,'menus/admin/edit/'.$id."/".$lang_id);
            $data['cancel_link']= $this->module."/manage/index/";
            $data['header'] = $this->lang->line('backendpro_access_control');
            $data['module'] = $this->module;
            $this->load->view($this->_container,$data);
            }
    }

    
 
    function batchmode(){
        $this->MProducts->batchUpdate();
        redirect($this->module.'/admin/index','refresh');
    }

    function export(){
        $this->load->helper('download');
        $csv = $this->MProducts->exportCsv();
        $name = "product_export.csv";
        force_download($name,$csv);

    }

    function import(){
        if ($this->input->post('csvinit')){
            $data['csv'] = $this->MProducts->importCsv();
            $data['title'] = "Preview Import Data";
            // Set breadcrumb
            $this->bep_site->set_crumb($this->lang->line('userlib_product_import'),$this->module.'/admin/import');
            $data['header'] = $this->lang->line('backendpro_access_control');
            $data['page'] = $this->config->item('backendpro_template_admin') . "admin_product_csv";
            $data['module'] = $this->module;
            $this->load->view($this->_container,$data);
        }elseif($this->input->post('csvgo')){
            if (eregi("finalize", $this->input->post('submit'))){
                    $this->MProducts->csv2db();
                    $this->session->set_flashdata('message','CSV data imported');
            }else{
                    $this->session->set_flashdata('message','CSV data import cancelled');
            }
            redirect($this->module.'/admin/index','refresh');
        }
    }





       /* Moved to kaimonokago
    * Delete me
    *
    function delete($id){
        $this->MProducts->deleteProduct($id);
        $this->session->set_flashdata('message','Product deleted');
        redirect($this->module.'/admin/index','refresh');
    }

    function changeProductStatus($id){
        $this->MProducts->changeProductStatus($id);
        $this->session->set_flashdata('message','Page status changed');
        redirect($this->module.'/admin/index','refresh');
    }
    */

}


?>