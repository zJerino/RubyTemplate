<?php
/**
 *	NamelessMC v2 pre8 || By Sametron
 *	Mooz Engine Made by zJerino
 *
**/

// Credits in Response Headers
header("Software: NamelessMC;");
header("Mooz-Engine: 1.0;");

$MoozEngine['Lang'] = new Language(__DIR__ . '/language', LANGUAGE);

include_once('module.php');
$module = new MoozEngine($language, $pages, $queries, $cache, $template);