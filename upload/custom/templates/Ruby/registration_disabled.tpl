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
	<div class="callout callout-danger d-flex">
        <a href="{$SITE_HOME}" class="btn btn-light btn-small">
            <i class="fa fa-arrow-left"></i>
        </a>
        <span style="display: flex;align-items: center;padding: 0 2rem;">
            {if (empty($REGISTRATION_DISABLED))}
                Registration is currently disabled.
            {else}
                {$REGISTRATION_DISABLED}
            {/if}
        </span>
    </div>
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
