// <?php header("Content-type: text/javascript; charset: UTF-8"); require_once(ROOT_PATH . '/core/templates/frontend_init.php'); ?>
//
console.log('Worker')

self.addEventListener('install', event => {
  event.waitUntil(
    caches
      .open("<?php echo SITE_NAME; ?>")
      .then(cache =>
        cache.addAll([
            <?php
                $todos = $template->getCSS();
                foreach ($todos as $key => $value) {
                    if ($value >= "<style>") {} else {
                        echo "'".str_replace('">', "", str_replace('<link rel="stylesheet" href="', "", $value))."', 
            ";
                    }
                    
                }
                $todos = $template->getJS();
                foreach ($todos as $key => $value) {
                    if ($value >= '<script type="text/javascript">') {} else {
                        echo "'".str_replace('"></script>', "", str_replace('<script  type="text/javascript" src="', "", $value))."', 
            ";
                    }
                    
                }
            ?>
'/lucas1234'
        ])
      )
  )
})
self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request).then(response => {
      if (response) {
        console.log("¡encontramos los archivos en la cache!")
        return response
      }
      return fetch(event.request)
    })
  )
})