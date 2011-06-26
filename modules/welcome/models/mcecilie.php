<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 
/**
 * This is for ci_bep
 *
 */
class MCecilie extends Model{

    function MCecilie(){
            parent::Model();
    }
    
    function finditem($table,$find,$field,$search){
        // table omc_category, $find id, $field name is $search Patterns
        $data = array();
        $options = array($field =>$search);
        $Q = $this->db->get_where($table,$options,1);  
        if ($Q->num_rows() > 0){
          $data = $Q->row_array();
        }
        $Q->free_result();    
        return $data;    
    }
        
        
        
        
}        