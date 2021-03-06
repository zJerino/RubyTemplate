<!DOCTYPE html>
<html{if "HTML_CLASS"|defined} {$smarty.const.HTML_CLASS}{/if} lang="{if "HTML_LANG"|defined}{$smarty.const.HTML_LANG}{else}en{/if}" {if "HTML_RTL"|defined && $smarty.const.HTML_RTL eq true} dir="rtl"{/if} mode="light">
<head>
    <!-- Standard Meta -->
    <meta charset="{if "LANG_CHARSET"|defined}{$smarty.const.LANG_CHARSET}{else}utf-8{/if}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <!-- Site Properties -->
    <title>{$TITLE} &bull; {$smarty.const.SITE_NAME}</title>
    <meta name="author" content="{$smarty.const.SITE_NAME}">

    {if isset($PAGE_DESCRIPTION) && $PAGE_DESCRIPTION|count_characters > 0}
        <meta name="description" content="{$PAGE_DESCRIPTION}" />
    {/if}

    {if isset($PAGE_KEYWORDS) && $PAGE_KEYWORDS|count_characters > 0}
        <meta name="keywords" content="{$PAGE_KEYWORDS}" />
    {/if}

    <meta property="og:title" content="{$TITLE} &bull; {$smarty.const.SITE_NAME}" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="{$OG_URL}" />
    <meta property="og:image" content="{$CONFIG_PATH}core/assets/img/site_image.png';" />

    {if isset($PAGE_DESCRIPTION) && $PAGE_DESCRIPTION|count_characters > 0}
        <meta property="og:description" content="{$PAGE_DESCRIPTION}" />
    {/if}

    {foreach from=$TEMPLATE_CSS item=css}
        {$css}
    {/foreach}

    <meta name="robots" content="noindex">
</head>

<body class="page-maintenance">

    <div class="card card-revamp">
        <div class="card-body text-center">
            <h3 class="border-bottom mb-4">{$MAINTENANCE_TITLE}</h2>

            <h5>{$MAINTENANCE_MESSAGE}</h4>
            <div class="btn-group mt-4" role="group">
                <a href="" class="btn btn-primary" onclick="window.location.reload()">{$RETRY}</a>
            </div>
        </div>
    </div>

</body>
</html>