-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 27, 2011 at 02:57 
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ceci_kaimono`
--

-- --------------------------------------------------------

--
-- Table structure for table `be_acl_actions`
--

CREATE TABLE IF NOT EXISTS `be_acl_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `be_acl_actions`
--


-- --------------------------------------------------------

--
-- Table structure for table `be_acl_groups`
--

CREATE TABLE IF NOT EXISTS `be_acl_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lft` int(10) unsigned NOT NULL DEFAULT '0',
  `rgt` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `link` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `lft` (`lft`),
  KEY `rgt` (`rgt`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `be_acl_groups`
--

INSERT INTO `be_acl_groups` (`id`, `lft`, `rgt`, `name`, `link`) VALUES
(1, 1, 6, 'Member', NULL),
(2, 4, 5, 'Administrator', NULL),
(3, 2, 3, 'demoadmin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `be_acl_permissions`
--

CREATE TABLE IF NOT EXISTS `be_acl_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aro_id` int(10) unsigned NOT NULL DEFAULT '0',
  `aco_id` int(10) unsigned NOT NULL DEFAULT '0',
  `allow` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aro_id` (`aro_id`),
  KEY `aco_id` (`aco_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `be_acl_permissions`
--

INSERT INTO `be_acl_permissions` (`id`, `aro_id`, `aco_id`, `allow`) VALUES
(1, 2, 1, 'Y'),
(3, 1, 24, 'Y'),
(4, 1, 27, 'N'),
(5, 1, 6, 'N'),
(6, 1, 3, 'N'),
(7, 1, 12, 'N'),
(8, 3, 24, 'Y'),
(9, 3, 12, 'N'),
(10, 3, 28, 'Y'),
(11, 3, 36, 'Y'),
(12, 3, 1, 'Y'),
(13, 3, 3, 'N'),
(14, 1, 32, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `be_acl_permission_actions`
--

CREATE TABLE IF NOT EXISTS `be_acl_permission_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `access_id` int(10) unsigned NOT NULL DEFAULT '0',
  `axo_id` int(10) unsigned NOT NULL DEFAULT '0',
  `allow` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `access_id` (`access_id`),
  KEY `axo_id` (`axo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `be_acl_permission_actions`
--


-- --------------------------------------------------------

--
-- Table structure for table `be_acl_resources`
--

CREATE TABLE IF NOT EXISTS `be_acl_resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lft` int(10) unsigned NOT NULL DEFAULT '0',
  `rgt` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `link` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `lft` (`lft`),
  KEY `rgt` (`rgt`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=40 ;

--
-- Dumping data for table `be_acl_resources`
--

INSERT INTO `be_acl_resources` (`id`, `lft`, `rgt`, `name`, `link`) VALUES
(1, 1, 76, 'Site', NULL),
(2, 56, 75, 'Control Panel', NULL),
(3, 57, 74, 'System', NULL),
(4, 68, 69, 'Members', NULL),
(5, 58, 67, 'Access Control', NULL),
(6, 70, 71, 'Settings', NULL),
(7, 72, 73, 'Utilities', NULL),
(8, 65, 66, 'Permissions', NULL),
(9, 63, 64, 'Groups', NULL),
(10, 61, 62, 'Resources', NULL),
(11, 59, 60, 'Actions', NULL),
(12, 26, 55, 'General', 0),
(13, 53, 54, 'Calendar', 0),
(14, 51, 52, 'Category', 0),
(15, 49, 50, 'Customers', 0),
(16, 47, 48, 'Menus', 0),
(17, 45, 46, 'Messages', 0),
(18, 43, 44, 'Orders', 0),
(19, 41, 42, 'Pages', 0),
(20, 39, 40, 'Products', 0),
(21, 37, 38, 'Subscribers', 0),
(22, 35, 36, 'Admins', 0),
(23, 33, 34, 'Filemanager', 0),
(24, 18, 25, 'Customer Support', 0),
(25, 23, 24, 'Purchase Support', 0),
(26, 21, 22, 'Customer Record', 0),
(27, 19, 20, 'Customers Admin', 0),
(28, 12, 17, 'Project Panel', 0),
(29, 15, 16, 'Project Spec', 0),
(30, 13, 14, 'Project Home', 0),
(32, 9, 10, 'Customer booking', 0),
(33, 7, 8, 'Bookings', 0),
(34, 3, 4, 'Courses', 0),
(35, 5, 6, 'Trainers', 0),
(36, 2, 11, 'Fitness', 0),
(37, 31, 32, 'Multi languages', 0),
(38, 29, 30, 'Slideshow', 0),
(39, 27, 28, 'Playroom', 0);

-- --------------------------------------------------------

--
-- Table structure for table `be_groups`
--

CREATE TABLE IF NOT EXISTS `be_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `be_groups`
--

INSERT INTO `be_groups` (`id`, `locked`, `disabled`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `be_preferences`
--

CREATE TABLE IF NOT EXISTS `be_preferences` (
  `name` varchar(254) CHARACTER SET latin1 NOT NULL,
  `value` text CHARACTER SET latin1 NOT NULL,
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `be_preferences`
--

INSERT INTO `be_preferences` (`name`, `value`) VALUES
('default_user_group', '1'),
('smtp_host', ''),
('keep_error_logs_for', '30'),
('email_protocol', 'mail'),
('use_registration_captcha', '0'),
('page_debug', '0'),
('automated_from_name', 'Kaimonokago 1.1.4'),
('allow_user_registration', '1'),
('use_login_captcha', '0'),
('site_name', 'cecilieokada.com'),
('automated_from_email', 'admin@gmail.com'),
('account_activation_time', '7'),
('allow_user_profiles', '1'),
('activation_method', 'email'),
('autologin_period', '30'),
('min_password_length', '4'),
('smtp_user', ''),
('smtp_pass', ''),
('email_mailpath', '/usr/bin/msmtp -t'),
('smtp_port', '25'),
('smtp_timeout', '5'),
('email_wordwrap', '1'),
('email_wrapchars', '76'),
('email_mailtype', 'text'),
('email_charset', 'utf-8'),
('bcc_batch_mode', '0'),
('bcc_batch_size', '200'),
('login_field', 'email'),
('main_module_name', 'welcome'),
('categories_parent_id', '1'),
('admin_email', 'okada.shin@gmail.com'),
('webshop_slideshow', 'cu3er'),
('slideshow_two', 'none'),
('playroom_parent_id', '10'),
('calendar', '0'),
('category', '1'),
('customers', '0'),
('filemanager', '1'),
('languages', '0'),
('menus', '1'),
('messages', '1'),
('orders', '0'),
('pages', '1'),
('products', '1'),
('slideshow', '1'),
('subscribers', '0'),
('multi_language', '0'),
('website_language', 'english'),
('security_method', 'question'),
('security_question', '3+5='),
('security_answer', '8'),
('ga_tracking', ''),
('ga_profile', ''),
('ga_email', ''),
('ga_password', ''),
('dashboard_rss', 'http://www.digg.com/rss/indexdig.xml'),
('dashboard_rss_count', '10'),
('company_name', 'Okada Design AS'),
('company_address', 'Framnesveien 54'),
('company_post', '3222'),
('company_city', 'Sandefjord'),
('company_country', 'Norway'),
('company_organization_number', '123456789'),
('company_telephone', '+47 88776655'),
('company_mobile', '+47 66554433'),
('company_other_one', 'Web: Okada Design AS'),
('company_other_two', ''),
('category_menu_id', '16'),
('lilly_fairies_submenu_id', '1'),
('parentid_other_illust', '27'),
('quicksand_colorbox_cat_id', '11');

-- --------------------------------------------------------

--
-- Table structure for table `be_resources`
--

CREATE TABLE IF NOT EXISTS `be_resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=40 ;

--
-- Dumping data for table `be_resources`
--

INSERT INTO `be_resources` (`id`, `locked`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0);

-- --------------------------------------------------------

--
-- Table structure for table `be_users`
--

CREATE TABLE IF NOT EXISTS `be_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group` int(10) unsigned DEFAULT NULL,
  `activation_key` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `password` (`password`),
  KEY `group` (`group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `be_users`
--

INSERT INTO `be_users` (`id`, `username`, `password`, `email`, `active`, `group`, `activation_key`, `last_visit`, `created`, `modified`) VALUES
(8, 'admin', '0bf9e5ee95ca4bab95dd6875e2126dc709d7355b', 'admin@gmail.com', 1, 2, 'iZN4cCcRfs9KP1RrAIdqT8p5XzPZtxkH', '2011-06-27 14:55:15', '2011-03-05 21:48:02', '2011-05-15 13:29:33'),
(9, 'admin1', '8feef897fde543ab4cf0e7a9c636231508858b77', 'admin1@adminl.com', 1, 2, NULL, '2011-05-09 08:08:04', '2011-04-04 17:50:59', '2011-05-15 13:29:12');

-- --------------------------------------------------------

--
-- Table structure for table `be_user_profiles`
--

CREATE TABLE IF NOT EXISTS `be_user_profiles` (
  `user_id` int(10) unsigned NOT NULL,
  `company_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `web_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `post_code` int(10) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `be_user_profiles`
--

INSERT INTO `be_user_profiles` (`user_id`, `company_name`, `full_name`, `web_address`, `phone_number`, `address`, `city`, `post_code`) VALUES
(8, '', '', '', '', '', '', 0),
(9, '', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `user_agent` varchar(50) CHARACTER SET latin1 NOT NULL,
  `user_data` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `user_data`, `last_activity`) VALUES
('2590ab8b2aee4e283bda6c23fcca32f2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', 'a:10:{s:2:"id";s:1:"8";s:8:"username";s:5:"admin";s:5:"email";s:15:"admin@gmail.com";s:8:"password";s:40:"0bf9e5ee95ca4bab95dd6875e2126dc709d7355b";s:6:"active";s:1:"1";s:10:"last_visit";s:19:"2011-06-27 08:03:29";s:7:"created";s:19:"2011-03-05 21:48:02";s:8:"modified";s:19:"2011-05-15 13:29:33";s:5:"group";s:13:"Administrator";s:8:"group_id";s:1:"2";}', 1309173030),
('5275f784180bd62f288e9ab18e387dc8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:5.0) Gecko/', 'a:10:{s:2:"id";s:1:"8";s:8:"username";s:5:"admin";s:5:"email";s:15:"admin@gmail.com";s:8:"password";s:40:"0bf9e5ee95ca4bab95dd6875e2126dc709d7355b";s:6:"active";s:1:"1";s:10:"last_visit";s:19:"2011-06-27 13:00:33";s:7:"created";s:19:"2011-03-05 21:48:02";s:8:"modified";s:19:"2011-05-15 13:29:33";s:5:"group";s:13:"Administrator";s:8:"group_id";s:1:"2";}', 1309179315),
('c23d4c86ee95cd877b9c48d047f11719', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:5.0) Gecko/', 'a:10:{s:2:"id";s:1:"8";s:8:"username";s:5:"admin";s:5:"email";s:15:"admin@gmail.com";s:8:"password";s:40:"0bf9e5ee95ca4bab95dd6875e2126dc709d7355b";s:6:"active";s:1:"1";s:10:"last_visit";s:19:"2011-06-26 19:01:30";s:7:"created";s:19:"2011-03-05 21:48:02";s:8:"modified";s:19:"2011-05-15 13:29:33";s:5:"group";s:13:"Administrator";s:8:"group_id";s:1:"2";}', 1309179306),
('d5280c2f0ebb97b4377a1dc56a5d8715', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:5.0) Gecko/', 'a:10:{s:2:"id";s:1:"8";s:8:"username";s:5:"admin";s:5:"email";s:15:"admin@gmail.com";s:8:"password";s:40:"0bf9e5ee95ca4bab95dd6875e2126dc709d7355b";s:6:"active";s:1:"1";s:10:"last_visit";s:19:"2011-06-27 13:00:33";s:7:"created";s:19:"2011-03-05 21:48:02";s:8:"modified";s:19:"2011-05-15 13:29:33";s:5:"group";s:13:"Administrator";s:8:"group_id";s:1:"2";}', 1309179315);

-- --------------------------------------------------------

--
-- Table structure for table `eventcal`
--

CREATE TABLE IF NOT EXISTS `eventcal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(25) NOT NULL DEFAULT 'anonimous',
  `user_id` int(25) NOT NULL,
  `eventDate` date DEFAULT NULL,
  `eventTitle` varchar(100) DEFAULT NULL,
  `eventContent` text,
  `privacy` enum('public','private') NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `eventcal`
--

INSERT INTO `eventcal` (`id`, `user`, `user_id`, `eventDate`, `eventTitle`, `eventContent`, `privacy`) VALUES
(2, 'shinokada', 8, '2011-05-17', '17th May', 'Hurray', 'public'),
(8, 'shinokada', 8, '2011-05-18', 'test', 'test', 'public');

-- --------------------------------------------------------

--
-- Table structure for table `omc_category`
--

CREATE TABLE IF NOT EXISTS `omc_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shortdesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longdesc` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) unsigned DEFAULT NULL,
  `parentid` int(11) unsigned NOT NULL,
  `lang_id` int(2) unsigned NOT NULL,
  `table_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `omc_category`
--

INSERT INTO `omc_category` (`id`, `name`, `shortdesc`, `longdesc`, `status`, `order`, `parentid`, `lang_id`, `table_id`) VALUES
(1, 'Other Work', '', '', 'active', 0, 0, 0, 1),
(2, 'Patterns', 'PATTERNS AVAILABLE FOR LICENSING', '<p>All patterns can be reduced or enlarged as required. Each pattern has a maximum of six PMS colours. More colour variations can be created for any given pattern.&nbsp;</p>', 'inactive', 0, 1, 0, 2),
(7, 'Mayan Calendar', 'THE MAYAN CALENDAR: ILLUSTRATIONS AVAILABLE FOR LICENSING', '<h3>Publishing History</h3>\n<p>Theses illustrations are selected from two art calendars that enjoyed great commercial success. Produced for the Norwegian book club Energica, owned by Norway&rsquo;s largest publisher Cappelen Damm, it was also sold to the Swedish book club Livsenergi (Forma Publishing Group). Greeting cards were also produced for Energica, as well as art prints. <br /><br /></p>\n<h3>Year 2012: Unique Commercial Opportunity for Maya-inspired products</h3>\n<p>The commercial potential of projects related to the Mayan Calendar is considerable with the upcoming year 2012. Millions of people world wide expect global changes with the conclusion of a 25.000 year long calendar cycle in 2012 as described by the ancient Mayans, whether it is the awakening of humanity or Hollywood-style scenarios as in the movie &ldquo;2012&rdquo;. Everything Mayan is a buzz! <br /><br />As illustrator, designer and author of commentary on Mayan history and mythology, I offer my illustrations for further projects, such as greeting cards and note books. Patterns that are based on illustration segments can be created for products such as scarves, accessories and clothing.</p>', 'active', 10, 1, 0, 7),
(11, 'Illustrations', 'short desc of other illustrattions', '<p>Long desc of other illustrations</p>', 'active', 30, 1, 0, 11),
(17, 'Lilly Fairies', 'Category Lilly fairies. Short desc of lilly fairies', '<p>Long desc of lilly fairies. Category lilly fairies.</p>', 'active', 40, 1, 0, 17),
(26, 'Web Design', 'short desc of web design', '<p>long desc of web design</p>', 'active', 80, 1, 0, 26),
(27, 'Other Illustrations', 'short desc of other illustrattions', '<p>long desc of other illustrations</p>', 'active', 10, 0, 0, 27),
(28, 'Kids', '', '', 'active', 10, 27, 0, 28),
(29, 'Humor', '', '', 'active', 20, 27, 0, 29),
(30, 'Animals', '', '', 'active', 30, 27, 0, 30),
(31, 'Birds', '', '', 'active', 40, 27, 0, 31),
(32, 'Nature', '', '', 'active', 50, 27, 0, 32),
(33, 'Fantasy', '', '', 'active', 60, 27, 0, 33),
(34, 'Teen', '', '', 'active', 70, 27, 0, 34),
(35, 'Various', '', '', 'active', 80, 27, 0, 35),
(36, 'Licensing', '', '', 'active', 90, 27, 0, 36);

-- --------------------------------------------------------

--
-- Table structure for table `omc_colors`
--

CREATE TABLE IF NOT EXISTS `omc_colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `omc_colors`
--


-- --------------------------------------------------------

--
-- Table structure for table `omc_customer`
--

CREATE TABLE IF NOT EXISTS `omc_customer` (
  `customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `customer_first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `customer_last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` int(10) unsigned NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `post_code` int(10) unsigned NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `omc_customer`
--


-- --------------------------------------------------------

--
-- Table structure for table `omc_languages`
--

CREATE TABLE IF NOT EXISTS `omc_languages` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `langname` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `omc_languages`
--

INSERT INTO `omc_languages` (`id`, `langname`, `status`) VALUES
(1, 'norwegian', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `omc_lilly_fairies_menus`
--

CREATE TABLE IF NOT EXISTS `omc_lilly_fairies_menus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shortdesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `parentid` int(11) unsigned NOT NULL,
  `order` int(11) unsigned DEFAULT NULL,
  `lang_id` int(2) unsigned NOT NULL,
  `page_uri_id` int(11) unsigned NOT NULL,
  `menu_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `omc_lilly_fairies_menus`
--

INSERT INTO `omc_lilly_fairies_menus` (`id`, `name`, `shortdesc`, `status`, `parentid`, `order`, `lang_id`, `page_uri_id`, `menu_id`) VALUES
(1, 'Lilly Fairies', 'Short desc of lilly fairies', 'active', 0, 0, 0, 1, 0),
(2, 'The Story', 'short desc of menu the story', 'active', 1, 10, 0, 2, 0),
(3, 'The World', '', 'active', 1, 20, 0, 3, 0),
(4, 'Concept', '', 'active', 1, 30, 0, 4, 0),
(5, 'Lisa', '', 'active', 1, 40, 0, 5, 0),
(6, 'Annika', '', 'active', 1, 50, 0, 6, 0),
(7, 'Celine', '', 'active', 1, 60, 0, 7, 0),
(8, 'Lilly', '', 'active', 1, 70, 0, 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `omc_lilly_fairies_pages`
--

CREATE TABLE IF NOT EXISTS `omc_lilly_fairies_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `lang_id` int(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `omc_lilly_fairies_pages`
--

INSERT INTO `omc_lilly_fairies_pages` (`id`, `name`, `keywords`, `description`, `path`, `content`, `status`, `lang_id`) VALUES
(1, 'Lilly Fariries', '', 'desc of lilly fairies', 'lilly_fairies', '<p>Content of lilly fairies.</p>', 'active', 0),
(2, 'The Story', '', 'Historien om Lilly Fairies', 'story', '<div id="colone">When spring comes to the far north, the Lilly Fairies wake up from their long sleep. It is a big celebration!  During the long, cold winter they sleep inside falling snowflakes. If you look closely, you can see them inside beautiful snow crystals. If you look even more closely, you can watch them play in their dreams.</div>\n<div id="coltwo">Without the secret Growing Magic of the Lilly Fairies, winter would never end. The fairies make the seeds in the earth grow into beautiful flowers. A simple touch is enough. A fairy touch is powerful. It gives new life and joy to everybody: to animals, birds, insects and people.  <br /> Wherever there is a fairy, you can be sure there is friendship, fun and laughter. They want to play with you too! Best of all, they want to give you Growing Magic.  <br /> But when the fairies start yawning and want to sleep again, you know that autumn has come.</div>', 'active', 0),
(3, 'The World', '', 'desc of the world', 'world', '<div id="colone">\n<p>Porta integer etiam nisi ultrices augue adipiscing diam dignissim hac dolor lundium, nec scelerisque sed. Eros! Etiam sit! Scelerisque est hac sed mus augue placerat placerat magna in turpis tortor cras scelerisque, ultricies eros nec augue, rhoncus, odio turpis ac! Ut urna aliquam dis urna. Turpis porttitor nunc risus pellentesque nec sit ut dictumst eros, a eu odio, pid auctor etiam ut ac porta? Porta mauris adipiscing vel. Mid integer? Duis eu et? Egestas proin dis augue, elementum, lundium dis, habitasse urna, natoque. Velit enim. Ac, aliquet in urna adipiscing! Ac placerat rhoncus, est vel dolor. Integer odio cum aliquam pulvinar montes integer nec, tincidunt scelerisque ac sed! Enim scelerisque enim facilisis! A aliquet! Vel pulvinar porta scelerisque parturient tristique.</p>\n</div>\n<div id="coltwo">\n<p>Enim, platea elementum lundium tincidunt! Porttitor egestas nec habitasse aliquam augue et pid tristique nunc lundium arcu. Augue lorem elit cursus, nec parturient, magna ac integer cum adipiscing porttitor, mid dapibus enim urna! Aenean urna tempor nunc dapibus! Nisi urna facilisis, porta aenean et augue lectus tincidunt. Mattis arcu. Vut augue aenean auctor! Ultricies ut elementum dictumst vel, ac, elementum egestas ultrices placerat odio diam enim et mauris a, ac, auctor dolor lacus ultrices, montes! Turpis dis. Tempor porttitor, pulvinar magnis, nunc, turpis, mus mattis sed, auctor scelerisque eros a odio, phasellus lacus cras porta enim. Integer dictumst non? Lectus sociis, risus urna? Scelerisque magna in dolor integer risus? Tristique ac ultrices penatibus mauris mus, ut platea pellentesque pulvinar.</p>\n</div>', 'active', 0),
(4, 'Concept', '', 'desc of concept', 'concept', '<p>content of concept.</p>', 'active', 0),
(5, 'Lisa', '', 'desc of lisa', 'lisa', '<p>content of lisa</p>', 'active', 0),
(6, 'Annika', '', 'desc of annika', 'annika', '<p>content of annika.</p>', 'active', 0),
(7, 'Celine', '', 'desc of celine', 'celine', '<p>content of celine</p>', 'active', 0),
(8, 'Lilly', '', 'desc of lilly', 'lilly', '<p>content of lilly</p>', 'active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `omc_menus`
--

CREATE TABLE IF NOT EXISTS `omc_menus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shortdesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `parentid` int(11) unsigned NOT NULL,
  `order` int(11) unsigned DEFAULT NULL,
  `lang_id` int(2) unsigned NOT NULL,
  `page_uri_id` int(11) unsigned NOT NULL,
  `menu_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `omc_menus`
--

INSERT INTO `omc_menus` (`id`, `name`, `shortdesc`, `status`, `parentid`, `order`, `lang_id`, `page_uri_id`, `menu_id`) VALUES
(1, 'English menu', '', 'active', 0, 0, 0, 0, 0),
(2, 'Home', '', 'active', 1, 10, 0, 1, 0),
(5, 'Norwegain menu', '', 'active', 0, 0, 1, 0, 1),
(6, 'Nettbutikk', '', 'active', 5, 10, 1, 6, 2),
(8, 'Contact', '', 'active', 1, 70, 0, 7, 0),
(10, 'About', '', 'active', 1, 20, 0, 3, 0),
(11, 'Om Oss', '', 'active', 5, 20, 1, 4, 10),
(12, 'Patterns', '', 'active', 1, 40, 0, 17, 0),
(14, 'Tjenester', '', 'active', 5, 60, 1, 18, 12),
(16, 'Other work', '', 'active', 1, 50, 0, 22, 0),
(17, 'Licensing', '', 'active', 1, 60, 0, 23, 0),
(18, 'Services', '', 'active', 1, 65, 0, 24, 0),
(19, 'Press', 'short desc of press', 'active', 1, 63, 0, 33, 0);

-- --------------------------------------------------------

--
-- Table structure for table `omc_messages`
--

CREATE TABLE IF NOT EXISTS `omc_messages` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `omc_messages`
--


-- --------------------------------------------------------

--
-- Table structure for table `omc_order`
--

CREATE TABLE IF NOT EXISTS `omc_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `delivery_date` datetime NOT NULL,
  `payment_date` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `omc_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `omc_order_item`
--

CREATE TABLE IF NOT EXISTS `omc_order_item` (
  `order_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `omc_order_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `omc_pages`
--

CREATE TABLE IF NOT EXISTS `omc_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `lang_id` int(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=34 ;

--
-- Dumping data for table `omc_pages`
--

INSERT INTO `omc_pages` (`id`, `name`, `keywords`, `description`, `path`, `content`, `status`, `lang_id`) VALUES
(1, 'Home', '', '', 'welcome', '<div id="homeone" class="column">\n<h2><a href="http://www.brandlicensing.eu/" target="_blank">Brand Licensing Europe 2011</a></h2>\n<p>We will be attending the Brand Licensing <br />Europe 2011 fair in London from <br />18th - 20th October</p>\n</div>\n<div id="hometwo" class="column">\n<h3>Visit us at Stand G 130</h3>\n<p>in the Art &amp; Design section</p>\n</div>', 'active', 0),
(3, 'About Cecilie Okada', '', '', 'about', '<div id="aboutone" class="column aboutcol">\n<p>An award winning designer and illustrator, my clients include major publishing houses and companies in Norway, as well as international publishers (English and German language).  In the last two years I have created art calendars for one of Norway&rsquo;s largest book clubs, Energica. The commercial success was duplicated in one of Sweden&rsquo;s major book clubs, Livsenergi.  Designing a children&rsquo;s bed linen pattern for H&oslash;ie of Scandinavia that not only did well, but also was used in a trend expo, inspired both the creation of patterns and the Lilly Fairies.  My work as an illustrator range from the literary field, packaging for major brands, brochures and technical illustrations for the aviation sector.<br /> I have illustrated 24 books that include literary titles as well as text book series for children, youth and adults. <br /> As a graphic designer and web designer I collaborate with the accounting chain Visma, working with a diverse range of clients.</p>\n</div>\n<div id="abouttwo" class="column aboutcol">\n<p>I earned a Bachelor of Design in New Zealand in 2002, where I lived for ten years.  <br /><br /> For references, see Other Work.  <br /><br /> In 2005 I won an award for The Most Beautiful Book of the Year with the cover illustration for a book of Japanese love poetry. Fitting, as my husband is Japanese. When we fell in love, it was the forbidden love of a yogi nun and monk. I spent 14 years of my life serving underprivileged children in Haiti, Jamaica and Mexico, building up a children&rsquo;s home and preschools in slums and villages. I also taught meditation and yoga.  <br /><br /> I still meditate daily. It is a source of creative inspiration that I cherish greatly.  <br /><br /> After 9 years in Norway we are moving to Kobe, Japan in August. <br /><br /></p>\n</div>', 'active', 0),
(4, 'Om oss', '', '', 'about', '<p>Om oss. About us in Norwegian.</p>\n<p>Tempor! Parturient ac sit! Aliquam dapibus, ut eros sit ac augue eu pulvinar adipiscing vel scelerisque, magnis aliquet dis diam sociis! Proin sit facilisis et et, integer, in, diam integer sit ridiculus dapibus rhoncus odio ultricies platea magnis tincidunt nec urna adipiscing, aliquet, adipiscing? Natoque?</p>\n<p>Aliquet ut, platea lacus in! Tempor hac placerat magna massa dignissim egestas turpis nec sed! Elementum in. Etiam magnis dictumst? Pulvinar mid facilisis mid enim. Dis odio enim nec. Odio in vel? Parturient vel eros! In, etiam etiam vel, pulvinar tortor, diam etiam tristique urna, porttitor habitasse, tincidunt aliquet tristique in tristique nunc mid in, rhoncus ac lacus placerat, nec urna in dis, urna et rhoncus lectus? Rhoncus nisi auctor arcu scelerisque, nec ut scelerisque.<br /><br /></p>', 'active', 1),
(6, 'Forsiden', '', '', 'welcome', '<p>Forsiden p&aring; norsk</p>', 'active', 1),
(7, 'Contact', '', '', 'contact_us', '<p>Porta integer etiam nisi ultrices augue adipiscing diam dignissim hac dolor lundium, nec scelerisque sed. Eros! Etiam sit! Scelerisque est hac sed mus augue placerat placerat magna in turpis tortor cras scelerisque, ultricies eros nec augue, rhoncus, odio turpis ac! Ut urna aliquam dis urna. Turpis porttitor nunc risus pellentesque nec sit ut dictumst eros, a eu odio, pid auctor etiam ut ac porta? Porta mauris adipiscing vel. Mid integer? Duis eu et? Egestas proin dis augue, elementum, lundium dis, habitasse urna, natoque. Velit enim. Ac, aliquet in urna adipiscing! Ac placerat rhoncus, est vel dolor. Integer odio cum aliquam pulvinar montes integer nec, tincidunt scelerisque ac sed! Enim scelerisque enim facilisis! A aliquet! Vel pulvinar porta scelerisque parturient tristique.</p>', 'active', 0),
(8, 'Kontakt oss', '', '', 'contact_us', '<p>Kontakt oss</p>', 'active', 1),
(17, 'Patterns', '', '', 'patterns', '<p>service content</p>\n<p>Tempor! Parturient ac sit! Aliquam dapibus, ut eros sit ac augue eu pulvinar adipiscing vel scelerisque, magnis aliquet dis diam sociis! Proin sit facilisis et et, integer, in, diam integer sit ridiculus dapibus rhoncus odio ultricies platea magnis tincidunt nec urna adipiscing, aliquet, adipiscing? Natoque.<br /><br /></p>', 'active', 0),
(18, 'Tjenest', '', '', 'service', '<p>Tjenest content</p>\n<p>Tempor! Parturient ac sit! Aliquam dapibus, ut eros sit ac augue eu pulvinar adipiscing vel scelerisque, magnis aliquet dis diam sociis! Proin sit facilisis et et, integer, in, diam integer sit ridiculus dapibus rhoncus odio ultricies platea magnis tincidunt nec urna adipiscing, aliquet, adipiscing? Natoque?</p>\n<p>Aliquet ut, platea lacus in! Tempor hac placerat magna massa dignissim egestas turpis nec sed! Elementum in. Etiam magnis dictumst? Pulvinar mid facilisis mid enim. Dis odio enim nec. Odio in vel? Parturient vel eros! In, etiam etiam vel, pulvinar tortor, diam etiam tristique urna, porttitor habitasse, tincidunt aliquet tristique in tristique nunc mid in, rhoncus ac lacus placerat, nec urna in dis, urna et rhoncus lectus? Rhoncus nisi auctor arcu scelerisque, nec ut scelerisque.<br /><br /></p>', 'active', 1),
(21, 'Handleguide', '', '', 'guide', '<p>Shopping guide in Norwegian.</p>\n<p>Tempor! Parturient ac sit! Aliquam dapibus, ut eros sit ac augue eu pulvinar adipiscing vel scelerisque, magnis aliquet dis diam sociis! Proin sit facilisis et et, integer, in, diam integer sit ridiculus dapibus rhoncus odio ultricies platea magnis tincidunt nec urna adipiscing, aliquet, adipiscing? Natoque?</p>\n<p>Aliquet ut, platea lacus in! Tempor hac placerat magna massa dignissim egestas turpis nec sed! Elementum in. Etiam magnis dictumst? Pulvinar mid facilisis mid enim. Dis odio enim nec. Odio in vel? Parturient vel eros! In, etiam etiam vel, pulvinar tortor, diam etiam tristique urna, porttitor habitasse, tincidunt aliquet tristique in tristique nunc mid in, rhoncus ac lacus placerat, nec urna in dis, urna et rhoncus lectus? Rhoncus nisi auctor arcu scelerisque, nec ut scelerisque.</p>', 'active', 1),
(22, 'Other work', '', '', 'other_work', '<p>Porta integer etiam nisi ultrices augue adipiscing diam dignissim hac dolor lundium, nec scelerisque sed. Eros! Etiam sit! Scelerisque est hac sed mus augue placerat placerat magna in turpis tortor cras scelerisque, ultricies eros nec augue, rhoncus, odio turpis ac! Ut urna aliquam dis urna. Turpis porttitor nunc risus pellentesque nec sit ut dictumst eros, a eu odio, pid auctor etiam ut ac porta? Porta mauris adipiscing vel. Mid integer? Duis eu et? Egestas proin dis augue, elementum, lundium dis, habitasse urna, natoque. Velit enim. Ac, aliquet in urna adipiscing! Ac placerat rhoncus, est vel dolor. Integer odio cum aliquam pulvinar montes integer nec, tincidunt scelerisque ac sed! Enim scelerisque enim facilisis! A aliquet! Vel pulvinar porta scelerisque parturient tristique.<br /><br />Enim, platea elementum lundium tincidunt! Porttitor egestas nec habitasse aliquam augue et pid tristique nunc lundium arcu. Augue lorem elit cursus, nec parturient, magna ac integer cum adipiscing porttitor, mid dapibus enim urna! Aenean urna tempor nunc dapibus! Nisi urna facilisis, porta aenean et augue lectus tincidunt. Mattis arcu. Vut augue aenean auctor! Ultricies ut elementum dictumst vel, ac, elementum egestas ultrices placerat odio diam enim et mauris a, ac, auctor dolor lacus ultrices, montes! Turpis dis. Tempor porttitor, pulvinar magnis, nunc, turpis, mus mattis sed, auctor scelerisque eros a odio, phasellus lacus cras porta enim. Integer dictumst non? Lectus sociis, risus urna? Scelerisque magna in dolor integer risus? Tristique ac ultrices penatibus mauris mus, ut platea pellentesque pulvinar.</p>', 'active', 0),
(23, 'Licensing', '', '', 'licensing', '<p>Porta integer etiam nisi ultrices augue adipiscing diam dignissim hac dolor lundium, nec scelerisque sed. Eros! Etiam sit! Scelerisque est hac sed mus augue placerat placerat magna in turpis tortor cras scelerisque, ultricies eros nec augue, rhoncus, odio turpis ac! Ut urna aliquam dis urna. Turpis porttitor nunc risus pellentesque nec sit ut dictumst eros, a eu odio, pid auctor etiam ut ac porta? Porta mauris adipiscing vel. Mid integer? Duis eu et? Egestas proin dis augue, elementum, lundium dis, habitasse urna, natoque. Velit enim. Ac, aliquet in urna adipiscing! Ac placerat rhoncus, est vel dolor. Integer odio cum aliquam pulvinar montes integer nec, tincidunt scelerisque ac sed! Enim scelerisque enim facilisis! A aliquet! Vel pulvinar porta scelerisque parturient tristique.<br /><br />Enim, platea elementum lundium tincidunt! Porttitor egestas nec habitasse aliquam augue et pid tristique nunc lundium arcu. Augue lorem elit cursus, nec parturient, magna ac integer cum adipiscing porttitor, mid dapibus enim urna! Aenean urna tempor nunc dapibus! Nisi urna facilisis, porta aenean et augue lectus tincidunt. Mattis arcu. Vut augue aenean auctor! Ultricies ut elementum dictumst vel, ac, elementum egestas ultrices placerat odio diam enim et mauris a, ac, auctor dolor lacus ultrices, montes! Turpis dis. Tempor porttitor, pulvinar magnis, nunc, turpis, mus mattis sed, auctor scelerisque eros a odio, phasellus lacus cras porta enim. Integer dictumst non? Lectus sociis, risus urna? Scelerisque magna in dolor integer risus? Tristique ac ultrices penatibus mauris mus, ut platea pellentesque pulvinar.</p>\n<p>Porta integer etiam nisi ultrices augue adipiscing diam dignissim hac dolor lundium, nec scelerisque sed. Eros! Etiam sit! Scelerisque est hac sed mus augue placerat placerat magna in turpis tortor cras scelerisque, ultricies eros nec augue, rhoncus, odio turpis ac! Ut urna aliquam dis urna. Turpis porttitor nunc risus pellentesque nec sit ut dictumst eros, a eu odio, pid auctor etiam ut ac porta? Porta mauris adipiscing vel. Mid integer? Duis eu et? Egestas proin dis augue, elementum, lundium dis, habitasse urna, natoque. Velit enim. Ac, aliquet in urna adipiscing! Ac placerat rhoncus, est vel dolor. Integer odio cum aliquam pulvinar montes integer nec, tincidunt scelerisque ac sed! Enim scelerisque enim facilisis! A aliquet! Vel pulvinar porta scelerisque parturient tristique.<br /><br />Enim, platea elementum lundium tincidunt! Porttitor egestas nec habitasse aliquam augue et pid tristique nunc lundium arcu. Augue lorem elit cursus, nec parturient, magna ac integer cum adipiscing porttitor, mid dapibus enim urna! Aenean urna tempor nunc dapibus! Nisi urna facilisis, porta aenean et augue lectus tincidunt. Mattis arcu. Vut augue aenean auctor! Ultricies ut elementum dictumst vel, ac, elementum egestas ultrices placerat odio diam enim et mauris a, ac, auctor dolor lacus ultrices, montes! Turpis dis. Tempor porttitor, pulvinar magnis, nunc, turpis, mus mattis sed, auctor scelerisque eros a odio, phasellus lacus cras porta enim. Integer dictumst non? Lectus sociis, risus urna? Scelerisque magna in dolor integer risus? Tristique ac ultrices penatibus mauris mus, ut platea pellentesque pulvinar.</p>\n<p>&nbsp;</p>', 'active', 0),
(24, 'Services', '', '', 'services', '<p>Porta integer etiam nisi ultrices augue adipiscing diam dignissim hac dolor lundium, nec scelerisque sed. Eros! Etiam sit! Scelerisque est hac sed mus augue placerat placerat magna in turpis tortor cras scelerisque, ultricies eros nec augue, rhoncus, odio turpis ac! Ut urna aliquam dis urna. Turpis porttitor nunc risus pellentesque nec sit ut dictumst eros, a eu odio, pid auctor etiam ut ac porta? Porta mauris adipiscing vel. Mid integer? Duis eu et? Egestas proin dis augue, elementum, lundium dis, habitasse urna, natoque. Velit enim. Ac, aliquet in urna adipiscing! Ac placerat rhoncus, est vel dolor. Integer odio cum aliquam pulvinar montes integer nec, tincidunt scelerisque ac sed! Enim scelerisque enim facilisis! A aliquet! Vel pulvinar porta scelerisque parturient tristique.<br /><br />Enim, platea elementum lundium tincidunt! Porttitor egestas nec habitasse aliquam augue et pid tristique nunc lundium arcu. Augue lorem elit cursus, nec parturient, magna ac integer cum adipiscing porttitor, mid dapibus enim urna! Aenean urna tempor nunc dapibus! Nisi urna facilisis, porta aenean et augue lectus tincidunt. Mattis arcu. Vut augue aenean auctor! Ultricies ut elementum dictumst vel, ac, elementum egestas ultrices placerat odio diam enim et mauris a, ac, auctor dolor lacus ultrices, montes! Turpis dis. Tempor porttitor, pulvinar magnis, nunc, turpis, mus mattis sed, auctor scelerisque eros a odio, phasellus lacus cras porta enim. Integer dictumst non? Lectus sociis, risus urna? Scelerisque magna in dolor integer risus? Tristique ac ultrices penatibus mauris mus, ut platea pellentesque pulvinar.</p>', 'active', 0),
(32, 'Historien', '', '', 'history', '<p>History content</p>', 'active', 0),
(33, 'Press', '', 'desc of press', 'press', '<p>content press</p>', 'active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `omc_playroom`
--

CREATE TABLE IF NOT EXISTS `omc_playroom` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shortdesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longdesc` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `parentid` int(11) unsigned NOT NULL,
  `lang_id` int(2) unsigned NOT NULL,
  `table_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `omc_playroom`
--

INSERT INTO `omc_playroom` (`id`, `name`, `shortdesc`, `longdesc`, `image`, `status`, `parentid`, `lang_id`, `table_id`) VALUES
(10, 'Playroom root', '<p>English playroom root</p>', '', '', 'active', 0, 0, 10),
(11, 'Puzzles', '<p>Puzzles in English</p>', '', '<img src="assets/images/puzzles/puzzle_kitty_200.jpg" alt="" width="200" height="150" />', 'active', 10, 0, 11),
(12, 'Jigsaw', '<p>Jigsaw in English</p>', '', '', 'active', 10, 0, 12),
(13, 'Lekerom root', '<p>Norsk</p>', '', '', 'active', 0, 1, 10),
(15, 'Jigsaw', '', '', '', 'active', 13, 1, 12),
(16, 'Oppgave', '', '', '<p><img src="../../../../assets/images/puzzles/puzzle_kitty_200.jpg" alt="" width="200" height="150" /></p>', 'active', 13, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `omc_products`
--

CREATE TABLE IF NOT EXISTS `omc_products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shortdesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longdesc` text COLLATE utf8_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_order` int(11) unsigned DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grouping` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) unsigned NOT NULL,
  `featured` enum('none','quicksand') COLLATE utf8_unicode_ci NOT NULL,
  `other_feature` enum('none','most sold','new product') COLLATE utf8_unicode_ci NOT NULL,
  `price` float(7,2) NOT NULL,
  `lang_id` int(2) unsigned NOT NULL,
  `table_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=45 ;

--
-- Dumping data for table `omc_products`
--

INSERT INTO `omc_products` (`id`, `name`, `shortdesc`, `longdesc`, `thumbnail`, `image`, `product_order`, `class`, `grouping`, `status`, `category_id`, `featured`, `other_feature`, `price`, `lang_id`, `table_id`) VALUES
(1, 'Pattern 1', 'Short desc of Pattern 1', '<p>Long desc of pattern 1.</p>', '<p><img src="../../../../assets/images/patterns/pattern1.png" alt="" width="144" height="207" /></p>', '', 10, '', '', 'active', 2, 'none', 'none', 0.00, 0, 1),
(3, 'Pattern 2', 'pattern two short description', '<p>Pattern two long description.</p>', '<p><img src="../../../../assets/images/patterns/pattern2.png" alt="" width="144" height="207" /></p>', '', 20, '', '', 'active', 2, 'none', 'none', 0.00, 0, 3),
(5, 'Pattern 3', 'Pattern three short description.', '<p>Pattern three long description.</p>', '<p><img src="../../../../assets/images/patterns/pattern3.png" alt="" width="144" height="207" /></p>', '', 30, '', '', 'active', 2, 'none', 'none', 0.00, 0, 5),
(9, 'Pattern 4', 'Pattern four short description', '<p>Pattern 4 long desctiption. test</p>', '<p><img src="../../../../assets/images/patterns/pattern4.png" alt="" width="144" height="207" /></p>', '', 40, '', '', 'active', 2, 'none', 'none', 0.00, 0, 9),
(11, 'Pattern 5', 'Pattern five short description', '<p>Pattern five long description.</p>', '<p><img src="../../../../assets/images/patterns/pattern5.png" alt="" width="144" height="207" /></p>', '', 50, '', '', 'active', 2, 'none', 'none', 0.00, 0, 11),
(13, 'Effigy Mound', 'short desc of effigy', '<p>long desc of effigy</p>', '<p><img title="effigy" src="../../../../assets/images/mayancalendar/effigy_small.jpg" alt="" width="144" height="207" /></p>', '<p><img title="effigy" src="../../../../assets/images/mayancalendar/effigy_big.jpg" alt="" width="340" height="372" /><img src="../../../../assets/images/books/242x440_14.jpg" alt="" width="242" height="440" /></p>', 70, '', '', 'active', 7, 'none', 'none', 0.00, 0, 13),
(15, 'Hunab Ku', 'short desc of Hunab Ku', '<p>Long desc of Itzam yeh</p>', '<p><img src="../../../../assets/images/mayancalendar/itzam-yeh_small.jpg" alt="" width="144" height="207" /></p>', '<p><img src="../../../../assets/images/mayancalendar/itzam-yeh_big.jpg" alt="" width="340" height="366" /></p>', 40, '', '', 'active', 7, 'none', 'none', 0.00, 0, 15),
(17, 'The Milky Way: Kukulkan', 'short desc of the milky way', '<p>Long desc of milky way test</p>', '<p><img src="../../../../assets/images/mayancalendar/milky_way_kukulkan_small.jpg" alt="" width="144" height="207" /></p>', '<p><img src="../../../../assets/images/mayancalendar/milky_way_kukulkan_big.jpg" alt="" width="446" height="283" /></p>', 10, '', '', 'active', 7, 'none', 'none', 0.00, 0, 17),
(18, 'Lady Xoc with scull', 'short desc of Lady Xoc', '<p>long desc of Layd xoc</p>', '<p><img src="../../../assets/images/mayancalendar/lady_xoc_small.jpg" alt="" width="144" height="207" /></p>', '<p><img src="../../../assets/images/mayancalendar/lady_xoc_big.jpg" alt="" width="340" height="396" /></p>', 20, '', '', 'active', 7, 'none', 'none', 0.00, 0, 18),
(19, '12 Baktun 13 Ahau', 'short desc of 12 Baktun 13 Ahau', '<p>Long desc of 12 Baktun 13 Ahau test</p>', '<p><img src="../../../assets/images/mayancalendar/palenque_small.jpg" alt="" width="144" height="207" /></p>', '<p><img src="../../../assets/images/mayancalendar/palenque_big.jpg" alt="" width="340" height="481" /></p>', 30, '', '', 'active', 7, 'none', 'none', 0.00, 0, 19),
(20, 'Tikal', 'short desc of Tikal', '<p>long desc of Tikal</p>', '<p><img src="../../../assets/images/mayancalendar/tikal_small.jpg" alt="" width="144" height="207" /></p>', '<p><img src="../../../assets/images/mayancalendar/tikal_big.jpg" alt="" width="340" height="366" /></p>', 50, '', '', 'active', 7, 'none', 'none', 0.00, 0, 20),
(21, 'Chak Balam', 'short desc of chak balam', '<p>long desc of chak balam</p>', '<p><img src="../../../assets/images/mayancalendar/jaguar_small.jpg" alt="" width="144" height="207" /></p>', '<p><img src="../../../assets/images/mayancalendar/jaguar_big.jpg" alt="" width="340" height="366" /></p>', 60, '', '', 'active', 7, 'none', 'none', 0.00, 0, 21),
(22, 'Teotihuacan', 'short desc of teotihuacan', '<p>long desc of teotihuacan</p>', '<p><img src="../../../assets/images/mayancalendar/teotihuacan_small.jpg" alt="" width="144" height="207" /></p>', '<p><img src="../../../assets/images/mayancalendar/teotihuacan_big.jpg" alt="" width="340" height="383" /></p>', 80, '', '', 'active', 7, 'none', 'none', 0.00, 0, 22),
(23, 'Falckon', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/falck_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/falck_big.jpg" alt="" width="237" height="362" /></p>', 0, 'birds nature', '', 'active', 31, 'quicksand', 'none', 0.00, 0, 23),
(24, 'Fantail', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/fantail_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/fantail_big.jpg" alt="" width="244" height="400" /></p>', 0, 'birds', '', 'active', 31, 'quicksand', 'none', 0.00, 0, 24),
(25, 'Kea', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/kea_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/kea_big.jpg" alt="" width="244" height="400" /></p>', 0, 'birds', '', 'active', 31, 'quicksand', 'none', 0.00, 0, 25),
(26, 'Pig', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/pig_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/pig_big.jpg" alt="" width="286" height="281" /></p>', 0, 'humor kids', '', 'active', 29, 'quicksand', 'none', 0.00, 0, 26),
(27, 'Grandma rap', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/grandmarap_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/grandmarap_big.jpg" alt="" width="500" height="400" /></p>', 0, 'humor kids', '', 'active', 29, 'quicksand', 'none', 0.00, 0, 27),
(28, 'Aboriginal', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/aboriginal_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/aboriginal_big.jpg" alt="" width="500" height="400" /></p>', 0, 'various', '', 'active', 35, 'quicksand', 'none', 0.00, 0, 28),
(29, 'Alvedans', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/alvedans_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/alvedans_big.jpg" alt="" width="454" height="292" /></p>', 0, 'kids', '', 'active', 28, 'quicksand', 'none', 0.00, 0, 29),
(30, 'Angel', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/angel_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/angel_big.jpg" alt="" width="340" height="481" /></p>', 0, 'fantasy', '', 'active', 33, 'quicksand', 'none', 0.00, 0, 30),
(31, 'Broken limbs', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/brokenlimbs_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/brokenlimbs_big.jpg" alt="" width="435" height="506" /></p>', 0, 'teen', '', 'active', 34, 'quicksand', 'none', 0.00, 0, 31),
(32, 'Camel', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/camel_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/camel_big.jpg" alt="" width="318" height="384" /></p>', 0, 'kids', '', 'active', 28, 'quicksand', 'none', 0.00, 0, 32),
(33, 'Celebration', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/celebration_small.jpg" alt="" width="144" height="207" /></p>', '<p><img src="../../../../assets/images/other_illustrations/celebration_big.jpg" alt="" width="278" height="400" /></p>', 0, 'fantasy', '', 'active', 33, 'quicksand', 'none', 0.00, 0, 33),
(34, 'Comfort', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/comfort_small.jpg" alt="" width="144" height="207" /></p>', '<p><img src="../../../../assets/images/other_illustrations/comfort_big.jpg" alt="" width="278" height="400" /></p>', 0, 'fantasy', '', 'active', 33, 'quicksand', 'none', 0.00, 0, 34),
(35, 'Cumulus', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/cumulus_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/cumulus_big.gif" alt="" width="844" height="558" /></p>', 0, 'teen', '', 'active', 34, 'quicksand', 'none', 0.00, 0, 35),
(36, 'Dentist', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/dentist_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/dentist_big.jpg" alt="" width="335" height="449" /></p>', 0, 'teen', '', 'active', 34, 'quicksand', 'none', 0.00, 0, 36),
(37, 'Doggie', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/doggie_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/doggie_big.jpg" alt="" width="500" height="400" /></p>', 0, 'animals', '', 'active', 30, 'quicksand', 'none', 0.00, 0, 37),
(38, 'Dolphin', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/dolphin_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/dolphin_big.jpg" alt="" width="244" height="400" /></p>', 0, 'animals', '', 'active', 30, 'quicksand', 'none', 0.00, 0, 38),
(39, 'Dragonfly', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/dragonfly_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/dragonfly_big.jpg" alt="" width="244" height="400" /></p>', 0, 'nature', '', 'active', 32, 'quicksand', 'none', 0.00, 0, 39),
(40, 'Tuatara', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/tuatara_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/tuatara_big.jpg" alt="" width="244" height="400" /></p>', 0, 'animals', '', 'active', 30, 'quicksand', 'none', 0.00, 0, 40),
(41, 'Friendship', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/friendship_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/friendship_big.jpg" alt="" width="278" height="400" /></p>', 0, 'fantasy', '', 'active', 33, 'quicksand', 'none', 0.00, 0, 41),
(42, 'Fruits', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/frukt_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/frukt_big.jpg" alt="" width="452" height="333" /></p>', 0, 'various', '', 'active', 35, 'quicksand', 'none', 0.00, 0, 42),
(43, 'Gaia', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/gaia_small.jpg" alt="" width="144" height="207" /></p>', '<p><img src="../../../../assets/images/other_illustrations/gaia_big.jpg" alt="" width="278" height="441" /></p>', 0, 'fantasy', '', 'active', 33, 'quicksand', 'none', 0.00, 0, 43),
(44, 'Stonehenge', '', '', '<p><img src="../../../../assets/images/other_illustrations/thumbnails/stonehenge_small.jpg" alt="" width="77" height="105" /></p>', '<p><img src="../../../../assets/images/other_illustrations/stonehenge_big.jpg" alt="" width="340" height="334" /></p>', 0, 'licensing', '', 'active', 36, 'quicksand', 'none', 0.00, 0, 44);

-- --------------------------------------------------------

--
-- Table structure for table `omc_product_colors`
--

CREATE TABLE IF NOT EXISTS `omc_product_colors` (
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `omc_product_colors`
--


-- --------------------------------------------------------

--
-- Table structure for table `omc_product_sizes`
--

CREATE TABLE IF NOT EXISTS `omc_product_sizes` (
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `omc_product_sizes`
--


-- --------------------------------------------------------

--
-- Table structure for table `omc_sizes`
--

CREATE TABLE IF NOT EXISTS `omc_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `omc_sizes`
--


-- --------------------------------------------------------

--
-- Table structure for table `omc_slideshow`
--

CREATE TABLE IF NOT EXISTS `omc_slideshow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shortdesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longdesc` text COLLATE utf8_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slide_order` int(11) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `featured` enum('none','front','webshop') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `omc_slideshow`
--

INSERT INTO `omc_slideshow` (`id`, `name`, `shortdesc`, `longdesc`, `thumbnail`, `image`, `slide_order`, `status`, `featured`) VALUES
(1, 'image1.png', '<p>slide 1</p>', '', '', '<p><img src="../../../../assets/images/frontpage/image1.png" alt="" width="790" height="356" /></p>', 10, 'active', 'none'),
(2, 'image2.gif', '<p>slide2 desc</p>', '', '', '<p><img src="../../../../assets/images/frontpage/image2.gif" alt="" width="790" height="356" /></p>', 20, 'active', 'none'),
(6, 'image3.gif', '', '', '', '<p><img src="../../../../assets/images/frontpage/image3.gif" alt="" width="790" height="356" /></p>', 30, 'active', 'none'),
(7, 'image4.gif', '', '', '', '<p><img src="../../../assets/images/frontpage/image4.gif" alt="" width="790" height="356" /></p>', 40, 'active', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `omc_subscribers`
--

CREATE TABLE IF NOT EXISTS `omc_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `omc_subscribers`
--


-- --------------------------------------------------------

--
-- Table structure for table `shoutbox`
--

CREATE TABLE IF NOT EXISTS `shoutbox` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'anonimous',
  `user_id` int(25) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` enum('to do','completed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'to do',
  `privacy` enum('public','private') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `shoutbox`
--

INSERT INTO `shoutbox` (`id`, `date`, `user`, `user_id`, `message`, `status`, `privacy`) VALUES
(1, '2011-06-09 07:07:42', 'admin', 8, 'add update from kaimonokago. Rss feed, google analytics and avatar. From 29 May 11 onwards.', 'completed', 'public');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `be_acl_permissions`
--
ALTER TABLE `be_acl_permissions`
  ADD CONSTRAINT `be_acl_permissions_ibfk_1` FOREIGN KEY (`aro_id`) REFERENCES `be_acl_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `be_acl_permissions_ibfk_2` FOREIGN KEY (`aco_id`) REFERENCES `be_acl_resources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `be_acl_permission_actions`
--
ALTER TABLE `be_acl_permission_actions`
  ADD CONSTRAINT `be_acl_permission_actions_ibfk_1` FOREIGN KEY (`access_id`) REFERENCES `be_acl_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `be_acl_permission_actions_ibfk_2` FOREIGN KEY (`axo_id`) REFERENCES `be_acl_actions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `be_groups`
--
ALTER TABLE `be_groups`
  ADD CONSTRAINT `be_groups_ibfk_1` FOREIGN KEY (`id`) REFERENCES `be_acl_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `be_resources`
--
ALTER TABLE `be_resources`
  ADD CONSTRAINT `be_resources_ibfk_1` FOREIGN KEY (`id`) REFERENCES `be_acl_resources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `be_users`
--
ALTER TABLE `be_users`
  ADD CONSTRAINT `be_users_ibfk_1` FOREIGN KEY (`group`) REFERENCES `be_acl_groups` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `be_user_profiles`
--
ALTER TABLE `be_user_profiles`
  ADD CONSTRAINT `be_user_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `be_users` (`id`) ON DELETE CASCADE;
