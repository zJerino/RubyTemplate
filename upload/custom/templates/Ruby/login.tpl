<html lang="en" mode style="height: auto;">
    <head>
        <script>
            if (localStorage.getItem('theme') === "dark") {
                document.querySelector('Html').setAttribute('mode', 'dark');
            } else if (localStorage.getItem('theme') === "light") {
                document.querySelector('Html').setAttribute('mode', 'light');
            } else {
                document.querySelector('Html').setAttribute('mode', 'light');
                localStorage.setItem('theme', "light");
            }
            function ChangeMode() {
                if (document.querySelector('Html').getAttribute('mode') == "light") {
                    document.querySelector('Html').setAttribute('mode', 'dark');
                    localStorage.setItem('theme', "dark");
                } else {
                    document.querySelector('Html').setAttribute('mode', 'light');
                    localStorage.setItem('theme', "light");
                }
            }
        </script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
          
        <title>{$TITLE} &bull; {$SITE_NAME}</title>
        <script src="{$TEMPLATE_PATH}/assets/js/turbolinks.js"></script>
        <script src="{$TEMPLATE_PATH}/assets/js/RubyTemplate.js"></script>

        <meta name="turbolinks-cache-control" content="no-cache">
        <meta name="turbolinks-cache-control" content="no-cache">

        {foreach from=$TEMPLATE_CSS item=css}
            {$css}
        {/foreach}
    </head>
<body class="hold-transition register-page">
<div class="register-box">
	{if isset($REGISTRATION_ERROR)}
	  	<div class="callout callout-danger">
	  		{foreach from=$REGISTRATION_ERROR item=error}
				{$error}<br />
		  	{/foreach}
	  	</div>
	{/if}
  <div class="register-logo">
    <a href="{$SITE_HOME}" style="display: flex;align-items: center;width: 100%;justify-content: center;"><b>{$SITE_NAME}</b><i class="fa fa-plus" style="font-size: 0.5em;"></i></a>
  </div>
  <div class="card">
    <div class="card-body register-card-body">
        
		
		
        <form role="form" action="" method="post" id="form-login">
            {if (isset($EMAIL))}
                <div class="form-group">
                    <label for="email">{$EMAIL}</label>
                    <input type="email"  autocomplete="email" class="form-control" id="email" name="email" placeholder="{$EMAIL}" value="{$USERNAME_INPUT}">
                </div>
            {else}
                <div class="form-group">
                    <label for="email">{$USERNAME}</label>
                    <input type="text" autocomplete="username" class="form-control" id="username" name="username" placeholder="{$USERNAME}" value="{$USERNAME_INPUT}">
                </div>
            {/if}
            <div class="form-group">
                <label for="password">{$PASSWORD}</label>
                <input type="password" class="form-control" id="password" name="password" autocomplete="current-password" placeholder="{$PASSWORD}">
            </div>
            <div class="form-check">
                <input type="checkbox" class="form-check-input" name="remember" id="remember" value="1" >
                <label class="form-check-label" for="remember">{$REMEMBER_ME}</label>
            </div>
            {if isset($RECAPTCHA)}
                <div class="form-group">
                    <div class="{$CAPTCHA_CLASS}" data-sitekey="{$RECAPTCHA}" tabindex="4"></div>
                </div>
            {/if}
            <hr class="w-100">
            <input type="hidden" name="token" value="{$FORM_TOKEN}">
            <a class="btn btn-primary btn-block text-light" id="clicklogin" onclick="Login()">{$SIGN_IN}</a>
            <hr class="w-100">
            <a href="{$FORGOT_PASSWORD_URL}" class="btn btn-danger btn-block">{$FORGOT_PASSWORD}</a>
            <a href="{$REGISTER_URL}" class="btn btn-primary btn-block">{$NOT_REGISTERED_YET}</a>
        </form>

        
        <li class="nav-item list-unstyled btn-changer">
            <a class="nav-link" role="button" style="display: flex;align-items: center;justify-content: center;"><i class="fa fa-mode"></i></a>
        </li>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<all-js>
    
    <script>
        function Login() {
            document.querySelector('#clicklogin').classList.add('disabled');
            $.ajax({
                url: "{$SITE_JOME}logout/"
            })
                $.ajax({
                    url: "{$SITE_JOME}login/",
                    type: "POST",
                    dataType: "form",
                    data: {
                        token: $('[name="token"]')[0].value,
                        {if (isset($EMAIL))}
                            email: $('[name="email"]')[0].value,
                        {else}
                            username: $('[name="username"]')[0].value,
                        {/if}
                        password: $('[name="password"]')[0].value,
                        remember: $('[name="remember"]')[0].value,
                        ajax: "true",
                    },
                    success: 'OK',
                }).catch((req) => {
                        document.querySelector('#clicklogin').innerHTML = "{$LOADING}";
                        try {
                            var res = JSON.parse(req.responseText);
                        } catch (error) {
                            document.querySelector('#clicklogin').classList.replace('btn-primary', 'btn-warning');
                            document.querySelector('#clicklogin').innerHTML = "<i class='far fa-clock'></i>";
                            $('#form-login').submit();
                        }
                        if (res.approved == "true") {
                            document.querySelector('#clicklogin').classList.replace('btn-primary', 'btn-success');
                            document.querySelector('#clicklogin').innerHTML = "<i class='fa fa-check'></i>";
                            toastr.success(res.message);
                            setTimeout(() => {
                                Turbolinks.visit(res.url, {})
                            }, 2500)
                        } else {
                            document.querySelector('#clicklogin').classList.replace('btn-primary', 'btn-danger');
                            document.querySelector('#clicklogin').innerHTML = "<i class='fa fa-times'></i>";
                            toastr.error(res.message);
                            setTimeout(() => {
                                document.querySelector('#clicklogin').classList.replace('btn-danger', 'btn-primary');
                                document.querySelector('#clicklogin').innerHTML = "{$SIGN_IN}";
                                setTimeout(() => {
                                    document.querySelector('#clicklogin').classList.remove('disabled');
                                }, 2500)
                            }, 2500)
                    }
                })
        }
    </script>
	{foreach from=$TEMPLATE_JS item=script}
		{$script}
	{/foreach}
</all-js>
</body>
</html>
