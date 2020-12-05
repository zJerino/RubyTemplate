<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        {if (isset($MZ.OPTIONS.TITLE_POSITION) && $MZ.OPTIONS.TITLE_POSITION == "1")}
            <title>{$TITLE} &bull; {$SITE_NAME}</title>
            <meta property="og:title" content="{$TITLE} &bull; {$SITE_NAME}" />
        {elseif (isset($MZ.OPTIONS.TITLE_POSITION) && $MZ.OPTIONS.TITLE_POSITION == "2")}
            <title>{$SITE_NAME} &bull; {$TITLE}</title>
            <meta property="og:title" content="{$SITE_NAME} &bull; {$TITLE}" />
        {else}
            <title>{$TITLE} &bull; {$SITE_NAME}</title>
            <meta property="og:title" content="{$TITLE} &bull; {$SITE_NAME}" />
        {/if}

        <meta name="author" content="zJerino">
        
        {if isset($PAGE_DESCRIPTION) && $PAGE_DESCRIPTION|count_characters > 0}
            <meta name="description" content="{$PAGE_DESCRIPTION}" />
            <meta property="og:description" content="{$PAGE_DESCRIPTION}" />
        {else}
            <meta name="description" content="{$MZ.SETTINGS.DESCRIPTION}" />
            <meta property="og:description" content="{$MZ.SETTINGS.DESCRIPTION}" />
        {/if}

        {if isset($PAGE_KEYWORDS) && $PAGE_KEYWORDS|count_characters > 0}
            <meta name="keywords" content="{$PAGE_KEYWORDS}" />
        {/if}

        
        <!-- Open Graph Properties -->
        <meta property="og:type" content="website" />
        <meta property="og:url" content="{$OG_URL}" />
        <meta property="og:image" content="{$MZ.SETTINGS.FAVICON}" />

        <all-css>
            {foreach from=$TEMPLATE_CSS item=css}
                {$css}
            {/foreach}
        </all-css>
    </head>
    <body>
        <!--[if lt IE 12]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->