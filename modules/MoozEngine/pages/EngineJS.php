<?php

#    /*
    header("Content-Type: application/javascript; charset=UTF-8");
    header("Software: NamelessMC;");
    header("Script: Mooz-Engine/1.0;");
    if (!isset($_SERVER['HTTP_REFERER']) || $GLOBALS['config']['core']['hostname'] != $_SERVER['HTTP_HOST']) {
        die('console.log("Mooz Engine No Work in '. $_SERVER['HTTP_HOST'].', contact to zJerino!")');
    }
    echo "console.debug('Iniciando Engine')\n";
    echo "document.body.appendChild(document.createElement('MoozEngine'))\n";

    echo "//ERRORS SET IN 0\n";
    echo "var MoozErrors = 0;\n";


    echo "var FRONTEND_CON = {}; \n";
    
    $DEFINIR = array(
        "SITE_NAME"     => SITE_NAME,
        "SITE_HOME"     => URL::Build('/'), 
        "SITE_HOMEFULL"     => Util::getSelfURL() . ltrim(URL::build('/'), '/'),
    );
    foreach ($DEFINIR as $key => $value) {
        echo "FRONTEND_CON['{$key}'] = '$value';\n";
    }
    $DEFINIR = array(
        "USER_DEFINEDS" => array(
            'INFO' => array(
                "NAME" => $user->getDisplayname(true),
            ),
            "LOGGED" => ($user->isLoggedIn() ? '1' : '0'),
            'PMS' => array(
                "NO" => $language->get('user', 'no_messages'),
                "1" => $language->get('user', '1_new_message'),
                "X" => $language->get('user', 'x_new_messages'),
            ),
            'ALERTS' => array(
                "NO" => $language->get('user', 'no_alerts'),
                "1" => $language->get('user', '1_new_alert'),
                "X" => $language->get('user', 'x_new_alerts'),
            ),
            'COOKIE' => array(
                "NOTICE" => $language->get('general', 'cookie_notice'),
                "ENABLE" => (defined('COOKIE_NOTICE') ? '1' : '0'),
            ),
        ),
        "LANG" => array(
            "general" => array(
                "offline" => $MoozEngine['Lang']->get('general', 'OFFLINE'),
                "online" => $MoozEngine['Lang']->get('general', 'ONLINE'),
                "COPIADO" => $language->get('general', 'copied'),
            )
        )
    );
    foreach ($DEFINIR as $key => $value) {
        echo "FRONTEND_CON['{$key}'] = {}; \n";
        if (is_array($value)) {
            foreach ($value as $key2 => $value2) {
                if (is_array($value2)) {
                    echo "FRONTEND_CON['{$key}']['{$key2}'] = {}; \n";
                    foreach ($value2 as $key3 => $value3) {
                        echo "FRONTEND_CON['{$key}']['{$key2}']['$key3'] = '$value3'; \n";
                    }
                } else {
                    echo "FRONTEND_CON['{$key}']['{$key2}'] = '{$value2}';\n";
                }
                
            }
        } else {
            echo "var {$key} = {$value}; \n";
        }
        
    }
#   */
?>



