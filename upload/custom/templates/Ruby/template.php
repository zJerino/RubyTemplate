<?php
/*
*	Ruby Template | By zJerino
*	For NamelessMC v2 pre8
*	Start Developer 8/11/2020 4:49 pm | America/Caracas
*/
// Cache b1c5dc5544286c50e3d50ba66b2ad2cd5325f68c.cache

class Ruby_Template extends TemplateBase {
	private $_CONFIG_PATH, $TEMPLATE_PATH;
	public function __construct($cache, $smarty, $language, $user, $pages){
		parent::__construct('Ruby',  '1.0.1',  '2.0.0-pr8',  '<a href="https://cuberico.xyz/" target="_blank">zJerino</a>' );

		$this->_settings = ROOT_PATH . '/custom/templates/Ruby/template_settings/settings.php';
		
		

		$CONFIG_PATH 	= (defined('CONFIG_PATH') ? CONFIG_PATH : '/');
		$TEMPLATE_PATH 	=  $CONFIG_PATH . 'custom/templates/Ruby';
		$this->_CONFIG_PATH = $CONFIG_PATH;
		$this->_language = $language;
		$this->_user = $user;
		$this->_TEMPLATE_PATH = $TEMPLATE_PATH;
		$smarty->assign(array(
			'TEMPLATE_PATH' => $TEMPLATE_PATH,
			'SEARCH_LABEL' => $language->get('general', 'search'),
			'SEARCH_ACTION' => URL::Build('/forum/search/'),
			'BUSQUEDA_TOKEN' => Token::get()
		));
		$this->addCSS('/plugins/adminlte/css/adminlte.min.css');
		$this->addCSS('/plugins/toastr/toastr.min.css');
		$this->addCSS('/plugins/fontawesome-free/css/all.min.css');
		$this->addCSS('/css/ruby.css');
		$this->addCSS('/css/google.icon.css');
		$this->addCSS('/css/colors.css');

		// $this->addCSS('/css/Ruby.css');
		// $this->addCSS('/css/all.min.css');

		$this->AddJS('/plugins/jquery/jquery.min.js');
		$this->AddJS('/plugins/jquery-cookie/jquery.cookie.js');
		$this->AddJS('/plugins/toastr/toastr.min.js');
		$this->AddJS('/plugins/bootstrap/js/bootstrap.bundle.min.js');
		$this->AddJS('/plugins/adminlte/js/adminlte.min.js');
				
		$this->addJSFiles(array(
			URL::Build('/MoozEngine.js') => array(),
		));
		$smarty->assign('ACTIONS_a', $language->get('general', 'actions'));
		$smarty->assign('PAGE', PAGE);
		$smarty->assign('MANIFEST', URL::Build('/Menifest.json'));
		
		$cache->setCache('RUBY_SETTINGS');
		if (empty($cache->retrieve('GENERAL'))) {
			$FILE_DECODE = json_decode(
				str_replace('{sitename}', SITE_NAME, file_get_contents(ROOT_PATH . "/custom/templates/Ruby/assets/firt.TMP"))
			);
			if(isset($FILE_DECODE->GENERAL) && isset($FILE_DECODE->COLORS) && isset($FILE_DECODE->WIDGETS)){
				$cache->setCache('RUBY_SETTINGS');
				$cache->store('GENERAL', array(
					'DESCRIPTION' => $FILE_DECODE->GENERAL->DESCRIPTION,
					'FAVICON' => $FILE_DECODE->GENERAL->FAVICON,
					'COLOR' => $FILE_DECODE->GENERAL->COLOR,
					'DEFAULTMODE' => "light",
				));
				$cache->store('WIDGET_S', array(
					'LAYOUT' 	=> $FILE_DECODE->WIDGETS->LAYOUT,
					'COLOR' 	=> $FILE_DECODE->WIDGETS->COLOR,
				));
				$cache->store('G_COLORS', array(
					'PRIMARY' 	=> $FILE_DECODE->COLORS->GENERAL->PRIMARY,
					'LIGHT' 	=> $FILE_DECODE->COLORS->GENERAL->LIGHT,
					'DARK' 		=> $FILE_DECODE->COLORS->GENERAL->DARK,
					'SUCCESS' 	=> $FILE_DECODE->COLORS->GENERAL->SUCCESS,
					'INFO' 		=> $FILE_DECODE->COLORS->GENERAL->INFO,
					'WARNING' 	=> $FILE_DECODE->COLORS->GENERAL->WARNING,
					'DANGER' 	=> $FILE_DECODE->COLORS->GENERAL->DANGER,
				));
				
				$cache->store('THEME_LIGHT', array(
					//Background
					'BBODY' 	=> $FILE_DECODE->COLORS->LIGHT->BBODY,
					'BCARD' 	=> $FILE_DECODE->COLORS->LIGHT->BCARD,
					'BCALLOUT' 		=> $FILE_DECODE->COLORS->LIGHT->BCALLOUT,
					'BNAVBAR' 	=> $FILE_DECODE->COLORS->LIGHT->BNAVBAR,
					'BSIDEBAR' 		=> $FILE_DECODE->COLORS->LIGHT->BSIDEBAR,
					'BDROPDOWN' 	=> $FILE_DECODE->COLORS->LIGHT->BDROPDOWN,
					'BDROPDOWNH' 	=> 'var(--primary)',
					'BFOOTER' 	=> $FILE_DECODE->COLORS->LIGHT->BFOOTER,
					'BINPUTS' 	=> $FILE_DECODE->COLORS->LIGHT->BINPUTS,
					//Text Colors
					'CBODY' 	=> $FILE_DECODE->COLORS->LIGHT->CBODY,
					'CCARD' 	=> $FILE_DECODE->COLORS->LIGHT->CCARD,
					'CCALLOUT' 		=> $FILE_DECODE->COLORS->LIGHT->CCALLOUT,
					'CNAVBAR' 	=> $FILE_DECODE->COLORS->LIGHT->CNAVBAR,
					'CSIDEBAR' 		=> $FILE_DECODE->COLORS->LIGHT->CSIDEBAR,
					'CSIDEBARH' 		=> $FILE_DECODE->COLORS->LIGHT->CSIDEBARH,
					'CDROPDOWN' 	=> $FILE_DECODE->COLORS->LIGHT->CDROPDOWN,
					'CDROPDOWNH' 	=> $FILE_DECODE->COLORS->LIGHT->CDROPDOWNH,
					'CFOOTER' 	=> $FILE_DECODE->COLORS->LIGHT->CFOOTER,
					'CINPUTS' 	=> $FILE_DECODE->COLORS->LIGHT->CINPUTS,
					'CLALERT' 	=> $FILE_DECODE->COLORS->LIGHT->CLALERT,
					'CDALERT' 	=> $FILE_DECODE->COLORS->LIGHT->CDALERT,
					'CINPUTS' 	=> $FILE_DECODE->COLORS->LIGHT->CINPUTS,
				));
				$cache->store('THEME_DARK', array(
					//Background
					'BBODY' 	=> $FILE_DECODE->COLORS->DARK->BBODY,
					'BCARD' 	=> $FILE_DECODE->COLORS->DARK->BCARD,
					'BCALLOUT' 		=> $FILE_DECODE->COLORS->DARK->BCALLOUT,
					'BNAVBAR' 	=> $FILE_DECODE->COLORS->DARK->BNAVBAR,
					'BSIDEBAR' 		=> $FILE_DECODE->COLORS->DARK->BSIDEBAR,
					'BDROPDOWN' 	=> $FILE_DECODE->COLORS->DARK->BDROPDOWN,
					'BDROPDOWNH' 	=> 'var(--primary)',
					'BFOOTER' 	=> $FILE_DECODE->COLORS->DARK->BFOOTER,
					'BINPUTS' 	=> $FILE_DECODE->COLORS->DARK->BINPUTS,
					//Text Colors
					'CBODY' 	=> $FILE_DECODE->COLORS->DARK->CBODY,
					'CCARD' 	=> $FILE_DECODE->COLORS->DARK->CCARD,
					'CCALLOUT' 		=> $FILE_DECODE->COLORS->DARK->CCALLOUT,
					'CNAVBAR' 	=> $FILE_DECODE->COLORS->DARK->CNAVBAR,
					'CSIDEBAR' 		=> $FILE_DECODE->COLORS->DARK->CSIDEBAR,
					'CSIDEBARH' 		=> $FILE_DECODE->COLORS->DARK->CSIDEBARH,
					'CDROPDOWN' 	=> $FILE_DECODE->COLORS->DARK->CDROPDOWN,
					'CDROPDOWNH' 	=> $FILE_DECODE->COLORS->DARK->CDROPDOWNH,
					'CFOOTER' 	=> $FILE_DECODE->COLORS->DARK->CFOOTER,
					'CINPUTS' 	=> $FILE_DECODE->COLORS->DARK->CINPUTS,
					'CLALERT' 	=> $FILE_DECODE->COLORS->DARK->CLALERT,
					'CDALERT' 	=> $FILE_DECODE->COLORS->DARK->CDALERT,
					'CINPUTS' 	=> $FILE_DECODE->COLORS->DARK->CINPUTS,
				));
				$queries = new Queries();
				$active_templates = $queries->getWhere('templates', array('is_default', '=', 1));
				
				Redirect::to(URL::build('/panel/core/templates', 'action=settings&template='.$active_templates[0]->id));
			}
		}
		
		$GENERAL_SETTINGS 	= $cache->retrieve('GENERAL');
		$WIDGET_SETTINGS 	= $cache->retrieve('WIDGET_S');
		
		$smarty->assign('RUBY', array(
			'GENERAL' => $GENERAL_SETTINGS,
			'WIDGETS' => $WIDGET_SETTINGS,
		));
	}
	public function onPageLoad(){}
	public function AddCSS($FILE) {
		$TEMPLATE_PATH 	=  $this->_TEMPLATE_PATH;

		if (is_array($FILE)) {
			foreach ($FILE as $key => $value) {
				$this->addCSSFiles(array(
					$TEMPLATE_PATH . $value => array(),
				));
			}
		} else {
			$this->addCSSFiles(array(
				$TEMPLATE_PATH  . '/assets' .  $FILE => array(),
			));
		}
	}
	public function AddJS($FILE) {
		$TEMPLATE_PATH 	=  $this->_TEMPLATE_PATH;

		if (is_array($FILE)) {
			foreach ($FILE as $key => $value) {
				$this->addJSFiles(array(
					$TEMPLATE_PATH . '/assets' . $value => array(),
				));
			}
		} else {
			$this->addJSFiles(array(
				$TEMPLATE_PATH  . '/assets' .  $FILE => array(),
			));
		}
	}
	public function addJSFiles($files){
		if(is_array($files) && count($files)){
			foreach($files as $href => $file)
				$this->_js[] = '<script  type="text/javascript" src="' . $href . '"' . (isset($file['integrity']) ? ' integrity="' . $file['integrity'] . '"' : '') . (isset($file['awa']) ? 'defer data-turbolinks-permanent=""' : '') . (isset($file['crossorigin']) ? ' crossorigin="' . $file['crossorigin'] . '"' : '') . '></script>';
		}
	}

	public function addJSScript($script = null){
		if($script)
			$this->_js[] = '<script type="text/javascript">' . $script . '</script>';
	}
}

$template = new Ruby_Template($cache, $smarty, $language, $user, $pages);


$smarty->assign(array(
	'CONFIG' => array(
		'SMARTY_DEBUG' => false
	)
));