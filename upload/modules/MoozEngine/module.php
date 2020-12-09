<?php
#=============================#
#  MOOZ ENGINE —|— BETA
#  By: zJerino
#=============================#

class MoozEngine extends Module { 
	private $language, $queries, $cache, $_template;
	public function __construct($language, $pages, $queries, $cache, $template) {
		$ModuleInfo = [
			'name' => 'MoozEngine',
			'author' => 'zJerino',
			'version' => '1.0.0 BETA',
			'nameless_version' => '2.0.0-pr8'
		];

		// Initialize the module
		parent::__construct($this, $ModuleInfo['name'], $ModuleInfo['author'], $ModuleInfo['version'], $ModuleInfo['nameless_version']);

		// Register module page(s)sw.js
		$pages->add($ModuleInfo['name'], '/MoozEngine.js', 'pages/EngineJS.php');
		$pages->add($ModuleInfo['name'], '/sw.js', 'pages/sw.php');
		$pages->add($ModuleInfo['name'], '/Conexion', 'pages/net.php');
		$pages->add($ModuleInfo['name'], '/Menifest.json', 'pages/manifest.php');
		
		// Assign some variables
		$this->language = $language;
		$this->queries	= $queries;
		$this->cache	= $cache;
		$this->_template = $template;
		
	}

	public function onInstall(){}
	public function onUninstall(){}
	public function onEnable(){}
	public function onDisable(){}

	public function onPageLoad($user, $pages, $cache, $smarty, $navs, $widgets, $template){
		$smarty->assign(array(
			"LOADING" => $this->language->get('general', 'loading')
		));
	}
	public function Cuberico() {
		$route = (isset($_GET['route']) ? rtrim($_GET['route'], '/') : '/');
		$JSVariables = array(
            'SITE_NAME' => SITE_NAME,
            'SITE_HOME' => URL::build('/'),
            'SITE_URL' => Util::getSelfURL() . ltrim(URL::build('/'), '/'),
            'PAGE_NOW' => PAGE,
            'USER_AVATAR' => Util::getAvatarSource(),
            'COPIED' => $this->_language->get('general', 'copied'),
            'cookieNotice' => $this->_language->get('general', 'cookie_notice'),
            'noMessages' => $this->_language->get('user', 'no_messages'),
            'bungeeInstance' => $this->_language->get('general', 'bungee_instance'),
            'andMoreX' => $this->_language->get('general', 'and_x_more'),
            'noPlayersOnline' => $this->_language->get('general', 'no_players_online'),
            'offline' => $this->_language->get('general', 'offline'),
            'confirmDelete' => $this->_language->get('general', 'confirm_deletion'),
            'cookie'  => (defined('COOKIE_NOTICE') ? '1' : '0'),
            'loadingTime' => ((defined('PAGE_LOADING') && PAGE_LOADING == 1) ? PAGE_LOAD_TIME : ''),
			'route' => $route,
			

			#USER SECCION
			
        );
        $JSVars = '';
        $i = 0;
        foreach ($JSVariables as $var => $value) {
            $JSVars .= ($i == 0 ? 'var ' : ", \n ") . $var . ' = "' . $value . '"';
            $i++;
		}
		$this->addJSScript($JSVars);
		$this->AddJS('/js/MoozEngine.js');
	}
}
