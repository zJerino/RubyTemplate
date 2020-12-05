<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>{$TITLE} - {$SITE_NAME}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="{$TEMPLATE_PATH}/assets/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="{$TEMPLATE_PATH}/assets/plugins/adminlte/css/adminlte.min.css">
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
		
		
	  	<h6 class="mb-3">
			{$CREATE_AN_ACCOUNT}
		</h6>

		
        <form class="ui form" action="" method="post" id="form-register">
			{if isset($NICKNAMES)}
			  <div class="field">
				<label>{$NICKNAME}</label>
				<input type="text" name="{if isset($MINECRAFT)}nickname{else}username{/if}" id="username" value="{if isset($MINECRAFT)}{$NICKNAME_VALUE}{else}{$USERNAME_VALUE}{/if}" placeholder="{$NICKNAME}" tabindex="1">
			  </div>
			  {if isset($MINECRAFT)}
				<div class="field">
				  <label>{$MINECRAFT_USERNAME}</label>
				  <input type="text" name="username" id="mcname" value="{$USERNAME_VALUE}" placeholder="{$MINECRAFT_USERNAME}" tabindex="2">
				</div>
			  {/if}
			{else}
			  {if isset($MINECRAFT)}
				<div class="field">
				  <label>{$MINECRAFT_USERNAME}</label>
				  <input type="text" name="username" id="mcname" value="{$USERNAME_VALUE}" placeholder="{$MINECRAFT_USERNAME}" tabindex="1">
				</div>
			  {else}
				<div class="field">
				  <label>{$MINECRAFT_USERNAME}</label>
				  <input type="text" name="username" id="mcname" value="{$USERNAME_VALUE}" placeholder="{$NICKNAME}" tabindex="1">
				</div>
			  {/if}
			{/if}
			<div class="field">
			  <label>{$EMAIL}</label>
			  <input type="email" name="email" id="email" value="{$EMAIL_VALUE}" placeholder="{$EMAIL}" tabindex="3">
			</div>
			<div class="field">
			  <label>{$PASSWORD}</label>
			  <input type="password" name="password" id="password" placeholder="{$PASSWORD}" tabindex="4">
			</div>
			<div class="field">
			  <label>{$CONFIRM_PASSWORD}</label>
			  <input type="password" name="password_again" id="password_again" placeholder="{$CONFIRM_PASSWORD}" tabindex="5">
			</div>
			{if count($CUSTOM_FIELDS)}
			  {foreach $CUSTOM_FIELDS as $field}
				  <div class="field">
				  <label>{$field.name}</label>
					  {if $field.type eq 1}
					  <input type="text" name="{$field.name}" id="{$field.name}" value="{$field.value}" placeholder="{$field.name}" tabindex="5">
					  {elseif $field.type eq 2}
					  <textarea name="{$field.name}" id="{$field.name}" placeholder="{$field.description}" tabindex="5"></textarea>
					  {elseif $field.type eq 3}
					  <input type="date" name="{$field.name}" id="{$field.name}" value="{$field.value}" tabindex="5">
					  {/if}
				  </div>
			  {/foreach}
			{/if}
			{if isset($RECAPTCHA)}
			  <div class="field">
				<div class="{$CAPTCHA_CLASS}" data-sitekey="{$RECAPTCHA}" tabindex="6"></div>
			  </div>
			{/if}
			<div class="inline field">
			  <div class="ui checkbox">
				<input type="checkbox" name="t_and_c" id="t_and_c" value="1" tabindex="7">
				<label for="t_and_c">{$AGREE_TO_TERMS}</label>
			  </div>
			</div>
			<input type="hidden" name="token" value="{$TOKEN}">
			<input type="submit" class="ui primary button" value="{$REGISTER}" tabindex="8">
		  </form>
		
      <div class="social-auth-links text-center">
        <p>- OR -</p>
        <a href="{$LOGIN_URL}" class="btn btn-block btn-primary">
          <i class="fa fa-key mr-2"></i>
          {$LOG_IN}
		</a>
      </div>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="{$TEMPLATE_PATH}/assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="{$TEMPLATE_PATH}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="{$TEMPLATE_PATH}/assets/plugins/adminlte/js/adminlte.min.js"></script>
</body>
</html>
