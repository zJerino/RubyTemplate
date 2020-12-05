<?php
/*
 *	MOOZ TEMPLATE | By zJerino
 *  NamelessMC v2 pre8
 */

 

class Mooz_Template extends TemplateBase {
	private $_language, $_user, $_pages;
	public function __construct($cache, $smarty, $language, $user, $pages){
		$this->_language = $language;
		$this->_user = $user;
		$this->_pages = $pages;
		$template = array(
			"name" 	=> 'Mooz',
			"ver" 	=> '2.0',
			"nver"	=> '2.0.0-pr7',
			"autor" => '<a href="https://cuberico.xyz/" target="_blank">zJerino</a>',
		);
		$template["path"] = Config::get('core/path') . '/custom/templates/' . $template['name'] . '/';

		parent::__construct(
			$template['name'],
			$template['ver'],
			$template['nver'],
			$template['autor']
		);
		$this->addCSSFiles(array(
			$template['path'] . 'assets/css/bootstrap.custom.css' => array(),
			$template['path'] . 'assets/css/Mooz.css' => array(),
		));
		$this->addJSFiles(array(
			$template['path'] . 'assets/js/popper.min.js' => array(),
			$template['path'] . 'assets/js/bootstrap.min.js' => array()
		));
	}
	public function onPageLoad(){
		
	}
}
$template = new Mooz_Template($cache, $smarty, $language, $user, $pages);
