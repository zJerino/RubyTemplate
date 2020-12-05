<?php
/*
*	Ruby Template | By zJerino
*	For NamelessMC v2 pre8
*	Start Developer 23/11/2020 7:19 am | America/Caracas
*/
// Cache b1c5dc5544286c50e3d50ba66b2ad2cd5325f68c.cache



if (isset($_POST['UPLOADCONFIG']) && $_POST['UPLOADCONFIG'] == '1') {
	if(isset($_FILES['CONFIG_UPLOAD'])){
		$filename = $_FILES['CONFIG_UPLOAD']['name'];
		$fileext = pathinfo($filename, PATHINFO_EXTENSION);

		if(strtolower($fileext) == 'json'){
			$FILE_DECODE = json_decode(file_get_contents($_FILES['CONFIG_UPLOAD']['tmp_name']));
			if(isset($FILE_DECODE->GENERAL) && isset($FILE_DECODE->COLORS) && isset($FILE_DECODE->WIDGETS)){
				$cache->setCache('RUBY_SETTINGS');
				$cache->store('GENERAL', array(
					'DESCRIPTION' => $FILE_DECODE->GENERAL->DESCRIPTION,
					'FAVICON' => $FILE_DECODE->GENERAL->FAVICON,
					'COLOR' => $FILE_DECODE->GENERAL->COLOR,
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
				Session::flash('admin_templates', $language->get('admin', 'successfully_updated'));
			} else {
				$errors[] = "ERROR#B002";
			}
		} else {
			$errors[] = "ERROR#B001";
		}
	} else {
		$errors[] = "._.";
	}
}

$TEMPLATES_PATH = ROOT_PATH . '/custom/templates';
require_once($TEMPLATES_PATH . '/Ruby/template.php');
$Ruby_template = $template; 

define('PAGE', 'panel');
define('PARENT_PAGE', 'layout');
define('PANEL_PAGE', 'template');
define('PANEL_TEMPLATE', 'default');
$page_title = $language->get('admin', 'templates');
require_once(ROOT_PATH . '/core/templates/backend_init.php');
$panel_template = $template;

// Custom language
$default_theme_language = new Language(ROOT_PATH . '/custom/templates/Ruby/template_settings/language', LANGUAGE);
if(Input::exists()){
	if(Token::check()){
		if (isset($_POST['CHATBOX_AFIX']) && $_POST['CHATBOX_AFIX'] == 1) {
			file_put_contents(ROOT_PATH . '/modules/Chatbox/js/chatbox.js', base64_decode("LyoqCioJQ0hBVEJPWCBNT0RVTEUKKglCeSBYZW1haCB8IGh0dHBzOi8veGVtYWguY29tCioKKiovCgpkb2N1bWVudC5hZGRFdmVudExpc3RlbmVyKCd0dXJib2xpbmtzOmxvYWQnLCAoKSA9PiB7CiAgIGlmICghZG9jdW1lbnQuYm9keS5xdWVyeVNlbGVjdG9yKCcjY2hhdGJveCcpKSB7CgogICB2YXIgbGFzdFVwZGF0ZSA9IDA7CgogICBjb25zdCByZXF1ZXN0ID0gYXN5bmMgKHBhcmFtcywgY2FsbGJhY2spID0+IHsKCgkgICBjb25zdCB4aHIgPSBuZXcgWE1MSHR0cFJlcXVlc3QoKTsKCgkgICB4aHIub25yZWFkeXN0YXRlY2hhbmdlID0gKCkgPT4gewoJCSAgIGlmICh4aHIucmVhZHlTdGF0ZSA9PSA0ICYmIHhoci5zdGF0dXMgPT0gMjAwKSB7CgkJCSAgIGNhbGxiYWNrKEpTT04ucGFyc2UoeGhyLnJlc3BvbnNlVGV4dCkpOwoJCSAgIH0KCSAgIH07CgoJICAgbGV0IHJlcXVlc3RVUkwgPSBzaXRlVVJMKydjaGF0Jysoc2l0ZVVSTC5pbmNsdWRlcygnPycpID8gJyYnIDogJz8nKTsKCSAgIGlmIChPYmplY3Qua2V5cyhwYXJhbXMpLmxlbmd0aCkgewoJCSAgIGZvciAobGV0IHBhcmFtIGluIHBhcmFtcykgewoJCQkgICByZXF1ZXN0VVJMICs9IHBhcmFtKyc9JytwYXJhbXNbcGFyYW1dKycmJwoJCSAgIH0KCSAgIH0KCgkgICB4aHIub3BlbignZ2V0JywgcmVxdWVzdFVSTCk7CgkgICB4aHIuc2VuZCgpOwoKICAgfQoKICAgY29uc3QgZ2VuZXJhdGVUZW1wbGF0ZSA9ICgpID0+IHsKCgkgICBpZiAoY2hhdGJveFBvc2l0aW9uID09ICdib3R0b20nKSB7CgkJICAgY2hhdGJveC5lbGVtZW50cy5jb250YWluZXIgPSBjaGF0Ym94LmVsZW1lbnRzLmNvbnRhaW5lckJvdHRvbTsKCSAgIH0gZWxzZSB7CgkJICAgY2hhdGJveC5lbGVtZW50cy5jb250YWluZXIgPSBjaGF0Ym94LmVsZW1lbnRzLmNvbnRhaW5lclRvcDsKCSAgIH0KCgkgICBpZiAoIWNoYXRib3guZWxlbWVudHMuY29udGFpbmVyKSByZXR1cm47CgoJICAgY29uc3QgY29udGFpbmVyID0gZG9jdW1lbnQucXVlcnlTZWxlY3RvcihjaGF0Ym94LmVsZW1lbnRzLmNvbnRhaW5lcik7CgkgICBpZiAoIWNvbnRhaW5lcikgcmV0dXJuOwoKCSAgIGNvbnN0IGNoYXRib3hTdHlsZSA9IGRvY3VtZW50LmNyZWF0ZUVsZW1lbnQoJ3N0eWxlJyk7CgkgICBjaGF0Ym94U3R5bGUuaW5uZXJIVE1MID0gY2hhdGJveC5zdHlsZTsKCgkgICBsZXQgY2hhdGJveENvbnRhaW5lciA9IGRvY3VtZW50LmNyZWF0ZUVsZW1lbnQoJ2RpdicpOwoJICAgY2hhdGJveENvbnRhaW5lci5pZCA9ICdjaGF0Ym94Q29udGFpbmVyJzsKCgkgICBpZiAoY2hhdGJveFBvc2l0aW9uID09ICdib3R0b20nKSB7CgkJICAgY29udGFpbmVyLmFwcGVuZENoaWxkKGNoYXRib3hDb250YWluZXIpOwoJICAgfSBlbHNlIHsKCQkgICBjb250YWluZXIuaW5zZXJ0QmVmb3JlKGNoYXRib3hDb250YWluZXIsIGNvbnRhaW5lci5maXJzdENoaWxkKTsKCSAgIH0KCgkgICBjaGF0Ym94Q29udGFpbmVyID0gZG9jdW1lbnQucXVlcnlTZWxlY3RvcignI2NoYXRib3hDb250YWluZXInKTsKCSAgIGNoYXRib3hDb250YWluZXIuYXBwZW5kQ2hpbGQoY2hhdGJveFN0eWxlKTsKCgkgICBjb25zdCByZXBsYWNlbWVudEFycmF5ID0gewoJCSAgIGNoYXRib3hUaXRsZSwKCQkgICBjaGF0Ym94Tm9NZXNzYWdlcywKCQkgICBjaGF0Ym94TWVzc2FnZVBsYWNlaG9sZGVyLAoJCSAgIGNoYXRib3hMb2FkaW5nLAoJCSAgIGNoYXRib3hTZW5kCgkgICB9CgoJICAgbGV0IHRlbXBsYXRlID0gY2hhdGJveC50ZW1wbGF0ZTsKCSAgIGZvciAobGV0IGl0ZW0gaW4gcmVwbGFjZW1lbnRBcnJheSkgewoJCSAgIHRlbXBsYXRlID0gdGVtcGxhdGUuc3BsaXQoJ3snK2l0ZW0rJ30nKS5qb2luKHJlcGxhY2VtZW50QXJyYXlbaXRlbV0pOwoJICAgfQoKCSAgIGNoYXRib3hDb250YWluZXIuaW5uZXJIVE1MICs9IHRlbXBsYXRlOwoKICAgfQoKICAgY29uc3QgZ2VuZXJhdGVDaGF0ID0gKGRhdGEpID0+IHsKCgkgICBsZXQgY2hhdExvZyA9ICcnOwoJICAgZm9yIChsZXQgaSA9IDA7IGkgPCA1MCAmJiBpIDwgZGF0YS5sZW5ndGg7IGkrKykgewoJICAgCgkJICAgY29uc3QgcmVwbGFjZW1lbnRBcnJheSA9IHsKCQkJICAgYXV0aG9ySWQ6IGRhdGFbaV0uYXV0aG9yX2lkLAoJCQkgICBhdXRob3JVc2VybmFtZTogZGF0YVtpXS5hdXRob3JfdXNlcm5hbWUsCgkJCSAgIGF1dGhvckF2YXRhcjogZGF0YVtpXS5hdXRob3JfYXZhdGFyLAoJCQkgICBhdXRob3JQcm9maWxlOiBkYXRhW2ldLmF1dGhvcl9wcm9maWxlLAoJCQkgICBhdXRob3JTdHlsZTogZGF0YVtpXS5hdXRob3Jfc3R5bGUsCgkJCSAgIG1lc3NhZ2VJZDogZGF0YVtpXS5pZCwKCQkJICAgbWVzc2FnZUNvbnRlbnQ6IGRhdGFbaV0ubWVzc2FnZV9jb250ZW50LAoJCQkgICBtZXNzYWdlVGltZTogZGF0YVtpXS5tZXNzYWdlX3RpbWUsCgkJCSAgIG1lc3NhZ2VUaW1lRnVsbDogZGF0YVtpXS5tZXNzYWdlX3RpbWVfZnVsbCwKCQkJICAgbWVzc2FnZVRpbWVzdGFtcDogZGF0YVtpXS5tZXNzYWdlX3RpbWVzdGFtcCwKCQkgICB9CgoJCSAgIGlmIChkYXRhW2ldLmNhbl9tb2RlcmF0ZSkgewoJCQkgICByZXBsYWNlbWVudEFycmF5Lm1lc3NhZ2VBY3Rpb25zID0gJzxhIGhyZWY9XCcjXCcgaWQ9XCdjaGF0TWVzc2FnZVJlbW92ZS0nK2RhdGFbaV0uaWQrJ1wnPlJlbW92ZTwvYT4nOwoJCSAgIH0gZWxzZSB7CgkJCSAgIHJlcGxhY2VtZW50QXJyYXkubWVzc2FnZUFjdGlvbnMgPSAnJzsKCQkgICB9CgoJCSAgIGxldCBjaGF0SXRlbSA9IGNoYXRib3guaXRlbVRlbXBsYXRlOwoKCQkgICBmb3IgKGxldCBpdGVtIGluIHJlcGxhY2VtZW50QXJyYXkpIHsKCQkJICAgY2hhdEl0ZW0gPSBjaGF0SXRlbS5zcGxpdCgneycraXRlbSsnfScpLmpvaW4ocmVwbGFjZW1lbnRBcnJheVtpdGVtXSk7CgkJICAgfQoKCQkgICBjaGF0TG9nICs9IGNoYXRJdGVtOwoJCSAgIAoJICAgfQoKCSAgIHJldHVybiBjaGF0TG9nOwoKICAgfQoKICAgY29uc3QgaW5wdXRDaGF0ID0gKGV2ZW50KSA9PiB7CgoJICAgZXZlbnQucHJldmVudERlZmF1bHQoKTsgCgoJICAgaWYgKGNiRWxlbWVudHMuaW5wdXQudmFsdWUgPT0gJycpCgkJICAgcmV0dXJuOwoKCSAgIHJlcXVlc3QoeyBhY3Rpb246ICdpbnB1dCcsIG1lc3NhZ2U6IGNiRWxlbWVudHMuaW5wdXQudmFsdWUgfSwgKHJlc3BvbnNlKSA9PiB7CgoJCSAgIGlmIChjYkVsZW1lbnRzLmxvZy5xdWVyeVNlbGVjdG9yQWxsKCdbaWRePScrY2hhdE1lc3NhZ2UpLmxlbmd0aCA8IDEpCgkJCSAgIGNiRWxlbWVudHMubG9nLmlubmVySFRNTCA9ICcnOwoKCQkgICBjYkVsZW1lbnRzLmxvZy5pbm5lckhUTUwgKz0gZ2VuZXJhdGVDaGF0KHJlc3BvbnNlLmRhdGEpOwoJCSAgIGNiRWxlbWVudHMuaW5wdXQudmFsdWUgPSAnJzsKCQkgICBjYkVsZW1lbnRzLmxvZy5zY3JvbGxUb3AgPSBjYkVsZW1lbnRzLmxvZy5zY3JvbGxIZWlnaHQ7CgkJICAgbGFzdFVwZGF0ZSA9IHJlc3BvbnNlLmxhc3RVcGRhdGU7CgoJICAgfSk7CgkgICAKICAgfQoKICAgY29uc3QgbG9hZENoYXRMb2dzID0gKCkgPT4gIHsKCgkgICByZXF1ZXN0KHsgYWN0aW9uOiAnZmV0Y2gnIH0sIChyZXNwb25zZSkgPT4gewoKCQkgICBpZiAoIXJlc3BvbnNlLmRhdGEubGVuZ3RoKQoJCQkgICBjYkVsZW1lbnRzLmxvZy5pbm5lckhUTUwgPSBjaGF0Ym94Tm9NZXNzYWdlczsKCgkJICAgZWxzZSB7CgoJCQkgICBpZiAocmVzcG9uc2UubGFzdFVwZGF0ZSA8PSBsYXN0VXBkYXRlKQoJCQkJICAgcmV0dXJuOwoKCQkJICAgY2JFbGVtZW50cy5sb2cuaW5uZXJIVE1MID0gZ2VuZXJhdGVDaGF0KHJlc3BvbnNlLmRhdGEpOwoJCQkgICBjYkVsZW1lbnRzLmxvZy5zY3JvbGxUb3AgPSBjYkVsZW1lbnRzLmxvZy5zY3JvbGxIZWlnaHQ7CgkJCSAgIGxhc3RVcGRhdGUgPSByZXNwb25zZS5sYXN0VXBkYXRlOwoJICAgCgkJICAgfQoJICAgCgkJICAgaWYgKGNiRWxlbWVudHMuZm9ybS5jbGFzc0xpc3QuY29udGFpbnMoJ2Rpc2FibGVkJykgJiYgY2hhdGJveEFsbG93SW5wdXQgPT0gJzEnKQoJCQkgICBjYkVsZW1lbnRzLmZvcm0uY2xhc3NMaXN0LnJlbW92ZSgnZGlzYWJsZWQnKTsKCgkgICB9KTsKCiAgIH0KCiAgIGNvbnN0IHJlbW92ZUNoYXRNZXNzYWdlID0gKGV2ZW50KSA9PiB7CgoJICAgaWYgKCFldmVudC50YXJnZXQuaWQuc3RhcnRzV2l0aCgnY2hhdE1lc3NhZ2VSZW1vdmUnKSkgewoJCSAgIHJldHVybjsKCSAgIH0KCSAgIAoJICAgZXZlbnQucHJldmVudERlZmF1bHQoKTsKCgkgICBjb25zdCBlbGVtZW50ID0gZXZlbnQudGFyZ2V0OwoJICAgY29uc3QgY2hhdE1lc3NhZ2VJRCA9IGVsZW1lbnQuaWQuc3BsaXQoJy0nKS5wb3AoKTsKCSAgIGVsZW1lbnQuY2xhc3NMaXN0LmFkZCgnZGlzYWJsZWQnKTsKCSAgIAoJICAgcmVxdWVzdCh7IGFjdGlvbjogJ3JlbW92ZU1lc3NhZ2UnLCBtZXNzYWdlSUQ6IGNoYXRNZXNzYWdlSUQgfSwgKHJlc3BvbnNlKSA9PiB7CgkJICAgbG9hZENoYXRMb2dzKCk7CgkJICAgLy8gY2hhdFJlZnJlc2hJbnRlcnZhbCA9IHNldEludGVydmFsKGxvYWRDaGF0TG9ncywgMjAwMCk7CgkgICB9KTsKCiAgIH0KCiAgIGlmICh0eXBlb2YgY2hhdGJveCAhPT0gJ3VuZGVmaW5lZCcpIHsKCgkgICBpZiAoY2hhdGJveC50ZW1wbGF0ZSAmJiBjaGF0Ym94LmVsZW1lbnRzKQoJCSAgIGdlbmVyYXRlVGVtcGxhdGUoKTsKCgkgICB2YXIgY2JFbGVtZW50cyA9IHt9OwoJICAgZm9yIChsZXQgaXRlbSBpbiBjaGF0Ym94LmVsZW1lbnRzKSB7CgkJICAgaWYgKCFjaGF0Ym94LmVsZW1lbnRzW2l0ZW1dKSBjb250aW51ZTsKCQkgICBjYkVsZW1lbnRzW2l0ZW1dID0gZG9jdW1lbnQucXVlcnlTZWxlY3RvcihjaGF0Ym94LmVsZW1lbnRzW2l0ZW1dKTsKCSAgIH0KCgkgICBpZiAoY2JFbGVtZW50cy5yb290ICYmIGNiRWxlbWVudHMubG9nKSB7CgkJICAgY2JFbGVtZW50cy5yb290LmFkZEV2ZW50TGlzdGVuZXIoJ2NsaWNrJywgcmVtb3ZlQ2hhdE1lc3NhZ2UpOwoJCSAgIGxvYWRDaGF0TG9ncygpOwoJCSAgIHNldEludGVydmFsKGxvYWRDaGF0TG9ncywgMjAwMCk7CgkJICAgLy9zZXRJbnRlcnZhbCgoKSA9PiBsYXN0TWVzc2FnZVRpbWVzdGFtcCA9IDAsIDEwMDAwMCk7CgkgICB9CgoJICAgaWYgKGNiRWxlbWVudHMucm9vdCAmJiBjYkVsZW1lbnRzLmZvcm0gJiYgY2JFbGVtZW50cy5pbnB1dCkgewoJCSAgIGNiRWxlbWVudHMuZm9ybS5hZGRFdmVudExpc3RlbmVyKCdzdWJtaXQnLCBpbnB1dENoYXQpOwoJICAgfQoKICAgfQoKfX0p"));
			Session::flash('admin_templates', $language->get('admin', 'successfully_updated'));
		}
		if (isset($_POST['CHATBOX_EFIX']) && $_POST['CHATBOX_EFIX'] == 1) {
			$DB_QUERY = DB::getInstance();
			$table = Config::get('mysql/prefix') . "chat_logs";
			$sql = "ALTER TABLE `{$table}` CHANGE `message_content` `message_content` VARCHAR(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL";
			if(!$DB_QUERY->createQuery($sql)->error()) {
				Session::flash('admin_templates', $language->get('admin', 'successfully_updated'));
			}
		}
		if (isset($_POST['GENERAL_S'])) {
			$errors = array();
			if (Token::check()) {
				$validate = new Validate();
				$validation = $validate->check($_POST, array(
					'SITE_DESCRIPTION' => array(
						'required' => true
					),
					'SITE_FAVICON' => array(
						'required' => true
					),
					'SITE_COLOR' => array(
						'required' => true
					),
				));

				if ($validation->passed()) {
					$cache->setCache('RUBY_SETTINGS');
					$cache->store('GENERAL', array(
						'DESCRIPTION' => $_POST['SITE_DESCRIPTION'],
						'FAVICON' => $_POST['SITE_FAVICON'],
						'COLOR' => $_POST['SITE_COLOR'],
					));
					Session::flash('admin_templates', $language->get('admin', 'successfully_updated'));
				} else {
					$errors[] = $language->get('errors', 'fatal_error_title');
				}
			}

		}
		if (isset($_POST['STYLE_GENERAL'])){
			$validate = new Validate();
			$validation = $validate->check($_POST, array(
				'WIDGET_LAYOUT' => array(
					'required' => true
				),
				'WIDGET_COLOR' => array(
					'required' => true
				),
				'BGPRIMARY' => array(
					'required' => true
				),
				'BGLIGHT' => array(
					'required' => true
				),
				'BGDARK' => array(
					'required' => true
				),
				'BGSUCCESS' => array(
					'required' => true
				),
				'BGINFO' => array(
					'required' => true
				),
				'BGWARNING' => array(
					'required' => true
				),
				'BGDANGER' => array(
					'required' => true
				),
			));
			if ($validation->passed()) {
				$cache->setCache('RUBY_SETTINGS');
				$cache->store('WIDGET_S', array(
					'LAYOUT' 	=> $_POST['WIDGET_LAYOUT'],
					'COLOR' 	=> $_POST['WIDGET_COLOR'],
				));
				$cache->store('G_COLORS', array(
					'PRIMARY' 	=> $_POST['BGPRIMARY'],
					'LIGHT' 	=> $_POST['BGLIGHT'],
					'DARK' 		=> $_POST['BGDARK'],
					'SUCCESS' 	=> $_POST['BGSUCCESS'],
					'INFO' 		=> $_POST['BGINFO'],
					'WARNING' 	=> $_POST['BGWARNING'],
					'DANGER' 	=> $_POST['BGDANGER'],
				));
				Session::flash('admin_templates', $language->get('admin', 'successfully_updated'));
			} else {
				$errors[] = $language->get('errors', 'fatal_error_title');
			}
		}
		if (isset($_POST['THEME_LIGHT'])){
			$cache->setCache('RUBY_SETTINGS');
			$cache->store('THEME_LIGHT', array(
				//Background
				'BBODY' 	=> $_POST['BBODY'],
				'BCARD' 	=> $_POST['BCARD'],
				'BCALLOUT' 		=> $_POST['BCALLOUT'],
				'BNAVBAR' 	=> $_POST['BNAVBAR'],
				'BSIDEBAR' 		=> $_POST['BSIDEBAR'],
				'BDROPDOWN' 	=> $_POST['BDROPDOWN'],
				'BDROPDOWNH' 	=> $_POST['BDROPDOWNH'],
				'BFOOTER' 	=> $_POST['BFOOTER'],
				'BINPUTS' 	=> $_POST['BINPUTS'],
				//Text Colors
				'CBODY' 	=> $_POST['CBODY'],
				'CCARD' 	=> $_POST['CCARD'],
				'CCALLOUT' 		=> $_POST['CCALLOUT'],
				'CNAVBAR' 	=> $_POST['CNAVBAR'],
				'CSIDEBAR' 		=> $_POST['CSIDEBAR'],
				'CSIDEBARH' 		=> $_POST['CSIDEBARH'],
				'CDROPDOWN' 	=> $_POST['CDROPDOWN'],
				'CDROPDOWNH' 	=> $_POST['CDROPDOWNH'],
				'CFOOTER' 	=> $_POST['CFOOTER'],
				'CINPUTS' 	=> $_POST['CINPUTS'],
				'CLALERT' 	=> $_POST['CLALERT'],
				'CDALERT' 	=> $_POST['CDALERT'],
				'CINPUTS' 	=> $_POST['CINPUTS'],
			));
			Session::flash('admin_templates', $language->get('admin', 'successfully_updated'));
		}
		if (isset($_POST['THEME_DARK'])){
			$cache->setCache('RUBY_SETTINGS');
			$cache->store('THEME_DARK', array(
				//Background
				'BBODY' 	=> $_POST['BBODY'],
				'BCARD' 	=> $_POST['BCARD'],
				'BCALLOUT' 		=> $_POST['BCALLOUT'],
				'BNAVBAR' 	=> $_POST['BNAVBAR'],
				'BSIDEBAR' 		=> $_POST['BSIDEBAR'],
				'BDROPDOWN' 	=> $_POST['BDROPDOWN'],
				'BDROPDOWNH' 	=> $_POST['BDROPDOWNH'],
				'BFOOTER' 	=> $_POST['BFOOTER'],
				'BINPUTS' 	=> $_POST['BINPUTS'],
				//Text Colors
				'CBODY' 	=> $_POST['CBODY'],
				'CCARD' 	=> $_POST['CCARD'],
				'CCALLOUT' 		=> $_POST['CCALLOUT'],
				'CNAVBAR' 	=> $_POST['CNAVBAR'],
				'CSIDEBAR' 		=> $_POST['CSIDEBAR'],
				'CSIDEBARH' 		=> $_POST['CSIDEBARH'],
				'CDROPDOWN' 	=> $_POST['CDROPDOWN'],
				'CDROPDOWNH' 	=> $_POST['CDROPDOWNH'],
				'CFOOTER' 	=> $_POST['CFOOTER'],
				'CINPUTS' 	=> $_POST['CINPUTS'],
				'CLALERT' 	=> $_POST['CLALERT'],
				'CDALERT' 	=> $_POST['CDALERT'],
				'CINPUTS' 	=> $_POST['CINPUTS'],
			));
			Session::flash('admin_templates', $language->get('admin', 'successfully_updated'));
		}
		if (isset($_POST['GENERATE_JSON'])) {
			$cache->setCache('RUBY_SETTINGS');
			$GENERAL_SETTINGS 	= $cache->retrieve('GENERAL');
			$COLORS_SETTINGS 	= $cache->retrieve('G_COLORS');
			$WIDGET_SETTINGS 	= $cache->retrieve('WIDGET_S');
			$THEME_LIGHT_SET	= $cache->retrieve('THEME_LIGHT');
			$THEME_DARK_SET		= $cache->retrieve('THEME_DARK');

			$code = json_encode(array(
				'GENERAL' 	=> $GENERAL_SETTINGS,
				'WIDGETS' 	=> $WIDGET_SETTINGS,
				'COLORS' 	=> array(
					'GENERAL' 	=> $COLORS_SETTINGS,
					'LIGHT' 	=> $THEME_LIGHT_SET,
					'DARK' 		=> $THEME_DARK_SET,
				),
			), JSON_PRETTY_PRINT);
		}
	} else
		$errors = array($language->get('general', 'invalid_token'));
}
 
Module::loadPage($user, $pages, $cache, $smarty, array($navigation, $cc_nav, $mod_nav), $widgets, $template);


if (Session::exists('admin_templates'))
    $smarty->assign(array(
        'SUCCESS' => Session::flash('admin_templates'),
        'SUCCESS_TITLE' => $language->get('general', 'success')
    ));
if (isset($errors) && count($errors))
    $smarty->assign(array(
        'ERRORS' => $errors,
        'ERRORS_TITLE' => $language->get('general', 'error')
    ));
$cache->setCache('RUBY_SETTINGS');
$GENERAL_SETTINGS 	= $cache->retrieve('GENERAL');
$COLORS_SETTINGS 	= $cache->retrieve('G_COLORS');
$WIDGET_SETTINGS 	= $cache->retrieve('WIDGET_S');
$THEME_LIGHT_SET	= $cache->retrieve('THEME_LIGHT');
$THEME_DARK_SET		= $cache->retrieve('THEME_DARK');
	// 'LAYOUT' COLOR'
$smarty->assign('VALUES', array(
	'GENERAL' => $GENERAL_SETTINGS,
	'COLORS' => $COLORS_SETTINGS,
	'WIDGETS' => $WIDGET_SETTINGS,
	"THEMES" => array(
		'LIGHT' => $THEME_LIGHT_SET,
		'DARK' => $THEME_DARK_SET,
	)
));
if(Input::exists()){
	if(Token::check()){
		$DATA = "/* No Edit */
		:root {
			--bg-primary: {$COLORS_SETTINGS['PRIMARY']};
			--bg-light: {$COLORS_SETTINGS['LIGHT']};
			--bg-dark: {$COLORS_SETTINGS['DARK']};
			--bg-success: {$COLORS_SETTINGS['SUCCESS']};
			--bg-info: {$COLORS_SETTINGS['INFO']};
			--bg-warning: {$COLORS_SETTINGS['WARNING']};
			--bg-danger: {$COLORS_SETTINGS['DANGER']};
		}
		html[mode=\"light\"] {
			--body-bg: {$THEME_LIGHT_SET['BBODY']};
			--card-bg: {$THEME_LIGHT_SET['BCARD']};
			--callout-bg: {$THEME_LIGHT_SET['BCALLOUT']};
			--navbar-bg: {$THEME_LIGHT_SET['BNAVBAR']};
			--sidebar-bg: {$THEME_LIGHT_SET['BSIDEBAR']};
			--dropdown-bg: {$THEME_LIGHT_SET['BDROPDOWN']};
			--dropdown-bg-h: var(--bg-primary);
			--footer-bg: {$THEME_LIGHT_SET['BFOOTER']};
			--form-bg: {$THEME_LIGHT_SET['BINPUTS']};
			/* --separador: #xd; */
			--body-c: {$THEME_LIGHT_SET['CBODY']};
			--card-c: {$THEME_LIGHT_SET['CCARD']};
			--callout-c: {$THEME_LIGHT_SET['CCALLOUT']};
			--navbar-c: {$THEME_LIGHT_SET['CNAVBAR']};
			--sidebar-c: {$THEME_LIGHT_SET['CSIDEBAR']};
			--sidebar-c-h: {$THEME_LIGHT_SET['CSIDEBARH']};
			--dropdown-c: {$THEME_LIGHT_SET['CDROPDOWN']};
			--dropdown-c-h: {$THEME_LIGHT_SET['CDROPDOWNH']};
			--light-alerts: {$THEME_LIGHT_SET['CLALERT']};
			--darks-alerts: {$THEME_LIGHT_SET['CDALERT']};
			--form-c: {$THEME_LIGHT_SET['CINPUTS']};
			--footer-c: {$THEME_LIGHT_SET['CFOOTER']};
		}
		html[mode=\"dark\"] {
			--body-bg: {$THEME_DARK_SET['BBODY']};
			--card-bg: {$THEME_DARK_SET['BCARD']};
			--callout-bg: {$THEME_DARK_SET['BCALLOUT']};
			--navbar-bg: {$THEME_DARK_SET['BNAVBAR']};
			--sidebar-bg: {$THEME_DARK_SET['BSIDEBAR']};
			--dropdown-bg: {$THEME_DARK_SET['BDROPDOWN']};
			--dropdown-bg-h: var(--bg-primary);
			--footer-bg: {$THEME_DARK_SET['BFOOTER']};
			--form-bg: {$THEME_DARK_SET['BINPUTS']};
			/* --separador: #xd; */
			--body-c: {$THEME_DARK_SET['CBODY']};
			--card-c: {$THEME_DARK_SET['CCARD']};
			--callout-c: {$THEME_DARK_SET['CCALLOUT']};
			--navbar-c: {$THEME_DARK_SET['CNAVBAR']};
			--sidebar-c: {$THEME_DARK_SET['CSIDEBAR']};
			--sidebar-c-h: {$THEME_DARK_SET['CSIDEBARH']};
			--dropdown-c: {$THEME_DARK_SET['CDROPDOWN']};
			--dropdown-c-h: {$THEME_DARK_SET['CDROPDOWNH']};
			--light-alerts: {$THEME_DARK_SET['CLALERT']};
			--darks-alerts: {$THEME_DARK_SET['CDALERT']};
			--form-c: {$THEME_DARK_SET['CINPUTS']};
			--footer-c: {$THEME_DARK_SET['CFOOTER']};
		}
		";
		file_put_contents(ROOT_PATH . '/custom/templates/Ruby/assets/css/colors.css', $DATA);
	}
}

$smarty->assign(array(
	'CODE' => (isset($code)) ? $code : '',
    'PAGE' => PANEL_PAGE,
    'PARENT_PAGE' => PARENT_PAGE,
    'DASHBOARD' => $language->get('admin', 'dashboard'),
    'CONFIGURATION' => $language->get('admin', 'configuration'),
    'TOKEN' => Token::get(),
    'SUBMIT' => $language->get('general', 'submit'),
	'LOADING' => $language->get('general', 'loading'),
	'BROWSE' => $language->get('general', "browse"),
    'BACK' => $language->get('general', 'back'),
	'BACK_LINK' => URL::build('/panel/core/templates'),
	'CONFIG_URL' => URL::build('/panel/core/general_settings/'),

	'TEMPLATE_INFO' => array(
		'NAME' => $Ruby_template->getName(),
		'Version' => $Ruby_template->getVersion(),
		"PATH" => Config::get('core/path') . '/custom/templates/'. $Ruby_template->getName(),
	),
	"LANG" => array(
		'ADMIN' => array(
			"name" => $language->get('admin', 'sitename'),
			"desc" => $language->get('admin', 'description'),
		),
		"GENERAL" => array(
			'BROWSE' => $language->get('general', "browse")
		)
	)
));


// print_r($_POST);

$page_load = microtime(true) - $start;
define('PAGE_LOAD_TIME', str_replace('{x}', round($page_load, 3), $language->get('general', 'page_loaded_in')));

$template->onPageLoad();

require(ROOT_PATH . '/core/templates/panel_navbar.php');

$template->displayTemplate(ROOT_PATH . '/custom/templates/Ruby/template_settings/settings.tpl', $smarty);
//Stop Process
die();