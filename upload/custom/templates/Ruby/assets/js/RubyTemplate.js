document.addEventListener('Cargado', (a) => {
    console.log('LOG')
    document.addEventListener('turbolinks:load', (a) => {
        console.debug('OK');
        if (document.querySelector('[sidebar-toggle]')) {
            
            document.querySelector('[sidebar-toggle]').addEventListener('click', (asd) => {
                $('[sidebar-toggle]').toggleClass('desaparecer');
            })
            document.querySelector('#sidebar-overlay').addEventListener('click', (asd) => {
                $('[sidebar-toggle]').toggleClass('desaparecer');
            })
            window.dispatchEvent(new Event('resize'));
            var ready = false;
        }        
    })

    console.log('Iniciando RubyTemplateJS');
    var RubyErr = 0;    

    if (FRONTEND_CON.USER_DEFINEDS.LOGGED == 1) {   
            var countPms = 0 , countAlerts = 0;
            function updateAlerts(e) {
                console.debug('Actualizando Alerts');
                if (e.value > 0) {
                    document.querySelector("#alerts-icon").setAttribute('Notify', "true");
                    var alertlist = [];
                    e.alerts.forEach(element => {
                        alertlist.push(`<a class="dropdown-item" href="${URLBuild('user/alerts/?view='+element.id)}">${element.content}</a>`);
                    });
                    $("#DropALERTS").html(alertlist.toString().replaceAll(',', "\n"));
                } else {
                    $("#DropALERTS").html(`<div class="dropdown-item disabled text-center"> ${FRONTEND_CON.USER_DEFINEDS.ALERTS.NO} </div>`);
                }
                
            }
            function updatePMs(e) {
                console.debug('Actualizando PMS');
                if (e.value > 0) {
                    document.querySelector("#pms-icon").setAttribute('Notify', "true");
                    var pmslist = [];
                    e.pms.forEach(element => {
                        $.getJSON(URLBuild("queries/user?id=" + element.author_id), function(user) {
                            pmslist.push(`<a href="${URLBuild('user/messaging/?action=view&amp;message='+element.id)}" class="dropdown-item">\n<div class="media">\n<img src="${user.avatar}" alt="${user.username}" class="img-size-32 img-circle mr-3">\n<div class="media-body">\n<h3 class="dropdown-item-title">\n${element.title}\n</h3>\n<p class="text-sm">${user.username}</p>\n</div>\n</div>\n</a>`);
                        });
                    });
                    setTimeout(() => {
                        document.body.querySelector("#DropPMS").innerHTML = pmslist.toString().replaceAll(',', '');
                    }, 5000);
                } else {
                    $("#DropPMS").html(`<div class="dropdown-item disabled text-center"> ${FRONTEND_CON.USER_DEFINEDS.PMS.NO} </div>`);
                }
            }
            function notifyPMs(data) {
                if (data.value > 0) {
                    if (data.value == 1) {
                        toastr.options.onclick = function () {redirect(URLBuild('user/messaging'))};
                        toastr.info(FRONTEND_CON.USER_DEFINEDS.PMS["1"]);
                    } else {
                        toastr.options.onclick = function () {redirect(URLBuild('user/messaging'))};
                        toastr.info(FRONTEND_CON.USER_DEFINEDS.PMS["X"].replace("{x}", data.value));
                    }
                    countPms = data.value;
                }
            }
            var lastnoti = 0;
            function notifyAlerts(data) {
                if (data.value > 0) {
                    if (data.value == 1) {
                        toastr.options.onclick = function () {redirect(URLBuild('user/alerts'))};
                        toastr.info(FRONTEND_CON.USER_DEFINEDS.ALERTS["1"]);
                        
                    } else {
                        toastr.options.onclick = function () {redirect(URLBuild('user/alerts'))};
                        toastr.info(FRONTEND_CON.USER_DEFINEDS.ALERTS["X"].replace("{x}", data.value));
                    }
                    countAlerts = data.value;
                }
            }
            toastr.clear();
            $.getJSON(URLBuild("queries/alerts"), function(e) {
                updateAlerts(e)
            }),
            $.getJSON(URLBuild("queries/pms"), function(e) {
                updatePMs(e)
            }),
                
            window.setInterval(function() {
                toastr.clear();
                $.getJSON(URLBuild("queries/alerts"), function(e) {
                    countAlerts < e.value && notifyAlerts(e),
                    updateAlerts(e)
                }),
                $.getJSON(URLBuild("queries/pms"), function(e) {
                    countPms < e.value && notifyPMs(e),
                    updatePMs(e)
                })
            }, 10000)
    } else if (FRONTEND_CON.USER_DEFINEDS.COOKIE['ENABLE'] == 1){
        toastr.info(FRONTEND_CON.USER_DEFINEDS.COOKIE['NOTICE'], "", {
            onHidden: () => $.cookie('accept', 'accepted', {path: '/'}),
            onclick: () => $('.toast .toast-close-button').focus(),
            timeOut: 0,
        });
    }

    console.log(`Se ah finalizado la lectura de RubyTemplateJS con ${RubyErr} errores`);
});
document.addEventListener('turbolinks:load', () => {
    document.querySelector('.fa-mode').addEventListener('click', () => {
        ChangeMode()
    })
    if (document.body.clientWidth <= 280) {
        toastr.error('ERROR#F03')
    }
    console.log('Hello')

    
    function ScrollChido(params) {
        var scrollp = document.body.scrollTop;
        if (scrollp >= 150) {
            $('html>body').addClass('scrolltop');
        } else {
            $('html>body').removeClass('scrolltop');
        }
    }
    document.querySelector('scroll-top').addEventListener('click', () => {
        $('body').animate({
            scrollTop: 0
            }, 1500)
    }) 
    
    $('html>body')[0].onscroll = (thiss) => {
        ScrollChido(thiss)
    }
});

function ready(params) {
    document.addEventListener('turbolinks:load', () => {
        params();
    });
}

function copy(element) {
    var $temp = $('<input>');
    $('body').append($temp);
    $temp.val($(element).text()).select();
    document.execCommand('copy');
    $temp.remove();
    toastr.success(FRONTEND_CON.LANG.general.COPIADO);
}