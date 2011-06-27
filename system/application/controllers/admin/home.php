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
 * Home
 *
 * @package         BackendPro
 * @subpackage      Controllers
 */
class Home extends Admin_Controller
{
	function Home()
	{
		parent::Admin_Controller();

		log_message('debug','BackendPro : Home class loaded');
	}

function index()
{
	// Include dashboard Javascript code
	$this->bep_assets->load_asset('bep_dashboard');

	// Load the dashboard library
	$this->load->module_library('dashboard','dashboard');

	// Load any widget libraries
	$this->load->module_library('dashboard','Statistic_widget');
	$this->load->module_library('dashboard','Neworders_widget');
	$this->load->module_library('dashboard','Newcustomers_widget');
        $this->load->module_library('dashboard','Analytics_widget');
        $this->load->module_library('dashboard','Rss_widget');

	// Assign widgets to dashboard
        if($this->preference->item('dashboard_rss')){
        $this->dashboard->assign_widget(new widget('RSS Feed',$this->rss_widget->create()),'right');
        }

        // Assign widgets to dashboard
        if($this->preference->item('ga_email') AND $this->preference->item('ga_password') AND $this->preference->item('ga_profile')){
        $this->dashboard->assign_widget(new widget($this->lang->line('dashboard_analytics'),$this->analytics_widget->create()),'top');
        }


        $this->dashboard->assign_widget(new widget($this->lang->line('dashboard_neworders'),$this->neworders_widget->create()),'left');
	$this->dashboard->assign_widget(new widget($this->lang->line('dashboard_statistics'),$this->statistic_widget->create()),'left');
	// Load dashboard onto page
	$data['dashboard'] = $this->dashboard->output();

	// Display Page
	$data['header'] = $this->lang->line('backendpro_dashboard');
	$data['page'] = $this->config->item('backendpro_template_admin') . "home";
	$this->load->view($this->_container,$data);
}
}
/* End of file home.php */
/* Location: ./system/application/controllers/admin/home.php */
