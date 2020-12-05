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
        <meta name="author" content="zJerino">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
          
        <title>{$TITLE} &bull; {$SITE_NAME}</title>
        <meta name="description" content="{$RUBY.GENERAL.DESCRIPTION}">
        <link rel="shortcut icon" href="{$RUBY.GENERAL.FAVICON}" type="image/x-icon">
        <link rel="apple-touch-icon" href="{$RUBY.GENERAL.FAVICON}">
        <meta rel="app-color" content="{$RUBY.GENERAL.COLOR}">
        <script src="{$TEMPLATE_PATH}/assets/js/turbolinks.js"></script>
        <script src="{$TEMPLATE_PATH}/assets/js/RubyTemplate.js"></script>

        {if ($PAGE == "members")}
            <meta name="turbolinks-visit-control" content="reload">
            <meta name="turbolinks-cache-control" content="no-preview">
        {else}
            <meta name="turbolinks-cache-control" content="no-cache">
        {/if}
        <script>
            var widget_card = 'card-{$RUBY.WIDGETS.COLOR} card-{$RUBY.WIDGETS.LAYOUT}';
        </script>
        {foreach from=$TEMPLATE_CSS item=css}
            {$css}
        {/foreach}
    </head>
    <body class="sidebar-mini layout-fixed" id="page-{$PAGE}" style="height: auto;" >
        <div id="particles-js"></div>
          <div class="wrapper">
            {if (isset($BACKEND) && $BACKEND == "true")}
                {include file='../../../custom/templates/Ruby/navbar.tpl'}
            {else}
                {include file='navbar.tpl'}
            {/if}
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Main content -->
                <div class="content pt-4 px-2">
                    {if (count($WIDGETS_LEFT) && count($WIDGETS_RIGHT) || isset($RESOURCES_PANEL) || isset($RECURSOSCHIDOS))}
                        <div class="container-fluid">
                    {else}
                        <div class="container">
                    {/if}
                    {if !empty($ANNOUNCEMENTS)}
                            {foreach from=$ANNOUNCEMENTS item=$ANNOUNCEMENT}
                                <div class="callout callout-primary" id="announcement-{$ANNOUNCEMENT->id}" style="border-color:{$ANNOUNCEMENT->background_colour}; color:{$ANNOUNCEMENT->text_colour}">
                                    <h5>{$ANNOUNCEMENT->header}</h5>
                
                                    <p>{$ANNOUNCEMENT->message}</p>
                                </div>
                            {/foreach}
                        {/if}
                            <div class="row justify-content-center" id="container-content">
                                {if (isset($USER_PANEL))}
                                    
                                    <div class="col-lg-3">
                                        {include file='user/navigation.tpl'}
                                    </div>
                                    <div class="col-lg-9" id="content-general">
                                {elseif (isset($MEMBER_PANEL))}
                                    <div class="col-lg-4">
                                        <div class="card card-outline card-primary">
                                            <div class="card-header">
                                                {$GROUP}
                                            </div>
                                            <div class="card-body">
                                                <ul class="nav nav-pills flex-column" id="dsasd" role="tablist">
                                                    <li class="nav-item">
                                                        <a href="{$ALL_LINK}" class="nav-link" target="">{$DISPLAY_ALL}</a>
                                                    </li>
                                                    {foreach from=$GROUPS item=item key=key}
                                                        <li class="nav-item">
                                                            <a class="nav-link" id="sad-{$key}" href="{$item.grouplink}" target="">{$item.groupname} </a>
                                                        </li>
                                                    {/foreach}
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8" id="content-general">
                                {elseif (isset($RESOURCES_PANEL))}
                                    <div class="col-lg-3">
	                                    {include file='resources/categories.tpl'}                                        
                                    </div>
                                    <div class="col-lg-9" id="content-general">
                                {else}
                                    {if ($PAGE == "profile")}
                                        {if (count($WIDGETS) || $WIDGETS_LEFT || $WIDGETS_RIGHT)}
                                            <div class="col-lg-3 order-2">
                                                {foreach from=$WIDGETS item=item}
                                                    {$item}
                                                {/foreach}
                                                {foreach from=$WIDGETS_LEFT item=item}
                                                    {$item}
                                                {/foreach}
                                                {foreach from=$WIDGETS_RIGHT item=item}
                                                    {$item}
                                                {/foreach}
                                            </div>
                                        {/if}
                                        <div class="col-lg-9 order-1" id="content-general">
                                    {elseif (count($WIDGETS))}
                                        <div class="col-lg-3 order-2">
                                            {foreach from=$WIDGETS item=item}
                                                {$item}
                                            {/foreach}
                                        </div>
                                        <div class="col-lg-9 order-1" id="content-general">
                                    {elseif (count($WIDGETS_LEFT) && count($WIDGETS_RIGHT))}
                                        <div class="col-lg-3 order-last order-lg-1">
                                            {foreach from=$WIDGETS_LEFT item=item}
                                                {$item}
                                            {/foreach}
                                        </div>
                                        <div class="col-lg-3 order-3">
                                            {foreach from=$WIDGETS_RIGHT item=item}
                                                {$item}
                                            {/foreach}
                                        </div>
                                        <div class="col-lg-6 order-2" id="content-general">
                                    {elseif (count($WIDGETS_LEFT) && !count($WIDGETS_RIGHT))}
                                        <div class="col-lg-3 order-last order-lg-1">
                                            {foreach from=$WIDGETS_LEFT item=item}
                                                {$item}
                                            {/foreach}
                                        </div>
                                        <div class="col-lg-9 order-2">
                                    {elseif (!count($WIDGETS_LEFT) && count($WIDGETS_RIGHT))}
                                        <div class="col-lg-3 order-2">
                                            {foreach from=$WIDGETS_RIGHT item=item}
                                                {$item}
                                            {/foreach}
                                        </div>
                                        <div class="col-lg-9 order-1" id="content-general">
                                    {elseif (!count($WIDGETS_LEFT) && !count($WIDGETS_RIGHT) && !count($WIDGETS))}
                                            <div class="col-lg-10">
                                    {/if}
                                {/if}