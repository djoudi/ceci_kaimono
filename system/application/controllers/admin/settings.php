<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * BackendPro
 *
 * A website backend system for developers for PHP 4.3.2 or newer
 *
 * @package         BackendPro
 * @author          Adam Price
 * @copyright       Copyright (c) 2008
 * @license         http://www.gnu.org/licenses/lgpl.html
 * @link            http://www.kaydoo.co.uk/projects/backendpro
 * @filesource
 */

// ---------------------------------------------------------------------------

/**
 * Settings
 *
 * Main website settings controller
 *
 * @package         BackendPro
 * @subpackage      Controllers
 */
class Settings extends Admin_Controller
{
	function Settings()
	{
		parent::Admin_Controller();

		$this->lang->module_load('preferences','preferences');

		log_message('debug','BackendPro : Settings class loaded');
	}

	function index()
	{
		$this->load->module_model('auth','access_control_model');
		// Setup the preference form
		$config['form_name'] = $this->lang->line('backendpro_settings');
		$config['form_link'] = 'admin/settings/index';

		// Setup preference groups
		$config['group'] = array(
                'general'       => array('name'=> $this->lang->line('preference_page_general_configuration'), 'fields'=>'site_name,company_name,company_address,company_post,company_city,company_country,company_organization_number,company_telephone,company_mobile,company_other_one, company_other_two'),
                'members'       => array('name'=> $this->lang->line('preference_page_member_settings'), 'fields'=>'allow_user_registration,activation_method,account_activation_time,autologin_period,default_user_group,login_field,allow_user_profiles'),
                'security'      => array('name'=> $this->lang->line('preference_page_security_preferences'), 'fields'=>'use_login_captcha,use_registration_captcha,min_password_length'),
                'email'         => array('name'=> $this->lang->line('preference_page_email_configuration'), 'fields'=>'automated_from_name,automated_from_email,email_protocol,email_mailpath,smtp_host,smtp_user,smtp_pass,smtp_port,smtp_timeout,email_mailtype,email_charset,email_wordwrap,email_wrapchars,bcc_batch_mode,bcc_batch_size'),
                'maintenance'   => array('name'=> $this->lang->line('preference_page_maintenance_debugging_settings'), 'fields'=>'page_debug,keep_error_logs_for'),
		'modulemanagement'	  => array('name'=> $this->lang->line('preference_module_management'),'fields'=>'calendar,category,customers,filemanager,languages,menus,messages,orders,pages,products,slideshow,subscribers'),
                'website'       => array('name'=> $this->lang->line('preference_website_configuration'),'fields'=>'main_module_name,multi_language,website_language,categories_parent_id,playroom_parent_id,admin_email,security_method,security_question,security_answer'),
		'slideshow'     => array('name'=> $this->lang->line('preference_frontpage_slideshow_settings'), 'fields'=>'webshop_slideshow,slideshow_two'),
		'analytics'     => array('name'=> $this->lang->line('preference_google_analytics_settings'), 'fields'=>'ga_tracking,ga_profile, ga_email,ga_password'),
                'rss_feed'     => array('name'=> $this->lang->line('preference_rss_feeds_settings'), 'fields'=>'dashboard_rss,dashboard_rss_count'),
                'cecilieokada'     => array('name'=> 'cecileiokada.com Settings', 'fields'=>'category_menu_id,parentid_other_illust,lilly_fairies_submenu_id,quicksand_colorbox_cat_id'),
                'sharethis'     => array('name'=> 'Sharethis Settings', 'fields'=>'sharethis_pub_key,sharethis_direction,sharethis_size,sharethis_services'),
                );

		// Setup custom field options
		$config['field']['site_name'] = array('rules'=>'trim|required');
                $config['field']['company_name'] = array('rules'=>'trim');
                $config['field']['company_address'] = array('rules'=>'trim');
                $config['field']['company_post'] = array('rules'=>'trim');
                $config['field']['company_city'] = array('rules'=>'trim');
                $config['field']['company_country'] = array('rules'=>'trim');
                $config['field']['company_organization_number'] = array('rules'=>'trim');
                $config['field']['company_telephone'] = array('rules'=>'trim');
                $config['field']['company_mobile'] = array('rules'=>'trim');
                $config['field']['company_other_one'] = array('rules'=>'trim');
                $config['field']['company_other_two'] = array('rules'=>'trim');

		$config['field']['allow_user_registration'] = array('type'=>'boolean');
		$config['field']['activation_method'] = array('type'=>'dropdown','params'=>array('options'=>array('none'=>$this->lang->line('preference_field_activation_method_none'),'email'=>$this->lang->line('preference_field_activation_method_email'),'admin'=>$this->lang->line('preference_field_activation_method_admin'))));
		$config['field']['account_activation_time'] = array('rules'=>'trim|required|numeric');
		$config['field']['autologin_period'] = array('rules'=>'trim|required|numeric');
		$config['field']['default_user_group'] = array('type'=>'dropdown','params'=>array('options'=>$this->access_control_model->buildACLDropdown('group','id')));
		$config['field']['allow_user_profiles'] = array('type'=>'boolean');
		$config['field']['login_field'] = array('type'=>'dropdown','params'=>array('options'=>array('email'=>$this->lang->line('userlib_email'),'username'=>$this->lang->line('userlib_username'),'either'=>$this->lang->line('userlib_email_username'))));

		$config['field']['use_login_captcha'] = array('type'=>'boolean');
		$config['field']['use_registration_captcha'] = array('type'=>'boolean');
		$config['field']['min_password_length'] = array('rules'=>'trim|required|numeric');

		$config['field']['automated_from_email'] = array('rules'=>'trim|valid_email');
		$config['field']['email_protocol'] = array('type'=>'dropdown','params'=>array('options'=>array('sendmail'=>'Sendmail','mail'=>'PHP Mail','smtp'=>'SMTP')));
		$config['field']['smtp_port'] = array('rules'=>'trim|numeric');
		$config['field']['smtp_timeout'] = array('rules'=>'trim|numeric');
		$config['field']['email_mailtype'] = array('type'=>'dropdown','params'=>array('options'=>array('text'=>'Plaintext','html'=>'HTML')));
		$config['field']['email_wordwrap'] = array('type'=>'boolean');
		$config['field']['email_wrapchars'] = array('rules'=>'trim|numeric');
		$config['field']['bcc_batch_mode'] = array('type'=>'boolean');
		$config['field']['bcc_batch_size'] = array('rules'=>'trim|numeric');

		$config['field']['page_debug'] = array('type'=>'boolean');
		$config['field']['keep_error_logs_for'] = array('rules'=>'trim|required|numeric');
		
		// for website config
		$config['field']['main_module_name'] = array('rules'=>'trim');
                $config['field']['multi_language'] = array('type'=>'boolean');
                $config['field']['website_language'] = array('rules'=>'trim');
		$config['field']['categories_parent_id'] = array('rules'=>'trim|numeric');
                $config['field']['playroom_parent_id'] = array('rules'=>'trim|numeric');
		$config['field']['security_method'] = array('type'=>'dropdown','params'=>array('options'=>array('none'=>'none','question'=>'Own question','recaptcha'=>'reCaptcha')));;
		$config['field']['security_question'] = array('rules'=>'trim');
                $config['field']['security_answer'] = array('rules'=>'trim');
		
		// for slideshows 
		$config['field']['webshop_slideshow'] = array('type'=>'dropdown','params'=>array('options'=>array('none'=>$this->lang->line('userlib_none'),'interfade'=>$this->lang->line('userlib_interfade'),'cu3er'=>$this->lang->line('userlib_cu3er'),'coinslider'=>$this->lang->line('userlib_coin_slider'),'nivoslider'=>$this->lang->line('userlib_nivo_slider'))));
		$config['field']['slideshow_two'] = array('type'=>'dropdown','params'=>array('options'=>array('none'=>$this->lang->line('userlib_none'),'interfade'=>$this->lang->line('userlib_interfade'),'cu3er'=>$this->lang->line('userlib_cu3er'),'coinslider'=>$this->lang->line('userlib_coin_slider'),'nivoslider'=>$this->lang->line('userlib_nivo_slider'))));

                 // module management
                $config['field']['calendar'] = array('type'=>'boolean');
                $config['field']['category'] = array('type'=>'boolean');
                $config['field']['customers'] = array('type'=>'boolean');
                $config['field']['filemanager'] = array('type'=>'boolean');
                $config['field']['languages'] = array('type'=>'boolean');
                $config['field']['menus'] = array('type'=>'boolean');
                $config['field']['messages'] = array('type'=>'boolean');
                $config['field']['orders'] = array('type'=>'boolean');
                $config['field']['pages'] = array('type'=>'boolean');
                $config['field']['products'] = array('type'=>'boolean');
                $config['field']['slideshow'] = array('type'=>'boolean');
                $config['field']['subscribers'] = array('type'=>'boolean');

                // analytics
                $config['field']['ga_tracking'] = array('rules'=>'trim');
                $config['field']['ga_profile'] = array('rules'=>'trim');
                $config['field']['ga_email'] = array('rules'=>'trim|valid_email');
                $config['field']['ga_password'] = array('type'=>'password','rules'=>'trim');

                 // RSS feeds
                $config['field']['dashboard_rss'] = array('rules'=>'trim');
                $config['field']['dashboard_rss_count'] = array('rules'=>'trim|numeric');
                
                // cecilieokada.com
                $config['field']['category_menu_id'] = array('rules'=>'trim|numeric');
                $config['field']['parentid_other_illust'] = array('rules'=>'trim|numeric');
                $config['field']['lilly_fairies_submenu_id'] = array('rules'=>'trim|numeric');
                $config['field']['quicksand_colorbox_cat_id'] = array('rules'=>'trim|numeric');
                
                // sharethis
                $config['field']['sharethis_pub_key'] = array('rules'=>'trim');
                $config['field']['sharethis_direction'] = array('type'=>'dropdown','params'=>array('options'=>array('vertical'=>'Vertical','horizontal'=>'Horizontal')));;
                $config['field']['sharethis_size'] = array('type'=>'dropdown','params'=>array('options'=>array(''=>'Small','large'=>'Large')));;
                $config['field']['sharethis_services']= array('rules'=>'trim');
                
                
                
		// Display the form
		$this->load->module_library('preferences','preference_form');
		$this->preference_form->initalize($config);
		$data['header'] = $this->preference_form->form_name;
		$data['content'] = $this->preference_form->display();
		$this->load->view($this->_container,$data);
	}
}
/* End of file settings.php */
/* Location: ./system/application/controllers/admin/settings.php */