//window.addEventListener('error', (ev) => {
//    console.log('[Mooz Engine] Se detecto una falla, vea la consola de depuracion');
//    console.debug(`[Mooz Engine] Se detecto un error. \nTITLE: ${ev.message}\nFILENAME: ${ev.filename}\nTYPE: ${ev.type}\nDate: ${Date()}`);
//    ev.preventDefault();
//})
function EmojiCh() {
    try {
        setInterval(() => {
            console.debug('Iniciando cambios');
            var elemento = document.querySelector('.content-wrapper');

            elemento.innerHTML = elemento.innerHTML.replaceAll(":D", '😀');
        elemento.innerHTML = elemento.innerHTML.replaceAll(":)", '🙂');
        elemento.innerHTML = elemento.innerHTML.replaceAll(":P", '😝');
        elemento.innerHTML = elemento.innerHTML.replaceAll(":b", '😛');
        elemento.innerHTML = elemento.innerHTML.replaceAll("._.", '😐');
        elemento.innerHTML = elemento.innerHTML.replaceAll(";)", '😅');
        elemento.innerHTML = elemento.innerHTML.replaceAll(";D", '😂');
        elemento.innerHTML = elemento.innerHTML.replaceAll(":(", '☹');
        elemento.innerHTML = elemento.innerHTML.replaceAll("D;", '😭');
        elemento.innerHTML = elemento.innerHTML.replaceAll(":u", '😙');
        elemento.innerHTML = elemento.innerHTML.replaceAll("O:)", '😇');
        elemento.innerHTML = elemento.innerHTML.replaceAll(":p", '😋');
        elemento.innerHTML = elemento.innerHTML.replaceAll("-_-", '😒');
        elemento.innerHTML = elemento.innerHTML.replaceAll("e.e", '😏');
        elemento.innerHTML = elemento.innerHTML.replaceAll(":o", '😮');
        elemento.innerHTML = elemento.innerHTML.replaceAll("D=", '😩');
        elemento.innerHTML = elemento.innerHTML.replaceAll("D=", '😩');
        elemento.innerHTML = elemento.innerHTML.replaceAll("Ohoo!", '👻');

        elemento.innerHTML = elemento.innerHTML.replaceAll(":love:", '😍');
        elemento.innerHTML = elemento.innerHTML.replaceAll(":aww:", '🤗');
        elemento.innerHTML = elemento.innerHTML.replaceAll(":4_eyes:", '🤓');
        elemento.innerHTML = elemento.innerHTML.replaceAll(":LOL:", '🤣');
        elemento.innerHTML = elemento.innerHTML.replaceAll(":LMAO:", '😆');
        elemento.innerHTML = elemento.innerHTML.replaceAll("zJerino", 'NamelessMC');
        }, 5000);
    } catch (error) {
        console.debug('Ocurrio un error al intentar Cambiar caracteres a Emoji\'s');
        console.debug(error);
    }
}
//EmojiCh();
function BackItem01(type = null) {
    switch (type) {
        case "h":
            var result = window.document.body.clientHeight;
            break;
        case "w":
            var result = window.document.body.clientWidth;
            break;
        default:
            var result = [window.document.body.clientHeight,  window.document.body.clientWidth];
            break; 
    }
    return result;
}
function BackItem02() {
    var divicewidth = BackItem01("w");
    if (divicewidth <= 320) {
        return "sm";
    } else if (divicewidth <= 425) {
        return "mm";
    } else if (divicewidth <= 976) {
        return "T";
    } else if (divicewidth <= 1024) {
        return "sl";
    } else if (divicewidth <= 1440) {
        return "ll";
    } else {
        return "othrs";
    }
}





/* Toastr Setup */
if (toastr.version) {
    var divicewidth = BackItem02();
    if (divicewidth == "ms" || divicewidth == "mm" || divicewidth == "T") {
        var ToastPosition = "toast-bottom-center";
    } else {
        var ToastPosition = "toast-bottom-left";
    }
    toastr.options = {
        tapToDismiss: !0,
        toastClass: "toast",
        containerId: "toast-container",
        debug: !1,
        showMethod: "fadeIn",
        showDuration: 300,
        showEasing: "swing",
        onShown: void 0,
        hideMethod: "fadeOut",
        hideDuration: 1e3,
        hideEasing: "swing",
        onHidden: void 0,
        closeMethod: !1,
        closeDuration: !1,
        closeEasing: !1,
        closeOnHover: !0,
        extendedTimeOut: 1e3,
        positionClass: ToastPosition,
        timeOut: 5e3,
        titleClass: "toast-title",
        messageClass: "toast-message",
        escapeHtml: !1,
        target: "body",
        closeHtml: '<button type="button">&times;</button>',
        closeClass: "toast-close-button",
        newestOnTop: !0,
        preventDuplicates: !1,
        progressBar: !1,
        progressClass: "toast-progress",
        rtl: !1
    }
}


function URLBuild(path, full = false) {
    return (full ? FRONTEND_CON['SITE_HOMEFULL'] : FRONTEND_CON['SITE_HOME']) + path;
}


