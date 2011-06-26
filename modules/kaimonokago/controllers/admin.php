<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
 * Kaimonokago/controllers/admin
 * This controls common tasks, changestatus, delete
 */
class Admin extends Shop_Admin_Controller {
    
    private $module;
    private $table;
    private $id;
    private $sub_controller; // for cecilieokada.com products/manage/
    private $category_id; // for cecilieokada.com products/manage/

    public function __construct() {

        parent::__construct();
        $this->module = $this->uri->segment(4);
        $this->table = "omc_".$this->module;
        $this->id = $this->uri->segment(5);
        $this->sub_controller = $this->uri->segment(6);
        $this->category_id = $this->uri->segment(7);
    }


    function changeStatus(){
       
        if($this->id && $this->table){
            // since the mkaimonokago/changestatus uses getInfo which add omc_, here I use module
            $this->MKaimonokago->changeStatus($this->module,$this->id);
        }
        flashMsg('success',$this->lang->line('kago_status_changed'));
        if(!empty($this->sub_controller)){// for cecilieokada.com products/manage/
            redirect($this->module."/".$this->sub_controller."/index/".$this->category_id,"refresh");
        }else{
            redirect($this->module."/admin/index/","refresh");
        }
        
    }


    function delete(){
        $this->MKaimonokago->deleteitem($this->table, $this->id);
        $this->session->set_flashdata('message',$this->lang->line('kago_deleted'));
        flashMsg('success',$this->lang->line('kago_deleted'));
         if(!empty($this->sub_controller)){// for cecilieokada.com products/manage/
            redirect($this->module."/".$this->sub_controller."/index/".$this->category_id,"refresh");
        }else{
            redirect($this->module."/admin/index/","refresh");
        }
    }


}//end class
?>