<?php header("Content-type: application/json; charset: UTF-8"); require_once(ROOT_PATH . '/core/templates/frontend_init.php'); $cache->setCache('RUBY_SETTINGS'); $GENERAL_SETTINGS = $cache->retrieve('GENERAL'); ?>
{
  "short_name": "<?php echo SITE_NAME; ?>",
  "name": "<?php echo SITE_NAME; ?>",
  "icons": [
    {
      "src": "<?php echo $GENERAL_SETTINGS['FAVICON']; ?>",
      "sizes": "640x640"
    }
  ],
  "start_url": "<?php echo URL::build('/'); ?>",
  "display": "standalone",
  "theme_color": "<?php echo $GENERAL_SETTINGS['COLOR']; ?>",
  "background_color": "#ffffff"
}