setInterval(async () => {
    //r console.debug('Comprobando conexion del usuario');
    function aBX(funar) {
        if (funar == true) {
            if (document.body.querySelectorAll('OfflineCape').length > 0) {
                document.body.querySelector('OfflineCape').remove();
                toastr.success(FRONTEND_CON.LANG.general.online);
            }
    //r        console.debug('El usuario esta online');
        } else if (funar == false){
            if (document.body.querySelectorAll('OfflineCape').length <= 0) {
                document.body.appendChild(document.createElement('OfflineCape'));
                document.body.querySelector('OfflineCape').appendChild(document.createElement('Offline-icon')).innerHTML = "<i class='Gicon gi-signal_wifi_off_48px text-danger'></i>";
                document.body.querySelector('OfflineCape').appendChild(document.createElement('Offline-text')).innerHTML = "<h5 class='text-danger'>"+FRONTEND_CON.LANG.general.offline+"</h5>";
                document.body.querySelector('OfflineCape').addEventListener('click', (a) => {
                    document.body.querySelector('OfflineCape').setAttribute('clicked', "OK");
                    setTimeout(() => {
                        document.body.querySelector('OfflineCape').setAttribute('clicked', "quit");
                        
                    }, 1100);
                });
            }
    //r        console.debug('El usuario esta offline');
        }
    }
    $.ajax("<?php echo URL::build('/Conexion'); ?>")
    .then((reqsa) => {
        aBX(true); 
    }).catch((reqsa) => {
        //console.log(reqsa)
        aBX(false); 
    });
}, 15000);






<?php
    if (isset($OPTIONSENGINE['FIX_SILDER'])) {
    ?>
        document.addEventListener("turbolinks:load", () => {
            var PushMenuA = new adminlte.PushMenu($("#flojo"), {});
            document.querySelector("#sidebar-overlay").addEventListener("click", () => {
                PushMenuA.toggle();
            });
            document.querySelector("[sidebar-toggle]").addEventListener("click", () => {
                PushMenuA.toggle();
            });
        })
    <?php
    } else {
        die('console.debug("Mooz Engine finish!")');
    }
?>




console.log('MoozEngine[v1] Loading');
if (jQuery()) {
    if (toastr) {
        toastr.options = {
            tapToDismiss: !0,
            toastClass: "toast",
            containerId: "toast-container",
            debug: !1,
            showMethod: "fadeIn",
            showDuration: 300,
            showEasing: "swing",
            onShown: void 0,
            hideMethod: "fadeOut",
            hideDuration: 1e3,
            hideEasing: "swing",
            onHidden: void 0,
            closeMethod: !1,
            closeDuration: !1,
            closeEasing: !1,
            closeOnHover: !0,
            extendedTimeOut: 1e3,
            positionClass: "toast-bottom-left",
            timeOut: 5e3,
            titleClass: "toast-title",
            messageClass: "toast-message",
            escapeHtml: !1,
            target: "body",
            closeHtml: '<button type="button">&times;</button>',
            closeClass: "toast-close-button",
            newestOnTop: !0,
            preventDuplicates: !1,
            progressBar: !1,
            progressClass: "toast-progress",
            rtl: !1
        }
    }
    try {
        if (Turbolinks) {
            
        }
    } catch (error) {
        toastr.error('TURBOLINKS NO LOAD', "ERROR F#001", {
            timeOut: 0,
        });
        console.debug('TurboLinks no ha sido cargado');
    }

    
    if (USER_DIFINEDS.LOGGED == 1) {
        var countPms = 0 , countAlerts = 0;
        function updateAlerts(e) {
            console.log('Hola');
        }
        function notifyAlerts(e) {
            
        }
        function updatePMs(e) {
            
        }
        function notifyPMs(e) {
            
        }
        $(document).ready(function() {
            Notification && "granted" !== Notification.permission && Notification.requestPermission(),
            $.getJSON(URLBuild("queries/alerts"), function(e) {
                updateAlerts(e)
            }),
            $.getJSON(URLBuild("queries/pms"), function(e) {
                updatePMs(e)
            }),
            window.setInterval(function() {
                $.getJSON(URLBuild("queries/alerts"), function(e) {
                    countAlerts < e.value && notifyAlerts(e),
                    updateAlerts(e)
                }),
                $.getJSON(URLBuild("queries/pms"), function(e) {
                    countPms < e.value && notifyPMs(e),
                    updatePMs(e)
                })
            }, 1e5)
        })

    }

} else {
    console.error('MoozEngine Requiere jQuery para poder Funcionar correctamente!!!');
}


if (MoozErrors >= 1) {
    console.debug('MoozEngine[v1] Encontro algunos errores');
} else {
    console.debug('MoozEngine[v1] Fue cargado sin errores');
    console.log('#===========================================# \n           MoozEngineV1 Beta As load \n#===========================================#');
}